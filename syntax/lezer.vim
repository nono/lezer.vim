if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let b:current_syntax = "lezer"

syntax match lezerOperator "[|*+?()~!<>\[\]=]"
highlight link lezerOperator Operator

syntax iskeyword @,48-57,192-255,@-@
syntax keyword lezerKeyword
	\ @precedence @cut @left @right
	\ @top @tokens @skip @detectDelim @external @specialize @extend
highlight link lezerKeyword Keyword

syntax keyword lezerStd
	\ std.asciiLetter std.asciiLowercase std.asciiUppercase
	\ std.digit std.whitespace
highlight link lezerStd Define

syntax region lezerComment start="//" end="$" contains=lezerTodo
highlight link lezerComment Comment

syntax keyword lezerTodo contained TODO FIXME XXX
highlight def link lezerTodo Todo

syntax region lezerSet start=/[!$]\[/ end=/\]/ contains=lezerSetModifier
syntax match lezerSetModifier '\\.' contained
highlight link lezerSet SpecialChar
highlight link lezerSetModifier Special

syntax region lezerString start=/'/ end=/'/ contains=lezerStringModifier
syntax region lezerString start=/"/ end=/"/ contains=lezerStringModifier
syntax match lezerStringModifier '\\.' contained
highlight link lezerString String
highlight link lezerStringModifier Special
