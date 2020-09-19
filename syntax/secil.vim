if exists('b:current_syntax')
    finish
endif

"" Define all S-expression forms

syntax region sExpression start='(' end=')' transparent fold

syntax keyword secilKeyword block blockabstract blockinherit in
syntax keyword secilKeyword user userattribute userattributeset userrange userlevel userrole
syntax keyword secilKeyword role roleattribute roleattributeset roletype
syntax keyword secilKeyword type typeattribute typeattributeset typealias typealiasactual
syntax keyword secilKeyword boolean booleanif tunable tunableif
syntax keyword secilKeyword dom domby incomp eq ne neq and or not xor
syntax keyword secilKeyword sensitivity sensitivityalias sensitivityaliasactual sensitivityorder sensitivitycategory
syntax keyword secilKeyword category categoryalias categoryaliasactual categoryorder categoryset
syntax keyword secilKeyword level levelrange
syntax keyword secilKeyword defaultuser defaultrole defaulttype defaultrange
syntax keyword secilKeyword mls mlsconstrain constrain
syntax keyword secilKeyword sid sidorder sidcontext context genfscon filecon
syntax keyword secilKeyword allow allowx auditallow auditallowx neverallow neverallowx dontaudit dontauditx roleallow
syntax keyword secilKeyword class classorder unordered classpermission classpermissionset classmap classmapping common classcommon permissionx
syntax keyword secilKeyword typetransition rangetransition roletransition
syntax keyword secilKeyword call
syntax keyword secilKeyword selinuxuser selinuxuserdefault
syntax keyword secilKeyword optional
syntax keyword secilKeyword all self range

"" Match string literals in the case of e.g., a path to filecon

syntax region secilString start=/\v"/ skip=/\v\\./ end=/\v"/

"" Define constants such as true and false

syntax keyword secilConstant true false

"" Make a distinction between regular keywords and macro definitions

syntax keyword secilMacro macro

"" Match line comments

syntax match secilComment ";.*$"

"" Highlite todos

syntax keyword secilTodos TODO XXX FIXME NOTE containedin=secilComment

"" Set some common identifiers

syntax keyword secilIdentifier low high systemlow systemhigh lowhigh lowlow highhigh
syntax keyword secilIdentifier h1 h2 l1 l2
syntax keyword secilIdentifier r1 r2 r3 t1 t2 t3 u1 u2 u3
syntax keyword secilIdentifier object_r
syntax keyword secilIdentifier type types templates
syntax match secilIdentifier "\<template\(_\h\+\)\?"

"" Add syntax highlighting for parenthesis

syntax match parens /[()]/

"" Group all secil tokens together

syntax cluster secilCluster contains=secilKeyword,secilString,secilConstant,secilMacro,secilComment,secilTodos

"" Create regions of nested parens for rainbow highlighting
"" taken from the lisp highlighting by (`locate syntax/lisip.vim`)

syntax region secilParen0 matchgroup=hlLevel0 start="(" end=")"  contains=@secilCluster,secilParen1
syntax region secilParen1 contained matchgroup=hlLevel1 start="(" end=")"  contains=@secilCluster,secilParen2
syntax region secilParen2 contained matchgroup=hlLevel2 start="(" end=")"  contains=@secilCluster,secilParen3
syntax region secilParen3 contained matchgroup=hlLevel3 start="(" end=")"  contains=@secilCluster,secilParen4
syntax region secilParen4 contained matchgroup=hlLevel4 start="(" end=")"  contains=@secilCluster,secilParen5
syntax region secilParen5 contained matchgroup=hlLevel5 start="(" end=")"  contains=@secilCluster,secilParen6
syntax region secilParen6 contained matchgroup=hlLevel6 start="(" end=")"  contains=@secilCluster,secilParen7
syntax region secilParen7 contained matchgroup=hlLevel7 start="(" end=")"  contains=@secilCluster,secilParen8
syntax region secilParen8 contained matchgroup=hlLevel8 start="(" end=")"  contains=@secilCluster,secilParen9
syntax region secilParen9 contained matchgroup=hlLevel9 start="(" end=")"  contains=@secilCluster,secilParen0

highlight link secilString String
highlight link secilComment Comment
highlight link secilKeyword Keyword
highlight link secilMacro Function
highlight link secilIdentifier Special

"" TODO: figure out a good neutral color scheme

if &bg == "dark"
    highlight def hlLevel0 ctermfg=brown        guifg=red
    highlight def hlLevel1 ctermfg=Darkblue      guifg=orange
    highlight def hlLevel2 ctermfg=darkyellow    guifg=yellow
    highlight def hlLevel3 ctermfg=darkgreen        guifg=greenyellow
    highlight def hlLevel4 ctermfg=darkcyan     guifg=green
    highlight def hlLevel5 ctermfg=red         guifg=springgreen1
    highlight def hlLevel6 ctermfg=darkmagenta      guifg=cyan1
    highlight def hlLevel7 ctermfg=brown       guifg=slateblue1
    highlight def hlLevel8 ctermfg=gray        guifg=magenta
    highlight def hlLevel9 ctermfg=black     guifg=purple
endif

syntax sync fromstart

let b:current_syntax = 'secil'
