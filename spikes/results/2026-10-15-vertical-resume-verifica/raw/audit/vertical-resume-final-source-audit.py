from pathlib import Path
import hashlib
mapping=dict(line.split('\t') for line in Path('spikes/out/vertical-resume-final-source-blobs.tsv').read_text().splitlines())
base=Path('spikes/out/vertical-resume-final-sources')
count=0
missing=set()
for p in base.rglob('*.txt'):
    name=str(p.relative_to(base))[:-4]
    if name not in mapping:
        missing.add(name)
        continue
    data=p.read_bytes()
    digest=hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()
    assert digest==mapping[name],name
    count+=1
assert missing=={'spikes/results/README.md'},missing
assert count==13,count
print('13 sorgenti finali identici ai blob del controllo completo.')
print('spikes/results/README.md e fuori dal fingerprint dei sorgenti: copia ausiliaria, senza attribuzione al record.')
