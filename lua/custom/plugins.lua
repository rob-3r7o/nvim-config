local plugins = {
  {
    "jiaoshijie/undotree",
    config = function()
      require('undotree').setup()
    end,
    dependencies  = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "pylsp",
        "black",
      }
    }
  },
  {
    "kdheepak/lazygit.nvim",

    config = function()
      require("lazy").setup()
    end,
    dependencies  = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    config = function()
      require('custom.configs.barbar-config').setup()
    end,
  },
  {
    "numToStr/FTerm.nvim",
    event = "VeryLazy",
    config = function()
      require('custom.configs.fterm-config')
    end,
  },
}

return plugins
