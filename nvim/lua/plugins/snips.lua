return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  opts = function(_, opts)
    local ls = require("luasnip")

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    -- file filetype with :set ft
    -- Custom snippets
    ls.add_snippets("cpp", {
      -- Competitive programming template
      s({
        trig = "comp",
        name = "Competitive Programming Template",
        desc = "Basic CP template with common includes and macros",
      }, {
        t({
          "#include <bits/stdc++.h>",
          "using namespace std;",
          "#define ll long long",
          "#define pb push_back",
          "#define all(x) (x).begin(),(x).end()",
          "#define rall(x) (x).rbegin(),(x).rend()",
          "#define F first",
          "#define S second",
          "#define MOD 1000000007",
          "",
          "void solve() {",
          "    ",
        }),
        i(1),
        t({
          "",
          "}",
          "",
          "int main() {",
          "    ios_base::sync_with_stdio(0);",
          "    cin.tie(0);",
          "    int t = 1;",
          "    cin >> t;",
          "    while(t--) solve();",
          "    return 0;",
          "}",
        }),
      }),

      -- Fast input
      s({
        trig = "scan",
        name = "Fast Input",
        desc = "Template for fast input",
      }, {
        t("int "),
        i(1, "n"),
        t("; cin >> "),
        i(2, "n"),
        t(";"),
      }),

      -- Vector declaration
      s({
        trig = "vec",
        name = "Vector",
        desc = "Vector declaration",
      }, {
        t("vector<"),
        i(1, "int"),
        t("> "),
        i(2, "v"),
        t("("),
        i(3, "n"),
        t(");"),
      }),

      -- For loop
      s({
        trig = "fore",
        name = "For Loop",
        desc = "For each loop",
      }, {
        t("for(auto "),
        i(1, "x"),
        t(" : "),
        i(2, "v"),
        t({ ") {", "    " }),
        i(3),
        t({ "", "}" }),
      }),
    })
    ls.add_snippets("go", {
      s({
        trig = "errcheck",
        name = "error checking",
        desc = "explicit error handing",
      }, {
        t("if err != nil {"),
        t("panic(err)"),
        t("}"),
      }),
      s({
        trig = "errreturn",
        name = "error checking",
        desc = "explicit error handing",
      }, {
        t("if err != nil {"),
        t("return err"),
        t("}"),
      }),
    })
    return opts
  end,
}
