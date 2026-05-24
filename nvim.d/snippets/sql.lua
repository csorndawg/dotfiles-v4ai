-- luasnips sql snippets sampler
-- nvim.d/snippets/sql.lua
-- filetypes: sql, mysql, pgsql, sqlite filetypes (register all below)



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

local function upper(args)
  return { (args[1][1] or ""):upper() }
end

-- ── Snippet definitions (shared) ─────────────────────────────────────────────

local snippets = {

  -- ── 1. SELECT with dynamic column list ───────────────────────────────────
  -- trigger: `sel`
  s("sel", fmt([[
SELECT
  {}
FROM {}
WHERE {}
{}
LIMIT {};
]], {
    i(1, "col1, col2"),
    i(2, "table_name"),
    i(3, "1=1"),
    c(4, {
      t(""),
      sn(nil, { t("ORDER BY "), i(1, "col"), t(" "), c(2, { t("ASC"), t("DESC") }) }),
      sn(nil, { t("GROUP BY "), i(1, "col") }),
    }),
    i(5, "100"),
  })),

  -- ── 2. INSERT — function node mirrors table name in comment ──────────────
  s("ins", fmt([[
INSERT INTO {} ({})
VALUES ({});
-- Inserted into: {}
]], {
    i(1, "table_name"),
    i(2, "col1, col2"),
    i(3, "val1, val2"),
    rep(1),                     -- mirrors $1
  })),

  -- ── 3. UPDATE with optional WHERE ────────────────────────────────────────
  s("upd", fmt([[
UPDATE {}
SET {}
WHERE {};
]], { i(1, "table_name"), i(2, "col = val"), i(3, "id = ?") })),

  -- ── 4. DELETE with safety choice node ────────────────────────────────────
  s("del", {
    t("DELETE FROM "), i(1, "table_name"), t({ "", "" }),
    c(2, {
      sn(nil, fmt("WHERE {};", { i(1, "condition") })),
      t("-- ⚠  No WHERE: deletes ALL rows"),
    }),
  }),

  -- ── 5. CTE — dynamic node generates N named CTEs ─────────────────────────
  -- trigger: `cte`  →  type the number of CTEs you want, jump, names fill in
  s("cte", {
    t("WITH "), i(1, "cte_name"), t({ " AS (", "  " }),
    i(2, "SELECT ..."),
    t({ "", ")", "" }),
    i(3, "SELECT * FROM "),
    rep(1),
    t(";"),
  }),

  -- ── 6. Window function skeleton ───────────────────────────────────────────
  s("win", fmt([[
{func}({col}) OVER (
  PARTITION BY {part}
  ORDER BY {ord} {dir}
  {frame}
) AS {alias}
]], {
    func  = c(1, { t("ROW_NUMBER"), t("RANK"), t("DENSE_RANK"), t("LAG"), t("LEAD"), t("SUM"), t("AVG") }),
    col   = i(2, "col"),
    part  = i(3, "partition_col"),
    ord   = i(4, "order_col"),
    dir   = c(5, { t("ASC"), t("DESC") }),
    frame = c(6, {
      t(""),
      t("ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW"),
      t("ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING"),
    }),
    alias = i(7, "result"),
  })),

  -- ── 7. CREATE TABLE — dynamic node generates columns ─────────────────────
  -- trigger: `crt`
  s("crt", fmt([[
CREATE TABLE {} (
  id          {} NOT NULL,
  {}          {},
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  {}
);
]], {
    i(1, "table_name"),
    c(2, {
      t("BIGSERIAL PRIMARY KEY"),       -- Postgres
      t("BIGINT PRIMARY KEY AUTO_INCREMENT"),  -- MySQL
      t("INTEGER PRIMARY KEY"),         -- SQLite
    }),
    i(3, "col_name"),
    c(4, {
      t("TEXT"),
      t("VARCHAR(255)"),
      t("INTEGER"),
      t("NUMERIC(18,6)"),
      t("BOOLEAN"),
    }),
    i(5, "CONSTRAINT uq_name UNIQUE (col_name)"),
  })),

  -- ── 8. EXPLAIN / ANALYZE choice ───────────────────────────────────────────
  s("exp", {
    c(1, {
      t("EXPLAIN "),
      t("EXPLAIN ANALYZE "),
      t("EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT) "),
    }),
    i(2, "SELECT ..."),
    t(";"),
  }),

  -- ── 9. Transaction block ──────────────────────────────────────────────────
  s("txn", fmt([[
BEGIN;

{};

-- verify before committing
-- ROLLBACK;
COMMIT;
]], { i(1, "-- SQL statements") })),

  -- ── 10. Index creation — function node mirrors table + column ────────────
  s("idx", fmt([[
CREATE {}INDEX {} ON {}({});
]], {
    c(1, { t(""), t("UNIQUE "), t("CONCURRENT ") }),
    f(function(args)
      local tbl = args[1][1] or "tbl"
      local col = args[2][1] or "col"
      return { "idx_" .. tbl .. "_" .. col }
    end, { 2, 3 }),
    i(2, "table_name"),
    i(3, "col"),
  })),
}

-- Register under multiple SQL filetypes
return {
  sql    = snippets,
  mysql  = snippets,
  pgsql  = snippets,
  sqlite = snippets,
}
