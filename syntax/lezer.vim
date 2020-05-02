if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let b:current_syntax = "lezer"

syntax iskeyword @,48-57,192-255,@-@
syntax keyword lezerKeyword
	\ @precedence @cut @left @right
	\ @top @tokens @skip @detectDelim @external @specialize @extend
highlight link lezerKeyword Keyword

syntax region lezerComment start="//" end="$"
highlight link lezerComment Comment

syntax region lezerString start=/'/ end=/'/ contains=lezerStringModifier
syntax region lezerString start=/"/ end=/"/ contains=lezerStringModifier
syntax match lezerStringModifier '\\.' contained
highlight link lezerString String
highlight link lezerStringModifier Special

syntax match lezerOperator "[|*+?()]"
highlight link lezerOperator Operator
