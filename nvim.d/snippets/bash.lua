-- luasnip bash snippets 
-- nvim.d./snippets/bash.lua

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

-- ── Helpers ──────────────────────────────────────────────────────────────────

--- Uppercase first arg
local function upper(args)
  return args[1][1]:upper()
end

-- ── Snippets ─────────────────────────────────────────────────────────────────

return {
  bash = {

    -- ── 1. Shebang — choice node picks interpreter ───────────────────────
    s("shebang", {
      t("#!/usr/bin/env "),
      c(1, { t("bash"), t("sh"), t("zsh"), t("python3") }),
      t({ "", "" }),
    }),

    -- ── 2. Script header — function node mirrors script name ─────────────
    -- trigger: `header`
    s("header", fmt([[
#!/usr/bin/env bash
# ─────────────────────────────────────────
# Script : {}
# Author : {}
# Date   : {}
# Desc   : {}
# ─────────────────────────────────────────
set -euo pipefail
]], {
      f(function() return { vim.fn.expand("%:t") } end),
      i(1, "author"),
      f(function() return { os.date("%Y-%m-%d") } end),
      i(2, "description"),
    })),

    -- ── 3. Function definition ────────────────────────────────────────────
    s("fn", fmt([[
{}() {{
  local {}="$1"
  {}
}}
]], { i(1, "func_name"), i(2, "arg"), i(3, "# body") })),

    -- @DEBUG: 
    -- @FIXME: Leaving commented until break/issue is fixed.
    -- -- -- if/if-else conditionals -- -- --
      -- s("ife", fmt([[
      -- if [[ <1> ]]; then
      --   <2>
      -- elif [[ <3> ]]; then
      --   <4>
      -- else
      --   <5>
      -- fi
      -- ]], { i(1, "condition"), i(2, "# then"), i(3, "# elif cond"), i(4, "# elif body"), i(5, "# else") },
      -- { delimiters = "<>" })),
      --


    -- ── 5. For loop — choice node: array vs range vs glob ────────────────
    -- for loop (the array branch uses "${...[@]}" which is fine, but safer to switch)
    s("for", {
      t("for "), i(1, "item"), t(" in "),
      c(2, {
        sn(nil, { t('"${'), i(1, "array"), t('[@]}"') }),
        ...
      }),
      ...
    }),

    -- ── 6. While read loop (common pattern for file processing) ──────────
--     s("whileread", fmt([[
-- while IFS= read -r {}; do
--   {}
-- done < "{}"
-- ]], { i(1, "line"), i(2, "echo \"$line\""), i(3, "file.txt") })),
--
-- @FIXME: Need to add escape characters. Leaving commented out until this is fixed.
--
--     -- ── 7. Case statement — dynamic node generates arms from count ────────
--     -- trigger: `case`  →  type var name, jump, type number of cases (not
--     -- demonstrated here for brevity — uses a static 3-arm template instead)
--     s("case", fmt([[
-- case "${{}}" in
--   {})
--     {}
--     ;;
--   {})
--     {}
--     ;;
--   *)
--     {}
--     ;;
-- esac
-- ]], { i(1, "var"), i(2, "pattern1"), i(3, "# arm1"), i(4, "pattern2"), i(5, "# arm2"), i(6, "# default") })),

    -- ── Logging helpers — function node builds tag, choice picks level ─
    s("logfn", {
      t({
        "_log() {",
        '  local level="$1"; shift',
        '  printf "[%s][%s] %s\\n" "$(date +%T)" "$level" "$*" >&2',
        "}",
        "log_info()  { _log INFO  \"$@\"; }",
        "log_warn()  { _log WARN  \"$@\"; }",
        "log_error() { _log ERROR \"$@\"; }",
      }),
    }),




    -- ── Trap / cleanup pattern ────────────────────────────────────────
    s("trap", fmt([[
_cleanup() {{
  {}
}}
trap _cleanup EXIT INT TERM
]], { i(1, "# cleanup logic") })),
  },
}
