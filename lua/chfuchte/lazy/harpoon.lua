return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
        vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)

        vim.keymap.set("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end)
        vim.keymap.set("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end)
        vim.keymap.set("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end)
        vim.keymap.set("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end)
        vim.keymap.set("n", "<leader>5", function() require("harpoon.ui").nav_file(5) end)
        vim.keymap.set("n", "<leader>6", function() require("harpoon.ui").nav_file(6) end)
        vim.keymap.set("n", "<leader>7", function() require("harpoon.ui").nav_file(7) end) 
        vim.keymap.set("n", "<leader>8", function() require("harpoon.ui").nav_file(8) end)
        vim.keymap.set("n", "<leader>9", function() require("harpoon.ui").nav_file(9) end)

        vim.keymap.set("n", "<leader>rh1", function() require("harpoon.mark").set_current_at(1) end)
        vim.keymap.set("n", "<leader>rh2", function() require("harpoon.mark").set_current_at(2) end)
        vim.keymap.set("n", "<leader>rh3", function() require("harpoon.mark").set_current_at(3) end)
        vim.keymap.set("n", "<leader>rh4", function() require("harpoon.mark").set_current_at(4) end)
        vim.keymap.set("n", "<leader>rh5", function() require("harpoon.mark").set_current_at(5) end)
        vim.keymap.set("n", "<leader>rh6", function() require("harpoon.mark").set_current_at(6) end)
        vim.keymap.set("n", "<leader>rh7", function() require("harpoon.mark").set_current_at(7) end)
        vim.keymap.set("n", "<leader>rh8", function() require("harpoon.mark").set_current_at(8) end)
        vim.keymap.set("n", "<leader>rh9", function() require("harpoon.mark").set_current_at(9) end)
    end
}
