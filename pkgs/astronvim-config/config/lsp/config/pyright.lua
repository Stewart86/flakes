return function(opts)
  opts.root_dir = require("lspconfig.util").root_pattern { ".git", "pyproject.toml" }
  opts.settings = {
    python = {
      analysis = {
        typeCheckMode = "strict",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        exclude = { "**/tests" },
      },
    },
  }
  return opts
end
