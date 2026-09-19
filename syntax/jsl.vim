" ============================================================================
" JSL syntax
" ============================================================================

if exists("b:current_syntax")
  finish
endif


" ----------------------------------------------------------------------------
" Comments / Strings
" ----------------------------------------------------------------------------

syntax match  jslComment "//.*$"
syntax region jslComment start="/\*" end="\*/"

syntax region jslString start=/"/ skip=/\\"/ end=/"/


" ----------------------------------------------------------------------------
" Numbers
" ----------------------------------------------------------------------------

" 123
" 123.45
" .45
" 1e10
" 1.5e-3
syntax match jslNumber "\v<(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?>"


" ----------------------------------------------------------------------------
" Operators
" ----------------------------------------------------------------------------

" JSL message operator
syntax match jslMessageOperator "<<"

" Comparison / assignment / arithmetic
syntax match jslOperator "=="
syntax match jslOperator "!="
syntax match jslOperator "<="
syntax match jslOperator ">="
syntax match jslOperator "="
syntax match jslOperator "+"
syntax match jslOperator "-"
syntax match jslOperator "\*"
syntax match jslOperator "/"
syntax match jslOperator "\^"
syntax match jslOperator "<"
syntax match jslOperator ">"

syntax keyword jslOperator And Or Not


" ----------------------------------------------------------------------------
" Control flow
" ----------------------------------------------------------------------------

syntax keyword jslConditional
      \ If
      \ Then
      \ Else
      \ Match
      \ Choose

syntax keyword jslRepeat
      \ For
      \ ForEach
      \ ForEachRow
      \ While

syntax keyword jslKeyword
      \ Break
      \ Continue
      \ Return
      \ Throw
      \ Try


" ----------------------------------------------------------------------------
" Constants
" ----------------------------------------------------------------------------

syntax keyword jslBoolean True False

syntax keyword jslConstant
      \ Empty
      \ Pi


" ----------------------------------------------------------------------------
" Column references
"
" :Height
" :Weight
" :SomeColumn
" ----------------------------------------------------------------------------

syntax match jslColumn ":\s*[A-Za-z_][A-Za-z0-9_]*"


" ----------------------------------------------------------------------------
" Namespace references
"
" namespace:name
"
" Avoid matching :Column by requiring something before the colon.
" ----------------------------------------------------------------------------

syntax match jslNamespace "\<[A-Za-z_][A-Za-z0-9_]*:[A-Za-z_][A-Za-z0-9_]*\>"


" ----------------------------------------------------------------------------
" Function calls
"
" Sqrt(x)
" New Table(...)
" My Function(...)
"
" JSL function names can contain spaces, which makes perfect regex detection
" difficult. First rule handles normal identifiers.
" ----------------------------------------------------------------------------

syntax match jslFunction "\<[A-Za-z_][A-Za-z0-9_]*\>\ze\s*("


" ----------------------------------------------------------------------------
" Common multi-word JSL functions
"
" Add more here as encountered.
" ----------------------------------------------------------------------------

syntax match jslFunction "\<New\s\+Table\>\ze\s*("
syntax match jslFunction "\<New\s\+Column\>\ze\s*("
syntax match jslFunction "\<Current\s\+Data\s\+Table\>\ze\s*("
syntax match jslFunction "\<Open\>\ze\s*("
syntax match jslFunction "\<Close\>\ze\s*("
syntax match jslFunction "\<Print\>\ze\s*("
syntax match jslFunction "\<Show\>\ze\s*("
syntax match jslFunction "\<Eval\>\ze\s*("
syntax match jslFunction "\<Expr\>\ze\s*("
syntax match jslFunction "\<Name\s\+Expr\>\ze\s*("
syntax match jslFunction "\<Parse\>\ze\s*("
syntax match jslFunction "\<Char\>\ze\s*("
syntax match jslFunction "\<Num\>\ze\s*("


" ----------------------------------------------------------------------------
" Messages
"
" dt << Show Window;
" dt << New Column(...);
"
" Highlight identifier immediately after <<
" ----------------------------------------------------------------------------

syntax match jslMessage "\%(\<\w\+\>\s*<<\s*\)\@<=[A-Za-z_][A-Za-z0-9_]*"

" Common multi-word messages
syntax match jslMessage "\%(\s<<\s\)\@<=New\s\+Column"
syntax match jslMessage "\%(\s<<\s\)\@<=Delete\s\+Columns"
syntax match jslMessage "\%(\s<<\s\)\@<=Get\s\+Rows"
syntax match jslMessage "\%(\s<<\s\)\@<=Get\s\+Name"
syntax match jslMessage "\%(\s<<\s\)\@<=Set\s\+Name"


" ----------------------------------------------------------------------------
" Named arguments
"
" New Column(
"     "Age",
"     Numeric,
"     Continuous,
"     Format("Best", 12)
" )
"
" These bare words behave more like configuration symbols than variables.
" ----------------------------------------------------------------------------

syntax keyword jslAttribute
      \ Numeric
      \ Character
      \ Continuous
      \ Nominal
      \ Ordinal


" ----------------------------------------------------------------------------
" Assignment targets
"
" foo = ...
" ----------------------------------------------------------------------------

syntax match jslVariable "\<[A-Za-z_][A-Za-z0-9_]*\>\ze\s*="


" ----------------------------------------------------------------------------
" Delimiters
" ----------------------------------------------------------------------------

syntax match jslDelimiter "[,;]"
syntax match jslBracket "[()[\]{}]"


" ============================================================================
" Highlight mappings
" ============================================================================

highlight default link jslComment         Comment
highlight default link jslString          String
highlight default link jslNumber          Number

highlight default link jslOperator        Operator
highlight default link jslMessageOperator Operator

highlight default link jslConditional     Conditional
highlight default link jslRepeat          Repeat
highlight default link jslKeyword         Keyword

highlight default link jslBoolean         Boolean
highlight default link jslConstant        Constant

highlight default link jslColumn          Identifier
highlight default link jslNamespace       Type
highlight default link jslVariable        Identifier

highlight default link jslFunction        Function
highlight default link jslMessage         Function
highlight default link jslAttribute       Type

highlight default link jslDelimiter       Delimiter
highlight default link jslBracket         Delimiter


let b:current_syntax = "jsl"
