# sed -i 's/\[!WARNING\]\s*/**⚠️ 警告**：/g' ./README.md
# sed -i 's/\[!NOTE\]\s*/**ℹ️ 提醒**：/g' ./README.md

rm README.md
cp README.mdb.md README.md

rm -fr code
rm -fr .github

wget https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js
wget https://raw.githubusercontent.com/badboy/mdbook-mermaid/main/src/bin/assets/mermaid-init.js

mkdir theme
cd theme
wget https://raw.githubusercontent.com/slowsage/mdbook-pagetoc/main/src/pagetoc.css
wget https://raw.githubusercontent.com/slowsage/mdbook-pagetoc/main/src/pagetoc.js
wget https://raw.githubusercontent.com/tommilligan/mdbook-admonish/294af2478c7876874d4b0afe536dfaaa9036745f/src/bin/assets/mdbook-admonish.css
cd ..