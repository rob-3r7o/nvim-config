local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>u"] = {
      "<cmd>lua require('undotree').toggle()<CR>",
      "Undo-Tree"
    },
    ["<leader>dt"] = {
      "<cmd> DiagnosticToggle <CR>",
      "Toggle Diagnostic"
    },
  }
}

return M
