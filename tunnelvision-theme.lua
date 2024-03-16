vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "tunnelvision"

local theme

-- colors
local grey_01 = "#8a8a8a"
local grey_02 = "#a1a1a1"
local grey_03 = "#4b4b4b"
local violet = "#8b7ea7"
local violet2 = "#8c5dc2"
-- local violet3 = "#d3c7ed"
local violet3 = "#c9c1d0"
local violet_dark = "#38373b"

local gold = "#e2c490"
local shine = "#b41352"
local shine_2 = "#73173b"
local shine_dark = "#3a3638"

local bg = "#1b1b1b"
local bg2 = "#2b2b2b"
local bg2_1 = "#2f2f2f"

local fg = "#b5b5b5" -- main text
local fg2 = "#d5d5d5" -- highlighted text (e.g. types)

local const_fg = "#8b7ea7"
local string_fg = "#8b7ea7"
local dir_color = "#8b7ea7"

-- local comment = grey_01
local comment = gold

local active = "#0000ff" -- where is this used?
-- local darker_fg = "#7d7d7d"
local darker_fg = "#0000ff" -- where is this used?
local diffadd = "#6abf40"
local diffdelete = "#d2322d"
local diffchange = "#ec8013"

local statusline = "#222222"
-- local dim_comment = "#696969"
local mistake = {
	fg = "#c33c33",
	bg = "#2b1d1e",
}
local error = "#d13e23"
local warn = "#f4b371"
local hint = "#8ebeec"
local info = "#88cc66"
local ansi = {
	black = "#333333",
	blue = "#71aed7",
	brightyellow = "#dfdf8e",
	cyan = "#47bea9",
	green = "#95cb82",
	magenta = "#cc8bc9",
	red = "#c33c33",
	white = "#cecece",
	yellow = "#cd974b",
}
local pmenu_bg = bg2
local float_bg = bg2
local floatborder = grey_03
local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#333333" }
	or {
		bg = float_bg,
		fg = float_bg,
	}


-- local cursor_cross = "#2b2b2b"
local cursor_cross = violet_dark
local color_col = "#2b2b2b"

-- #2b3d40
local modal_border = "#404040"



theme = {
	Comment = { fg = comment },
	ColorColumn = { bg = color_col },
	Conceal = { fg = "#b0b0b0" },
	Cursor = { bg = active, fg = "#000000" },
	-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
	-- CursorColumn = { bg = "#182325" },
	-- CursorLine = { bg = "#182325" },
	CursorColumn = { bg = cursor_cross },
	CursorLine = { bg = cursor_cross },
	Directory = { fg = dir_color },
	DiffAdd = { bg = "#244032", fg = "#56d364" },
	DiffDelete = { bg = "#462c32", fg = "#f85149" },
	DiffText = { fg = "#341a00", bg = "#fff987" },
	DiffChange = { bg = "#341a00", fg = "#e3b341" },
	EndOfBuffer = { fg = "#354c50" },
	-- TermCursor   { }, -- cursor in a focused terminal
	TermCursorNC = { fg = bg, bg = fg },
	ErrorMsg = { fg = error, bg = mistake.bg },
	VertSplit = { fg = modal_border },
	Folded = { bg = "#182325", fg = "#7d7d7d" },
	FoldColumn = { bg = bg, fg = "#4d4d4d" },
	SignColumn = {},
	IncSearch = { bg = shine, fg = fg },
	-- Substitute   { }, -- |:substitute| replacement text highlighting
	-- LineNr = { fg = "#5c5c5c" },
	LineNr = { fg = grey_03 },
	CursorLineNr = { fg = violet, bold = 1 },
	MatchParen = { fg = violet2, bold = 1, sp = active },
	-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
	-- MsgArea      { }, -- Area for messages and cmdline
	-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = ansi.green, bold = 1 },
	NonText = { fg = "#696969" },
	Normal = { bg = bg, fg = fg },
	NormalFloat = { bg = float_bg },
	-- NormalNC     { }, -- normal text in non-current windows
	FloatBorder = floatborder,
	Pmenu = { bg = bg2, fg = fg },
	PmenuSel = { bg = violet, fg = bg2 },
	-- PmenuSel = { bg = shine },
	-- PmenuSbar = { bg = "#212f31" },
	PmenuSbar = { bg = bg2_1 },
	-- PmenuThumb = { bg = "#47666b" },
	PmenuThumb = { bg = fg },
	Question = { fg = diffadd },
	QuickFixLine = { bg = "#182325" },
	Search = { bg = "#354c50" },
	SpecialKey = { fg = ansi.cyan },
	SpellBad = { undercurl = 1, sp = ansi.red },
	SpellCap = { undercurl = 1, sp = ansi.blue },
	SpellLocal = { undercurl = 1, sp = ansi.cyan },
	SpellRare = { undercurl = 1, sp = ansi.magenta },


    StatusLineNormalMode = { fg = fg, bg = "#ff0000" },
    StatusLineInsertMode = { fg = fg, bg = grey_2 },
    StatusLineVisualMode = { fg = fg, bg = grey_2 },
    StatusLineReplaceMode = { fg = fg, bg = grey_2 },
    StatusLineTerminalMode = { fg = fg, bg = grey_2 },

	StatusLine = { bg = statusline, fg = fg },
	StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
	TabLine = { bg = statusline, fg = "#7d7d7d" },
	TabLineFill = { bg = statusline },
	TabLineSel = { bg = statusline, fg = ansi.blue },
	Title = { fg = gold },
	-- Visual = { bg = "#293334" },
	Visual = { bg = violet_dark },
	-- VisualNOS = { bg = "#293334" },
	VisualNOS = { bg = "#00ff00" },
	-- WarningMsg = { fg = "#e1ad4c" },
	WarningMsg = { fg = warn },
	-- WildMenu = { bg = "#354c50" },
	WildMenu = { bg = "#ff0000" },
	WinBar = { bg = bg, fg = fg, bold = true },
	WinBarNC = { bg = bg, fg = "#7d7d7d" },

	--- SYNTAX I: TS groups link to these
	Constant = { fg = const_fg },
	String = { fg = string_fg },
	Character = { fg = const_fg },
	Number = { fg = const_fg },
	Boolean = { fg = const_fg },
	Float = { fg = const_fg },
	Operator = { fg = fg },

	--- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
	Identifier = { fg = fg },
	Function = { fg = fg },
	Statement = { fg = fg },
	Conditional = { fg = fg },
	Repeat = { fg = fg },
	Label = { fg = fg },
	Keyword = { fg = fg },
	Exception = { fg = fg },
	PreProc = { fg = fg },
	Include = { fg = fg },
	Define = { fg = fg },
	Macro = { fg = fg },
	PreCondit = { fg = fg },
	Type = { fg = violet3 },
	StorageClass = { fg = fg },
	Structure = { fg = fg },
	Typedef = { fg = fg },

	Special = { fg = fg },
	-- TODO better color than diffchange, try reddish
	-- SpecialChar = { fg = diffchange }, --  special character in a constant
	-- Tag            { }, --    you can use CTRL-] on this
	-- Delimiter      { },
	-- SpecialComment = { bg = "#1d292b", fg = gold },
	SpecialComment = { fg = gold },
	debugPc = { bg = "#0f2534" },
	debugBreakpoint = { bg = "#b33229" },
	helpHyperTextJump = { fg = ansi.magenta },
	helpSectionDelim = { fg = ansi.magenta },
	helpExample = { fg = ansi.cyan },
	helpCommand = { fg = ansi.cyan },
	helpHeadline = { fg = ansi.blue },
	helpHeader = { fg = ansi.magenta },

	Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
	Italic = { italic = 1 },

	-- ("Ignore", below, may be invisible...)
	-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

	Error = { bg = mistake.bg, fg = mistake.fg },

	-- Todo = { bg = "#d0d058", fg = bg },
	-- Todo = { bg = "#7dd0ff", fg = bg, bold = 1 },
	Todo = { bg = shine, fg = bg, bold = 1 },

	--- Diagnostic
	-- LspReferenceText = { bg = "#253437" },
	-- LspReferenceRead = { bg = "#253437" },
	-- LspReferenceWrite = { bg = "#253437", underline = 1, sp = active },
	-- LspCodeLens = { fg = "#5c5c5c" },
	-- LspCodeLensSeparator = { fg = "#5c5c5c" },

	--- Diagnostic
	DiagnosticError = { fg = error },
	DiagnosticWarn = { fg = warn },
	DiagnosticHint = { fg = hint },
	DiagnosticInfo = { fg = info },
	DiagnosticVirtualTextError = { bg = "#350B0B", fg = "#D1503A" },
	DiagnosticVirtualTextWarn = { bg = "#3F240A", fg = "#C8935D" },
	DiagnosticVirtualTextHint = { bg = "#1D2B37", fg = "#7E9CB9" },
	DiagnosticVirtualTextInfo = { bg = "#162C0B", fg = "#7BAC62" },

	--- Gitsigns
	GitSignsAdd = { fg = diffadd },
	GitSignsChange = { fg = diffchange },
	GitSignsDelete = { fg = diffdelete },
	--- Telescope
	TelescopeBorder = { fg = modal_border },
	TelescopeMatching = { fg = fg, bg = shine },
	TelescopeMultiSelection = { fg = grey_03 },
	TelescopePromptPrefix = { fg = violet },
	TelescopeSelectionCaret = { fg = shine },
	TelescopeTitle = { fg = gold },
	TelescopeResultsTitle = { fg = gold },
	--- fzf-lua
	FzfLuaBorder = { fg = modal_border },
}

for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
end
