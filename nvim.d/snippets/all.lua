-- luasnips "all" types snippets sampler
-- nvim.d/snippets/all.lua
--
-- loads for ALL filetypes
-- demonstrates: snippet, insert, text, function, choice, dynamic nodes.

local ls = require("luasnip")
local s   = ls.snippet          -- snippet(trigger, nodes, opts?)
local sn  = ls.snippet_node     -- anonymous snippet node (used in dynamic)
local isn = ls.indent_snippet_node
local t   = ls.text_node        -- static text
local i   = ls.insert_node      -- cursor stop / placeholder
local f   = ls.function_node    -- computed text from other nodes
local c   = ls.choice_node      -- pick one of several alternatives
local d   = ls.dynamic_node     -- build nodes at expansion time
local r   = ls.restore_node     -- restore previously typed text in choices
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep   -- repeat another node's text

-- Helpers ──────────────────────────────────────────────────────────────────

--- Return the current date as YYYY-MM-DD
local function date()
  return { os.date("%Y-%m-%d") }
end

--- Return the filename without extension
local function filename()
  return { vim.fn.expand("%:t:r") }
end

-- Snippets ─────────────────────────────────────────────────────────────────

return {
  -- ── 1. Basic snippet with insert nodes ──────────────────────────────────
  -- trigger: `todo`
  s("todo", fmt("TODO({}): {}", { i(1, "author"), i(2, "description") })),

  -- ── 2. Function node — inserts computed value ────────────────────────────
  -- trigger: `date`  →  inserts today's date
  s("date", { f(date) }),

  -- ── 3. Function node using another node's text ──────────────────────────
  -- trigger: `fname`  →  inserts the current filename (no ext)
  s("fname", { f(filename) }),

  -- ── 4. Choice node — cycle with <C-l> / <C-h> ───────────────────────────
  -- trigger: `log`  →  pick a log level label
  s("log", {
    t("["),
    c(1, {
      t("INFO"),
      t("WARN"),
      t("ERROR"),
      t("DEBUG"),
    }),
    t("] "),
    i(2, "message"),
  }),

  -- ── 5. Repeat node — mirror another insert node ─────────────────────────
  -- trigger: `hr`  →  repeated separator character fills a "title bar"
  s("hr", fmt("── {} ──{}──", {
    i(1, "Section"),
    f(function(args)
      -- pad dashes to match the title length
      local n = #args[1][1]
      return string.rep("─", math.max(0, 20 - n))
    end, { 1 }),
  })),

  -- ── 6. Dynamic node — builds child nodes from earlier input ─────────────
  -- trigger: `wrap`
  -- Type an opening delimiter, then it mirrors the matching closer.
  s("wrap", {
    i(1, "content"),
    t(" "),
    c(2, {
      sn(nil, { t("("), rep(1), t(")") }),
      sn(nil, { t("["), rep(1), t("]") }),
      sn(nil, { t("{"), rep(1), t("}") }),
      sn(nil, { t('"'), rep(1), t('"') }),
    }),
  }),

  -- ── 7. Autosnippet (fires without explicit expand key) ──────────────────
  -- Requires `enable_autosnippets = true` in config.
  -- Typing `--` at the start of a line inserts a separator comment.
  ls.snippet({ trig = "---", snippetType = "autosnippet" }, {
    t("────────────────────────────────────────────────"),
  }),
}
