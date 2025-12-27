return {
  "uga-rosa/ccc.nvim",
  config = function()
    local ccc = require("ccc")
    ccc.setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
      outputs = {
        ccc.output.hex,
        ccc.output.css_rgb,
      },
    })
  end,
}
