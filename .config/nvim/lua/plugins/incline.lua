local devicons = require("nvim-web-devicons")
return {
  "b0o/incline.nvim",
  -- Optional: Lazy load Incline
  event = "VeryLazy",
  config = function()
    require("incline").setup({
      render = function(props)
        -- Get the current working directory (project root)
        local cwd = vim.fn.getcwd()
        -- Get the full path of the buffer
        local full_path = vim.api.nvim_buf_get_name(props.buf)
        local filename = full_path

        if filename == "" then
          filename = "[No Name]"
        else
          -- Make the path relative to cwd if it's under the project directory
          if vim.fn.match(full_path, "^" .. vim.fn.escape(cwd, "[-\\]")) == 0 then
            filename = vim.fn.fnamemodify(full_path, ":~:.")
          else
            -- If not under project directory, show full path with home directory collapsed
            filename = vim.fn.fnamemodify(full_path, ":~")
          end
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local function get_git_diff()
          local icons = { removed = "", changed = "", added = "" }
          local signs = vim.b[props.buf].gitsigns_status_dict
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { "┊ " })
          end
          return labels
        end

        local function get_diagnostic_label()
          local icons = { error = "", warn = "", info = "", hint = "" }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { "┊ " })
          end
          return label
        end

        return {
          { get_diagnostic_label() },
          { get_git_diff() },
          { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
          { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
        }
      end,
    })
  end,
}
