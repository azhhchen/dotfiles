-- Inspired from devaslife and folke dotfiles.
-- It will force you to use more efficient Vim "count" motions.
-- If you don't, you will be punished with a 2-second freeze.

local M = {}

function M.patient()
  local count = 0
  local frozen = false
  local timer = assert(vim.uv.new_timer())
  local freeze_timer = assert(vim.uv.new_timer())

  local snacks_available, Snacks = pcall(require, "snacks")

  local safe_notify = vim.schedule_wrap(function(msg, level)
    if snacks_available and Snacks.notifier and Snacks.notifier.notify then
      Snacks.notifier.notify(msg, "warn", { style = "compact", timeout = 5000, title = "Patient" })
    else
      vim.notify(msg, level, { icon = "😴", id = "patient" })
    end
  end)

  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    vim.keymap.set("n", key, function()
      -- Exclude some filetypes
      if not vim.bo.modifiable or vim.bo.buftype == "nofile" then
        return key
      end

      if frozen then
        return ""
      end

      if vim.v.count > 0 then
        count = 0
      end

      count = count + 1

      if count == 1 then
        timer:start(2000, 0, function()
          count = 0
        end)
      end

      if count >= 25 then
        frozen = true
        safe_notify("Take it easy. Use `count` instead of key-repeating!", vim.log.levels.WARN)

        freeze_timer:start(3000, 0, function()
          frozen = false
          count = 0
        end)

        return ""
      end

      return key
    end, { expr = true, silent = true })
  end
end

return M
