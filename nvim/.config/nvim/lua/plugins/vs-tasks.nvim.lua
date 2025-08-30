-- plugins/vs-tasks.nvim.lua

return {
  "ethanjwright/vs-tasks.nvim",
  -- Tell LazyVim to load this plugin when these commands are used.
  cmd = { "Vstasks", "VstasksResume" },
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
  },
  config = function()
    -- Plugin setup
    require("vstask").setup({
      picker = "snacks",
      cache_json_conf = true,
      cache_strategy = "last",
      config_dir = ".vscode",
      support_code_workspace = true,
      telescope_keys = {
        vertical = "<C-v>",
        split = "<C-p>",
        tab = "<C-t>",
        current = "<CR>",
        background = "<C-b>",
        watch_job = "<C-w>",
        kill_job = "<C-d>",
        run = "<C-r>",
      },
    })

    -- Keymaps to make the plugin easy to use
    vim.api.nvim_set_keymap(
      "n",
      "<leader>vt",
      ":Vstasks<CR>",
      { noremap = true, silent = true, desc = "VS Code Tasks Menu" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>vr",
      ":VstasksResume<CR>",
      { noremap = true, silent = true, desc = "Resume last VS Code Task" }
    )
  end,
}
