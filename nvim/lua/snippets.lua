-----------------------------
-- Custom Snippet Dispatch
-----------------------------
local Snips = {}

Snips.registry = {
    cmake = {
        lines = function()
            return {
                "cmake_minimum_required(VERSION 3.23)",
                "project(MyProject VERSION 1.0 LANGUAGES CXX)",
                "",
                "set(CMAKE_CXX_STANDARD 17)",
                "set(CMAKE_CXX_STANDARD_REQUIRED ON)",
                "set(CMAKE_CXX_EXTENSIONS OFF)",
                "",
                "set(CMAKE_EXPORT_COMPILE_COMMANDS ON)",

                "# Dependencies (examples)",
                "# find_package(____ REQUIRED)",
                "# find_package(____ REQUIRED)",
                "",
                "# Main target",
                "add_executable(${PROJECT_NAME})",
                "",
                "# Sources",
                "file(GLOB_RECURSE PROJECT_SOURCES CONFIGURE_DEPENDS",
                "   \"${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp\"",
                ")",
                "target_sources(${PROJECT_NAME} PRIVATE ${PROJECT_SOURCES})",
                "",
                "# Headers",
                "target_include_directories(${PROJECT_NAME}",
                "   PRIVATE \"${CMAKE_CURRENT_SOURCE_DIR}/include\"",
                ")",
                "",
                "# Compilation Flags",
                "target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)",
            }
        end,
  },

  contest = {
    lines = function()
      return {
        "#include <bits/stdc++.h>",
        "using namespace std;",
        "",
        "int main() {",
        "    ios::sync_with_stdio(false);",
        "    cin.tie(nullptr);",
        "    return 0;",
        "}",
      }
    end,
  },
}

--------------------------
-- Snippet User Command
--------------------------
vim.api.nvim_create_user_command("Snippet", function(opts)
  local spec = Snips.registry[opts.args]
  if not spec then
    vim.notify(("Unknown snippet: %q"):format(opts.args), vim.log.levels.WARN)
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, spec.lines())
end, {
  desc = "Insert Custom Snippet",
  nargs = 1,

  complete = function(arglead, cmdline, cursorpos)
    local keys = {}
    for k, _ in pairs(Snips.registry) do
      table.insert(keys, k)
    end
    table.sort(keys)
    return keys
  end,

  preview = function(opts, preview_bufnr)
    local spec = Snips.registry[opts.args]
    vim.api.nvim_buf_set_lines(preview_bufnr, 0, -1, false, spec.lines())
  end,
})
