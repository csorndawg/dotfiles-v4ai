-- luasnips c++ snippets
-- nvim.d/snippets/cpp.lua

local ls  = require("luasnip")
local s   = ls.snippet
local sn  = ls.snippet_node
local t   = ls.text_node
local i   = ls.insert_node
local f   = ls.function_node
local c   = ls.choice_node
local d   = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

------ Helpers ------ 

--- Convert a snake_case or lowercase name to UPPER_SNAKE for include guards
local function to_guard(args)
  local name = (args[1][1] or "header"):upper():gsub("[^%u%d]", "_")
  return { name .. "_HPP" }
end


------ Snippets ------ 

return {
  cpp = {

    -- ── 1. Header guard — function node mirrors filename ──────────────────
    s("guard", {
      t("#pragma once"), t({ "", "" }),
      t("// Also keeping old-style guard for compatibility"), t({ "", "" }),
      t("#ifndef "),
      f(function() return { vim.fn.expand("%:t:r"):upper() .. "_HPP" } end),
      t({ "", "#define " }),
      f(function() return { vim.fn.expand("%:t:r"):upper() .. "_HPP" } end),
      t({ "", "", "" }),
      i(1, "// content"),
      t({ "", "", "#endif // " }),
      f(function() return { vim.fn.expand("%:t:r"):upper() .. "_HPP" } end),
    }),

    -- ── 2. Class with Rule-of-Five — choice node selects which specials ───
    s("cls", fmt([[
class {} {{
public:
    // Constructor
    explicit {}({});

    // Rule of Five
    {}

    // Member functions
    {}

private:
    {}
}};
]], {
      i(1, "MyClass"),
      rep(1),
      i(2, ""),
      c(3, {
        -- Rule of Zero
        t("// Rule of Zero: compiler-generated defaults are fine"),
        -- Rule of Five (full)
        sn(nil, {
          t({ "~", "" }), rep(1), t({ "();                          // destructor", "" }),
          rep(1), t("(const "), rep(1), t({ "& other);             // copy ctor", "" }),
          rep(1), t("& operator=(const "), rep(1), t({ "& other); // copy assign", "" }),
          rep(1), t("("), rep(1), t({ "&& other) noexcept;         // move ctor", "" }),
          rep(1), t("& operator=("), rep(1), t("&& other) noexcept;// move assign"),
        }),
        -- Delete copy, default move (move-only)
        sn(nil, {
          rep(1), t({ "(const ", "" }), rep(1), t({ ") = delete;", "" }),
          rep(1), t("& operator=(const "), rep(1), t({ ") = delete;", "" }),
          rep(1), t("("), rep(1), t({ "&&) noexcept = default;", "" }),
          rep(1), t("& operator=("), rep(1), t(") noexcept = default;"),
        }),
      }),
      i(4, "// public methods"),
      i(5, "// data members"),
    })),

    -- ── 3. Template function ───────────────────────────────────────────────
    s("tpl", fmt([[
template <{}>
{} {}({}) {{
    {}
}}
]], {
      i(1, "typename T"),
      i(2, "auto"),
      i(3, "func_name"),
      i(4, "T val"),
      i(5, "return val;"),
    })),

    -- ── 4. Range-based for — choice: const ref vs structured binding ───────
    s("for", {
      t("for ("),
      c(1, {
        sn(nil, { t("const auto& "), i(1, "elem"), t(" : "), i(2, "container") }),
        sn(nil, { t("auto& "),       i(1, "elem"), t(" : "), i(2, "container") }),
        sn(nil, { t("auto&& "),      i(1, "elem"), t(" : "), i(2, "container") }),
        sn(nil, { t("auto ["), i(1, "k"), t(", "), i(2, "v"), t("] : "), i(3, "map") }),
      }),
      t({ ") {", "    " }),
      i(2, "// body"),
      t({ "", "}" }),
    }),

    -- ── 5. Lambda — dynamic node lets you choose capture list ─────────────
    s("lam", fmt([[
auto {} = [{}]({}) {} {{
    {}
}};
]], {
      i(1, "fn"),
      c(2, {
        t(""),
        t("&"),
        t("="),
        sn(nil, { t("&"), i(1, "captured_var") }),
        t("this"),
      }),
      i(3, ""),
      c(4, { t(""), t("-> auto"), sn(nil, { t("-> "), i(1, "RetType") }) }),
      i(5, "// body"),
    })),

    -- ── 6. Smart pointer factory — choice picks unique/shared/weak ─────────
    s("mkptr", {
      c(1, {
        sn(nil, { t("auto "), i(1, "ptr"), t(" = std::make_unique<"), i(2, "T"), t(">("), i(3, ""), t(");") }),
        sn(nil, { t("auto "), i(1, "ptr"), t(" = std::make_shared<"), i(2, "T"), t(">("), i(3, ""), t(");") }),
        sn(nil, { t("std::weak_ptr<"), i(1, "T"), t("> "), i(2, "wptr"), t("("), i(3, "shared_ptr"), t(");") }),
      }),
    }),

    -- ── 7. RAII scoped lock — choice: mutex type ──────────────────────────
    s("lock", fmt([[
std::{}lock_guard<std::{}> lock({});
]], {
      c(1, { t(""), t("scoped_") }),
      c(2, { t("mutex"), t("recursive_mutex"), t("shared_mutex") }),
      i(3, "mtx"),
    })),

    -- ── 8. Structured error handling — function mirrors type name ──────────
    s("exc", fmt([[
class {} : public std::{} {{
public:
    explicit {}(const std::string& msg) : std::{}(msg) {{}}
}};
]], {
      i(1, "MyError"),
      c(2, { t("runtime_error"), t("logic_error"), t("exception") }),
      rep(1),
      rep(2),
    })),

    -- ── 9. Concept (C++20) ────────────────────────────────────────────────
    s("concept", fmt([[
template <typename {}>
concept {} = {};
]], {
      i(1, "T"),
      i(2, "MyConcept"),
      c(3, {
        sn(nil, { t("std::is_integral_v<"), rep(1), t(">") }),
        sn(nil, { t("std::is_floating_point_v<"), rep(1), t(">") }),
        sn(nil, { t("requires("), i(1, "T t"), t(") { "), i(2, "{ t.foo() } -> std::same_as<void>"), t("; }") }),
      }),
    })),

    -- ── 10. Main with argc/argv ───────────────────────────────────────────
    s("main", fmt([[
#include <iostream>
#include <span>
#include <string_view>

int main(int argc, char* argv[]) {{
    const auto args = std::span(argv, static_cast<std::size_t>(argc));
    {}
    return {};
}}
]], {
      i(1, "// logic"),
      c(2, { t("EXIT_SUCCESS"), t("0"), t("EXIT_FAILURE") }),
    })),
  },
}
