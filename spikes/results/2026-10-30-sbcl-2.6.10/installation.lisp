(:kind :local-sbcl-installation :date "2026-10-30" :version "2.6.10"
 :architecture :arm64 :bootstrap-version "2.6.9" :source :official-release
 :url "https://prdownloads.sourceforge.net/sbcl/sbcl-2.6.10-source.tar.bz2"
 :source-sha256 "c23eac1d0aa9ae0add7eb741f3c91b816f5ce216147f37b99da1578e5261b17c"
 :digest-method :sha256-of-downloaded-bytes
 :prefix "/Users/gpicchiarelli/.local/sbcl/2.6.10"
 :launcher "/Users/gpicchiarelli/.local/bin/sbcl"
 :runtime-sha256 "321b6b41e1070dcccac8f256b72de98cb1f40ccb3e8e9c5b5db2b36c984033e5"
 :core-sha256 "c8502faa8a85827cf2fd830cf36f25cd59cc9dae507ef952bf9c3fd7f8ba15f3"
 :build-command "CC=clang SBCL_MAKE_JOBS=-j4 sh make.sh --prefix=/Users/gpicchiarelli/.local/sbcl/2.6.10 --arch=arm64 --xc-host='/opt/homebrew/bin/sbcl --dynamic-space-size 2048 --noinform --no-sysinit --no-userinit --disable-debugger' --dynamic-space-size=2048 --with-sb-thread --without-sb-core-compression"
 :smoke (:version :ok :machine :arm64 :sb-thread :ok :sb-posix :ok :sb-cover :ok :sb-cltl2 :ok)
 :ci-toolchain-changed nil :homebrew-installation-replaced nil)
