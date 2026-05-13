-- Todo-Comments Extras/Overrides Configuration
--
-- This is a simple example that shows how to extend/overwrite a LazyVim-installed
-- plugin's default property spec ("config.keywords" in below example)

local todo_comments = require 'todo-comments'

return {
  keywords = {
    FIX = {
      -- icon = "!! --->  ", -- icon used for the sign, and in search results
      color = 'error', -- can be a hex color, or a named color (see below)
      alt = {
        '!!!',
        'A/N',
        'ACTION-NEEDED',
        'BROKEN',
        'BUG',
        'DEBUG',
        'DEBUGME',
        'ERROR',
        'ERROR',
        'FAIL',
        'FAILED',
        'FAILED',
        'FIXME',
        'IMPORTANT',
        'ISSUE',
        'REVERTED',
        'UNDONE',
        'WATCH',
        'WATCHME',
      },
    },
    TODO = {
      -- icon = ">> ",
      color = 'todo_color',
      alt = {
        'BACKLOG',
        'DECOMM',
        'DECOMMED',
        'DECOMMISSION',
        'DECOMMISSIONED',
        'LEGACY',
        'QUEUE',
        'TASK',
        'TASKLOG',
        'TBD',
        'TODO',
        'WIP',
        'WORK',
      },
    },
    HACK = {
      -- icon = ">> ",
      color = 'warning',
      alt = {
        'CLEANUP',
        'CLEANUP',
        'HACK',
        'HOTFIX',
        'INTERIM',
        'INTERIM-FIX',
        'INTERIMFIX',
        'TEMPFIX',
        'TEMPFIX',
        'WORKAROUND',
        'WRKARD',
      },
    },
    WARN = {
      -- icon = ">> ",
      color = 'warning',
      alt = {
        '???',
        'EXP',
        'EXPERIMENTAL',
        'EXPT',
        'HELP',
        'INSPECT',
        'MOCK',
        'PLAY',
        'SKIP',
        'SKIPPED',
        'STAT',
        'STATUS',
        'TEST',
        'TESTING',
        'TESTME',
        'WARN',
        'WARNING',
        'WTF',
        'XXX',
      },
    },
    PERF = {
      -- icon = ">> ",
      alt = {
        'CHORE',
        'ENHANCE',
        'ENHANCED',
        'ENHANCEMENT',
        'OPT',
        'OPTIMIZE',
        'PERF',
        'PERFORMANCE',
        'PQ',
        'PRODUCTIONIZE',
        'REFACT',
        'REFACTOR',
        'UPGRADE',
      },
    },
    NOTE = { -- icon = ">> ",
      color = 'hint',
      alt = {
        'CONTEXT',
        'COPYPASTA',
        'DONE',
        'EXPLAIN',
        'HELP',
        'HINT',
        'INFO',
        'NEXT',
        'NEXT-STEPS',
        'NOTE',
        'NXT',
        'REF',
        'REFERENCE',
        'REMARK',
        'REMINDER',
        'SPEC',
        'IDEA',
      },
    },
    TEST = {
      -- icon = "⏲ ",
      color = 'test_color',
      alt = {
        'CONFIRMED',
        'DONE',
        'FIXED',
        'G2G',
        'OKAY',
        'PASSED',
        'RELEASED',
        'RESOLVED',
        'REVIEWED',
        'SUCCESS',
        'TEST',
        'TESTING',
        'TESTME',
        'UNTESTED',
        'VALID',
        'VALIDATED',
      },
    },
  },
  gui_style = {
    fg = 'NONE', -- The gui style to use for the fg highlight group.
    bg = 'BOLD', -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = '^.', -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = '', -- "fg" or "bg" or empty
    keyword = 'bg', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = 'fg', -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = { 'ignore', 'zig', 'temp', 'disabled', 'tmp' }, -- list of file types to exclude highlighting
  },
  -- @TESTING: Testing chatgpt recomm
  colors = {
    test_color = '#d08770', -- Nord orange for TEST
    --todo_color = "#ebcb8b", -- Nord yellow for TODO
    todo_color = '#b48ead', -- Nord yellow for TODO
    -- default = { "Identifier", "#7C3AED" },
    -- error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    -- hint = { "DiagnosticHint", "#10B981" },
    -- info = { "DiagnosticInfo", "#2563EB" },
    -- --note = { "Identifier", "#" },
    -- --perf = { "Identifier", "#" },
    -- test = { "Identifier", "#B48EAD" },
    -- todo = { "Identifier", "#d08770" },
    -- warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
  },
  search = {
    command = 'rg',
    args = {
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
    },
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  },
}
