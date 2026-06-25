local M = {}

local passed = 0
local failed = 0
local errors = {}

function M.eq(desc, got, expected)
  if got == expected then
    passed = passed + 1
    print("  PASS: " .. desc)
  else
    failed = failed + 1
    local msg = string.format("  FAIL: %s\n    expected: %s\n    got:      %s", desc, tostring(expected), tostring(got))
    print(msg)
    table.insert(errors, msg)
  end
end

function M.neq(desc, got, unexpected)
  if got ~= unexpected then
    passed = passed + 1
    print("  PASS: " .. desc)
  else
    failed = failed + 1
    local msg = string.format("  FAIL: %s\n    did not expect: %s", desc, tostring(unexpected))
    print(msg)
    table.insert(errors, msg)
  end
end

function M.ok(desc, val)
  M.eq(desc, not not val, true)
end

function M.summary()
  print(string.format("\n%d passed, %d failed", passed, failed))
  if failed > 0 then
    vim.cmd("cquit 1")
  end
end

return M
