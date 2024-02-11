local ns = vim.api.nvim_create_namespace("live-tests")
local current_buffer_filename = "./" .. vim.fn.expand("%:.")

local function initialize_tests(ruby_bufnr, command)
  vim.api.nvim_buf_clear_namespace(ruby_bufnr, ns, 0, -1)

  local state = { tests = {} }

  vim.fn.jobstart(command, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        for _, line in ipairs(data) do
          if pcall(vim.json.decode, line) then
            local example = vim.json.decode(line)

            if example.status == "passed" or example.status == "failed" then
              table.insert(state.tests, example)
            end
          end
        end
      end
    end,

    on_exit = function()
      local failed = {}
      for _, test in pairs(state.tests) do
        local test_line = test.line_number
        local filename = test.file_path

        if filename == current_buffer_filename then
          local text

          if test.status == "passed" then
            text = { "✓" }
          else
            text = { "×", "Error" }
          end

          vim.api.nvim_buf_set_extmark(ruby_bufnr, ns, test_line, 0, {
            virt_text = { text },
          })

          if test.status == "failed" then
            table.insert(failed, {
              bufnr = ruby_bufnr,
              lnum = test_line,
              col = 0,
              severity = vim.diagnostic.severity.ERROR,
              source = "live-tests",
              message = string.format("test failed"),
              user_data = {},
            })
          end
        end
      end

      vim.diagnostic.set(ns, ruby_bufnr, failed, {})
    end,
  })
end

local attach_to_buffer = function(ruby_bufnr, command)
  vim.api.nvim_create_autocmd({ "BufNew", "BufWritePost" }, {
    group = vim.api.nvim_create_augroup(
      string.format("live-tests-%s", ruby_bufnr),
      { clear = true }
    ),
    pattern = "*.rb",
    callback = function()
      initialize_tests(ruby_bufnr, command)
    end,
  })
end

if string.find(current_buffer_filename, "spec") then
  attach_to_buffer(vim.fn.bufnr(), {
    "/home/cypher/Scripts/nvim/ruby_autotest.sh",
    current_buffer_filename,
  })

  print("Ruby autotest attached to buffer")
end
