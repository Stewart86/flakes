return {
  cmd = { "eslint_d", "--stdio" },
  root_dir = require("lspconfig.util").root_pattern(".eslintrc.js", "packages.json", ".git", ".env"),
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
  },
}
