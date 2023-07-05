return function()
  return {
    cmd = { "eslint_d", "--stdio" },
    root_dir = require("lspconfig.util").root_pattern(".eslintrc.js", "packages.json", ".git", ".env"),
  }
end
