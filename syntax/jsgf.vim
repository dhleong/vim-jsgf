" Vim syntax file
" Language: JSpeech Grammar Format
" Maintainer: Daniel Leong
" Latest Revision: 22 July 2017

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "jsgf"

"
" Syntax elements
"

syn keyword jsgfInclude grammar import
syn keyword jsgfKeyword public

syn match jsgfGroup '\v[()]'
syn match jsgfOptional '[\[\]]'

syn region jsgfRule matchgroup=jsgfRuleMatchGroup start="\v\<" end="\v\>" contains=@Spell,jsgfBrokenRule
syn match jsgfBrokenRule "\v\<[^>]*[ ]+[^>]*\>"

syn match jsgfSpecialChar "\v\\\}" contained
syn region jsgfTag matchgroup=jsgfTagMatchGroup start="\v\{" skip="\\\}" end="\}" contains=@Spell,jsgfSpecialChar

syn region jsgfWeight matchgroup=jsgfWeightMatchGroup start="\v\/" end="\/" contains=@Spell

" AFTER the above so comments are highlighted correctly
syn match jsgfHeader "#JSGF.*$"
syn match jsgfLineComment "\v//.*$" contains=@Spell
syn region jsgfComment matchgroup=jsgfCommentMatchGroup start="/\*" end="\*/" contains=jsgfComment,@Spell


"
" Highlight linkage
"

hi link jsgfKeyword Structure

hi link jsgfInclude Include

hi link jsgfHeader Comment
hi link jsgfLineComment Comment
hi link jsgfComment Comment
hi link jsgfCommentMatchGroup Comment

hi link jsgfRule Identifier
hi link jsgfRuleMatchGroup String
hi link jsgfBrokenRule Error

hi link jsgfGroup Repeat
hi link jsgfOptional Exception

hi link jsgfSpecialChar SpecialChar
hi link jsgfTag String
hi link jsgfTagMatchGroup Statement

hi link jsgfWeight Constant
hi link jsgfWeightMatchGroup Statement


