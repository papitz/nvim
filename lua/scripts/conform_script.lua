-- Copy these helper functions directly
local function run_formatter(cmd, cwd, buffer_text)
  local proc = vim.system(cmd, {
    cwd = cwd,
    stdin = buffer_text,
    text = true,
  })
  local ret = proc:wait()
  if ret.code == 0 then
    print("Success\n--------")
  else
    print("Failure\n--------")
  end
  print(ret.stdout)
  print(ret.stderr)
end

local function read_file(path)
  local file = assert(io.open(path, "r"))
  local content = file:read("*a")
  file:close()
  return content
end

-- Edit these lines to match the values you see in your conform log file
-- To test a stdin formatter
run_formatter({ "/home/paul/fvm/default/bin/dart", "format"}, "/home/paul/Projects/EFGH/flutter-template", read_file("/home/paul/Projects/EFGH/flutter-template/lib/models/example_data.dart"))
