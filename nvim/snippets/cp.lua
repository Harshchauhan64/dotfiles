local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  -- Competitive Programming Boilerplate
  s("cp", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "#define long long ll",
      "",
      "solve(){",
      "}",
      "int main() {",
      "",
      "   solve();",
      "",
      "    return 0;",
      "}",
    }),
  }),
}
