sed -i 's/\[!WARNING\]\s*/**⚠️ 警告**：/g' ./README.md
sed -i 's/\[!NOTE\]\s*/**ℹ️ 提醒**：/g' ./README.md

rm -fr code
rm -fr .github

wget https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js
wget https://raw.githubusercontent.com/badboy/mdbook-mermaid/main/src/bin/assets/mermaid-init.js