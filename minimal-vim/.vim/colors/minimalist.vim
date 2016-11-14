" Theme setup
hi clear
syntax reset
let g:colors_name = "minimalist"

" Vim editor colors
hi Bold cterm=bold
hi Debug ctermfg=01
hi Directory ctermfg=04
hi Error ctermfg=00 ctermbg=01
hi ErrorMsg ctermfg=01 ctermbg=00
hi Exception ctermfg=01
hi FoldColumn ctermfg=06 ctermbg=10
hi Folded ctermfg=08 ctermbg=10
hi IncSearch ctermfg=10 ctermbg=03 cterm=none
hi Italic cterm=none
hi Macro ctermfg=03
hi MatchParen ctermfg=00 ctermbg=08
hi ModeMsg ctermfg=15 ctermbg=05
hi MoreMsg ctermfg=02
hi Question ctermfg=04
hi Search ctermfg=10 ctermbg=03
hi SpecialKey ctermfg=08
hi TooLong ctermfg=01
hi Underlined ctermfg=01
hi Visual ctermbg=11
hi VisualNOS ctermfg=01
hi WarningMsg ctermfg=01
hi WildMenu ctermbg=01
hi Title ctermfg=04 cterm=none
hi Conceal ctermfg=04 ctermbg=00
hi Cursor ctermfg=00 ctermbg=07
hi NonText ctermfg=08
hi Normal ctermfg=07 ctermbg=00
hi LineNr ctermfg=08 ctermbg=10
hi SignColumn ctermfg=08 ctermbg=10
hi StatusLine ctermfg=12 ctermbg=11 cterm=none
hi StatusLineNC ctermfg=08 ctermbg=10 cterm=none
hi VertSplit ctermfg=11 ctermbg=11 cterm=none
hi ColorColumn ctermbg=10 cterm=none
hi CursorColumn ctermbg=10 cterm=none
hi CursorLine ctermbg=10 cterm=none
hi CursorLineNr ctermfg=08 ctermbg=10
hi PMenu ctermfg=12 ctermbg=10 cterm=none
hi PMenuSel ctermfg=10 ctermbg=12
hi TabLine ctermfg=08 ctermbg=10 cterm=none
hi TabLineFill ctermfg=08 ctermbg=10 cterm=none
hi TabLineSel ctermfg=02 ctermbg=10 cterm=none

" Standard syntax highlighting
hi Boolean ctermfg=02
hi Character ctermfg=02
hi Comment ctermfg=08
hi Conditional ctermfg=07
hi Constant ctermfg=02 cterm=none
hi Define ctermfg=07
hi Delimiter ctermfg=07
hi Float ctermfg=02
hi Function ctermfg=07
hi Identifier ctermfg=07 cterm=none
hi Include ctermfg=07
hi Keyword ctermfg=07
hi Label ctermfg=03
hi Number ctermfg=02
hi Operator ctermfg=07
hi PreProc ctermfg=07
hi Repeat ctermfg=07
hi Special ctermfg=07
hi SpecialChar ctermfg=07
hi Statement ctermfg=07
hi StorageClass ctermfg=07
hi String ctermfg=02
hi Structure ctermfg=07
hi Tag ctermfg=07
hi Todo ctermfg=07
hi Type ctermfg=07
hi Typedef ctermfg=07

" C highlighting
hi cOperator ctermfg=07
hi cPreCondit ctermfg=07

" C# highlighting
hi csClass ctermfg=07
hi csAttribute ctermfg=07
hi csModifier ctermfg=07
hi csType ctermfg=07
hi csUnspecifiedStatement ctermfg=07
hi csContextualStatement ctermfg=07
hi csNewDecleration ctermfg=07

" CSS highlighting
hi cssBraces ctermfg=07
hi cssClassName ctermfg=07
hi cssColor ctermfg=07

" Diff highlighting
hi DiffAdd ctermfg=02 ctermbg=10
hi DiffChange ctermfg=08 ctermbg=10
hi DiffDelete ctermfg=01 ctermbg=10
hi DiffText ctermfg=04 ctermbg=10
hi DiffAdded ctermfg=02 ctermbg=00
hi DiffFile ctermfg=01 ctermbg=00
hi DiffNewFile ctermfg=02 ctermbg=00
hi DiffLine ctermfg=04 ctermbg=00
hi DiffRemoved ctermfg=01 ctermbg=00

" Git highlighting
hi gitCommitOverflow ctermfg=07
hi gitCommitSummary ctermfg=07

" HTML highlighting
hi htmlBold ctermfg=07
hi htmlItalic ctermfg=07
hi htmlEndTag ctermfg=07
hi htmlTag ctermfg=07

" JavaScript highlighting
hi javaScript ctermfg=07
hi javaScriptBraces ctermfg=07
hi javaScriptNumber ctermfg=07

" Mail highlighting
hi mailQuoted1 ctermfg=07
hi mailQuoted2 ctermfg=07
hi mailQuoted3 ctermfg=07
hi mailQuoted4 ctermfg=07
hi mailQuoted5 ctermfg=07
hi mailQuoted6 ctermfg=07
hi mailURL ctermfg=07
hi mailEmail ctermfg=07

" Markdown highlighting
hi markdownCode ctermfg=07
hi markdownError ctermfg=07 ctermbg=00
hi markdownCodeBlock ctermfg=07
hi markdownHeadingDelimiter ctermfg=07

" PHP highlighting
hi phpMemberSelector ctermfg=07
hi phpComparison ctermfg=07
hi phpParent ctermfg=07
hi phpDocTags ctermfg=12
hi phpDocTodo ctermfg=01

" Python highlighting
hi pythonOperator ctermfg=07
hi pythonRepeat ctermfg=07

" Ruby highlighting
hi rubyAttribute ctermfg=07
hi rubyConstant ctermfg=07
hi rubyInterpolation ctermfg=07
hi rubyInterpolationDelimiter ctermfg=07
hi rubyRegexp ctermfg=07
hi rubySymbol ctermfg=07
hi rubyStringDelimiter ctermfg=07
