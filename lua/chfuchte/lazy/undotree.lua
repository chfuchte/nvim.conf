return {
  "mbbill/undotree",
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
