/* Progressive enhancement. Reading and navigation work without JavaScript. */
(() => {
  "use strict";
  const root = document.documentElement;
  const base = new URL(document.body.dataset.root || "./", document.baseURI);
  const themeButton = document.querySelector(".theme-toggle");
  const themes = ["system", "light", "dark"];
  let theme = "system";
  try { theme = localStorage.getItem("arcdocdb-theme") || "system"; } catch (_) { /* Private browsing. */ }
  if (!themes.includes(theme)) theme = "system";
  function applyTheme() {
    if (theme === "system") delete root.dataset.theme;
    else root.dataset.theme = theme;
    themeButton.setAttribute("aria-label", `Appearance: ${theme}. Change appearance`);
    themeButton.title = `Appearance: ${theme}`;
    // The existing mark has explicit variants; select the one matching the page.
    const dark = theme === "dark" || (theme === "system" && matchMedia("(prefers-color-scheme: dark)").matches);
    const mark = document.querySelector(".wordmark picture");
    mark.querySelector("source").media = dark ? "all" : "not all";
  }
  themeButton.hidden = false;
  applyTheme();
  themeButton.addEventListener("click", () => {
    theme = themes[(themes.indexOf(theme) + 1) % themes.length];
    try {
      if (theme === "system") localStorage.removeItem("arcdocdb-theme");
      else localStorage.setItem("arcdocdb-theme", theme);
    } catch (_) { /* Optional preference. */ }
    applyTheme();
  });
  matchMedia("(prefers-color-scheme: dark)").addEventListener("change", applyTheme);

  const dialog = document.querySelector(".search-dialog");
  const dialogInput = dialog.querySelector("input");
  function openSearch(event) {
    if (!dialog.showModal) return;
    event.preventDefault();
    if (!dialog.open) dialog.showModal();
    dialogInput.focus();
  }
  document.querySelectorAll("[data-search-open]").forEach(link => link.addEventListener("click", openSearch));
  document.querySelector("[data-search-close]").addEventListener("click", () => dialog.close());
  dialog.addEventListener("click", event => {
    const bounds = dialog.getBoundingClientRect();
    if (event.target === dialog && (event.clientX < bounds.left || event.clientX > bounds.right || event.clientY < bounds.top || event.clientY > bounds.bottom)) dialog.close();
  });
  document.addEventListener("keydown", event => {
    if ((event.metaKey || event.ctrlKey) && event.key.toLowerCase() === "k") openSearch(event);
  });
  const normalize = value => value.normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
  let indexPromise;
  function loadIndex() {
    if (!indexPromise) {
      indexPromise = fetch(new URL("search-index.json", base), {credentials: "omit", referrerPolicy: "no-referrer"}).then(response => {
        if (!response.ok) throw new Error("Index unavailable");
        return response.json();
      }).then(pages => pages.map(page => ({...page, name: normalize(page.title), body: normalize(page.text), pathKey: normalize(page.path)})))
        .catch(error => { indexPromise = undefined; throw error; });
    }
    return indexPromise;
  }
  function highlighted(text, terms) {
    const fragment = document.createDocumentFragment();
    // Highlight literal terms only; no user input is interpreted as HTML or regex.
    const lowered = normalize(text);
    let position = 0;
    while (position < text.length) {
      let best = text.length, length = 0;
      for (const term of terms) {
        const found = lowered.indexOf(term, position);
        if (found >= 0 && found < best) { best = found; length = term.length; }
      }
      fragment.append(document.createTextNode(text.slice(position, best)));
      if (!length) break;
      const mark = document.createElement("mark");
      mark.textContent = text.slice(best, best + length);
      fragment.append(mark);
      position = best + length;
    }
    return fragment;
  }
  for (const form of document.querySelectorAll(".search-form")) {
    const container = form.closest("dialog") || form.closest("article");
    const input = form.querySelector("input");
    const status = container.querySelector(".search-status");
    const results = container.querySelector(".search-results");
    let timer, generation = 0;
    async function search() {
      const current = ++generation;
      const query = input.value.trim().slice(0, 160);
      const terms = normalize(query).split(/\s+/).filter(Boolean).slice(0, 8);
      results.replaceChildren();
      if (!terms.length) { status.textContent = "Search the complete manual. Words are matched locally in your browser."; return; }
      status.textContent = "Searching…";
      try {
        const pages = await loadIndex();
        if (current !== generation) return;
        const matches = pages.map(page => {
          let score = 0;
          for (const term of terms) {
            const inName = page.name.includes(term), inPath = page.pathKey.includes(term), inBody = page.body.includes(term);
            if (!inName && !inPath && !inBody) return null;
            score += (inName ? 20 : 0) + (inPath ? 8 : 0) + (inBody ? 1 : 0);
          }
          return {page, score: score + (page.name === normalize(query) ? 100 : 0)};
        }).filter(Boolean).sort((a, b) => b.score - a.score || a.page.path.localeCompare(b.page.path));
        status.textContent = matches.length ? `${matches.length} matching ${matches.length === 1 ? "document" : "documents"}${matches.length > 30 ? ". Showing the first 30" : ""}.` : "No documents found. Try fewer words or an API identifier.";
        for (const {page} of matches.slice(0, 30)) {
          const item = document.createElement("li"), link = document.createElement("a");
          link.href = new URL(page.url, base).href;
          const group = document.createElement("span"); group.className = "search-result-group"; group.textContent = page.group;
          const title = document.createElement("h3"); title.append(highlighted(page.title, terms));
          const position = Math.max(0, page.body.indexOf(terms[0]) - 65);
          const excerpt = (position ? "…" : "") + page.text.slice(position, position + 200) + "…";
          const snippet = document.createElement("p"); snippet.append(highlighted(excerpt, terms));
          link.append(group, title, snippet); item.append(link); results.append(item);
        }
      } catch (_) {
        if (current === generation) status.textContent = "Search is unavailable. You can still browse All documents.";
      }
    }
    form.addEventListener("submit", event => { event.preventDefault(); clearTimeout(timer); search(); });
    input.addEventListener("input", () => { clearTimeout(timer); ++generation; timer = setTimeout(search, 160); });
    // Enable only after submit is intercepted. No-JS and script-failure paths
    // must never fall back to sending a query through a hosting request.
    form.querySelectorAll("input, button").forEach(control => { control.disabled = false; });
    input.value = "";
  }

  // Keep diagrams optional: source remains readable even if rendering fails.
  const diagrams = document.querySelectorAll("pre.mermaid");
  if (diagrams.length) {
    const render = async () => {
      if (!window.mermaid) return;
      const dark = getComputedStyle(root).colorScheme === "dark";
      mermaid.initialize({startOnLoad: false, securityLevel: "strict", theme: "base", fontFamily: "-apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif",
        themeVariables: {primaryColor: dark ? "#222224" : "#f5f5f7", primaryTextColor: dark ? "#f5f5f7" : "#1d1d1f", primaryBorderColor: dark ? "#a1a1a6" : "#6e6e73", lineColor: dark ? "#a1a1a6" : "#6e6e73", secondaryColor: dark ? "#222224" : "#f5f5f7", tertiaryColor: dark ? "#161617" : "#ffffff"}});
      for (const [n, block] of [...diagrams].entries()) {
        try {
          const {svg} = await mermaid.render(`arc-diagram-${n}`, block.textContent);
          const figure = document.createElement("figure"); figure.className = "diagram";
          // Mermaid's strict renderer sanitizes its own SVG; raw Markdown source
          // and search input never enter this HTML sink.
          figure.innerHTML = svg;
          const description = block.dataset.diagramDescription;
          const graphic = figure.querySelector("svg");
          if (graphic && description) {
            graphic.setAttribute("role", "img");
            graphic.setAttribute("aria-label", description);
          }
          const details = document.createElement("details"); details.className = "diagram-source";
          const summary = document.createElement("summary"); summary.textContent = "Diagram source";
          block.replaceWith(figure, details); details.append(summary, block);
        } catch (_) { /* Preserve original diagram source. */ }
      }
    };
    if (document.readyState === "complete") render(); else window.addEventListener("load", render, {once: true});
  }

  const tocLinks = [...document.querySelectorAll(".page-toc a[href^='#']")];
  if ("IntersectionObserver" in window && tocLinks.length) {
    const observer = new IntersectionObserver(entries => {
      for (const entry of entries) if (entry.isIntersecting) {
        for (const link of tocLinks) {
          if (link.hash.slice(1) === entry.target.id) link.setAttribute("aria-current", "location");
          else link.removeAttribute("aria-current");
        }
      }
    }, {rootMargin: "-100px 0px -65% 0px"});
    for (const link of tocLinks) {
      const target = document.getElementById(decodeURIComponent(link.hash.slice(1)));
      if (target) observer.observe(target);
    }
  }
})();
