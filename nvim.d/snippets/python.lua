-- luasnips python snippets
-- nvim.d/snippets/python.lua
--
-- Possible name/snippet collisions might exist b/c of friendly-snippets lazy load.
-- Adjust as needed to resolve any breaking collisions.


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

-------- Helpers -------- 

local function date()
  return { os.date("%Y-%m-%d") }
end

--- Build an __init__ signature from a comma-separated field list
local function make_init(args)
  local fields_str = args[1][1] or ""
  if fields_str == "" then return { "pass" } end
  local lines = {}
  for field in fields_str:gmatch("[^,%s]+") do
    table.insert(lines, "        self." .. field .. " = " .. field)
  end
  return lines
end

-------- Snippets -------- 

return {
  python = {

    -- ── 1. Script header — function node fills date/filename ─────────────
    s("header", fmt([[
#!/usr/bin/env python3
"""
{}
Author : {}
Date   : {}
"""
]], {
      f(function() return { vim.fn.expand("%:t:r") } end),
      i(1, "author"),
      f(date),
    })),

    -- ── 2. Class — dynamic node generates __init__ body from field list ───
    -- trigger: `cls`
    -- $1 = ClassName, $2 = comma-separated fields → __init__ body auto-built
    s("cls", {
      t("class "), i(1, "MyClass"), t("("),
      c(2, { t(""), t("object"), sn(nil, { i(1, "BaseClass") }) }),
      t({ "):", "    \"\"\"" }), i(3, "Docstring."), t({ "\"\"\"", "", "    def __init__(self, " }),
      i(4, "field1, field2"),
      t({ "):", "" }),
      d(5, function(args)
        return sn(nil, { t(make_init(args)) })
      end, { 4 }),
      t({ "", "", "    def __repr__(self) -> str:", '        return f"' }),
      rep(1),
      t('({self.__dict__})"'),
    }),

    -- ── 3. dataclass — choice for frozen/slots ────────────────────────────
    s("dc", fmt([[
from dataclasses import dataclass, field

@dataclass{}
class {}:
    """{}"""
    {}: {}
]], {
      c(1, {
        t(""),
        t("(frozen=True)"),
        t("(slots=True)"),
        t("(frozen=True, slots=True)"),
      }),
      i(2, "MyData"),
      i(3, "Docstring."),
      i(4, "field_name"),
      i(5, "str"),
    })),

    -- ── 4. Function with type hints & docstring ───────────────────────────
    s("def", fmt([[
def {}({}) -> {}:
    """{}

    Args:
        {}: {}

    Returns:
        {}
    """
    {}
]], {
      i(1, "func_name"),
      i(2, "arg: type"),
      i(3, "None"),
      i(4, "One-line summary."),
      i(5, "arg"),
      i(6, "Description."),
      i(7, "None"),
      i(8, "pass"),
    })),

    -- ── 5. Async function ─────────────────────────────────────────────────
    s("adef", fmt([[
async def {}({}) -> {}:
    """{}"""
    {}
]], { i(1, "func_name"), i(2, ""), i(3, "None"), i(4, "Docstring."), i(5, "pass") })),

    -- ── 6. Context manager (with / try pattern) ───────────────────────────
    s("with", fmt([[
with {} as {}:
    {}
]], { i(1, "open(path, 'r')"), i(2, "fh"), i(3, "data = fh.read()") })),

    -- ── 7. Try / except — dynamic choice adds except arms ────────────────
    s("try", {
      t({ "try:", "    " }), i(1, "pass"),
      t({ "", "" }),
      c(2, {
        sn(nil, fmt("except {} as {}:\n    {}", { i(1, "Exception"), i(2, "e"), i(3, "raise") })),
        sn(nil, fmt("except ({}) as {}:\n    {}", { i(1, "ValueError, TypeError"), i(2, "e"), i(3, "raise") })),
      }),
      t({ "", "finally:", "    " }), i(3, "pass"),
    }),

    -- ── 8. List / dict / set comprehension — choice node ─────────────────
    s("comp", {
      c(1, {
        sn(nil, fmt("[{} for {} in {} if {}]", { i(1, "expr"), i(2, "x"), i(3, "iterable"), i(4, "True") })),
        sn(nil, fmt("{{{}: {} for {} in {}}}", { i(1, "k"), i(2, "v"), i(3, "item"), i(4, "iterable") })),
        sn(nil, fmt("{{{} for {} in {}}}", { i(1, "expr"), i(2, "x"), i(3, "iterable") })),
      }),
    }),

    -- ── 9. Argparse boilerplate ───────────────────────────────────────────
    s("argparse", fmt([[
import argparse


def _build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(description="{}")
    p.add_argument("--{}",  type={},  default={}, help="{}")
    return p


def main() -> None:
    args = _build_parser().parse_args()
    {}


if __name__ == "__main__":
    main()
]], {
      i(1, "Script description"),
      i(2, "flag"),
      i(3, "str"),
      i(4, "None"),
      i(5, "Flag help text"),
      i(6, "pass"),
    })),

    -- ── 10. pytest test — function node mirrors func under test ──────────
    s("test", fmt([[
def test_{}():
    # Arrange
    {}
    # Act
    result = {}
    # Assert
    assert result == {}
]], {
      i(1, "func_name"),
      i(2, "# setup"),
      i(3, "func_under_test()"),
      i(4, "expected"),
    })),

    -- ── 11. Logging setup ─────────────────────────────────────────────────
    s("logsetup", fmt([[
import logging

logging.basicConfig(
    level=logging.{},
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
)
log = logging.getLogger(__name__)
]], {
      c(1, { t("INFO"), t("DEBUG"), t("WARNING"), t("ERROR") }),
    })),

    -- ── 12. __main__ guard ────────────────────────────────────────────────
    s("main", fmt([[
def main() -> None:
    {}


if __name__ == "__main__":
    main()
]], { i(1, "pass") })),
  },
}

