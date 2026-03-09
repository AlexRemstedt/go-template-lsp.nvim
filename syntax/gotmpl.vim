if exists("b:current_syntax")
  finish
endif

" Go template delimiters
syn region gotmplAction matchgroup=gotmplDelimiter start="{{-\?" end="-\?}}" contains=@gotmplExpr

" Comments
syn region gotmplComment matchgroup=gotmplDelimiter start="{{-\?\s*/\*" end="\*/-\?\s*}}" contains=gotmplTodo
syn keyword gotmplTodo contained TODO FIXME XXX NOTE HACK BUG

" Expression contents
syn cluster gotmplExpr contains=gotmplKeyword,gotmplFunction,gotmplVariable,gotmplPipe,gotmplString,gotmplRawString,gotmplNumber,gotmplBool,gotmplNil,gotmplOperator,gotmplField,gotmplIdentifier

" Keywords
syn keyword gotmplKeyword contained if else end range with template block define

" Built-in functions
syn keyword gotmplFunction contained and call html index js len not or print printf println slice urlquery eq ne lt le gt ge

" Sprig / Helm functions (commonly used with go-template-lsp)
syn keyword gotmplFunction contained default empty coalesce toJson fromJson toYaml fromYaml toToml fromToml
syn keyword gotmplFunction contained trim trimAll trimPrefix trimSuffix nospace upper lower title untitle repeat substr
syn keyword gotmplFunction contained contains hasPrefix hasSuffix quote squote cat indent nindent replace
syn keyword gotmplFunction contained list append prepend first rest last initial reverse uniq without has compact concat
syn keyword gotmplFunction contained dict get set unset hasKey pluck keys values merge mergeOverwrite
syn keyword gotmplFunction contained b64enc b64dec sha1sum sha256sum adler32sum
syn keyword gotmplFunction contained now date dateModify dateInZone duration ago toDate
syn keyword gotmplFunction contained int int64 float64 toString toStrings
syn keyword gotmplFunction contained add sub mul div mod max min ceil floor round
syn keyword gotmplFunction contained kindOf kindIs typeOf typeIs deepEqual
syn keyword gotmplFunction contained include required fail tpl lookup
syn keyword gotmplFunction contained regexMatch regexFind regexFindAll regexReplaceAll regexReplaceAllLiteral regexSplit
syn keyword gotmplFunction contained env expandenv getHostByName
syn keyword gotmplFunction contained semver semverCompare
syn keyword gotmplFunction contained derivePassword genPrivateKey buildCustomCert genCA genSelfSignedCert genSignedCert encryptAES decryptAES
syn keyword gotmplFunction contained osBase osDir osExt osClean osIsAbs pathBase pathDir pathExt pathClean pathIsAbs

" Variables ($var)
syn match gotmplVariable contained "\$\w*"

" Dot field access (.Field.Sub)
syn match gotmplField contained "\.\w\+"

" Pipe operator
syn match gotmplPipe contained "|"

" Assignment operators
syn match gotmplOperator contained ":="

" Strings
syn region gotmplString contained start=+"+ skip=+\\"+ end=+"+
syn region gotmplRawString contained start=+`+ end=+`+

" Numbers
syn match gotmplNumber contained "\<\d\+\>"
syn match gotmplNumber contained "\<\d\+\.\d*\>"
syn match gotmplNumber contained "\<\.\d\+\>"

" Booleans and nil
syn keyword gotmplBool contained true false
syn keyword gotmplNil contained nil

" Highlight links
hi def link gotmplDelimiter PreProc
hi def link gotmplAction None
hi def link gotmplComment Comment
hi def link gotmplTodo Todo
hi def link gotmplKeyword Keyword
hi def link gotmplFunction Function
hi def link gotmplVariable Identifier
hi def link gotmplField Type
hi def link gotmplPipe Operator
hi def link gotmplOperator Operator
hi def link gotmplString String
hi def link gotmplRawString String
hi def link gotmplNumber Number
hi def link gotmplBool Boolean
hi def link gotmplNil Constant

let b:current_syntax = "gotmpl"
