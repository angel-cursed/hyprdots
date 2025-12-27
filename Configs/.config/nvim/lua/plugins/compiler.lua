return {
  "Zeioth/compiler.nvim",
  dependencies = {
    {
      "stevearc/overseer.nvim",
      opts = {
        task_list = {
          direction = "bottom",
          min_height = 25,
          max_height = 25,
          default_detail = 1,
        },
      },
    },
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("compiler").setup()
  end,
}
