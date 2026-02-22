
-- Competitive Programming Skeleton
vim.api.nvim_create_user_command("CPSkeleton", function()
  local lines = {
    "#include <bits/stdc++.h>",
    "using namespace std;",
    "",
    "int main() {",
    "    std::ios::sync_with_stdio(false);",
    "    std::cin.tie(nullptr);",
    "    ",
    "    ",
    "    return 0;",
    "}",
  }
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
end, {})


