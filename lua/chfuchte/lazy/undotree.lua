return {
  "mbbill/undotree",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
    {
      "<leader>u",
      vim.cmd.UndotreeToggle,
    }
  },
    config = function ()
        vim.g.undotree_DiffCommand = "FC"
    end
}
