if vim.b.current_syntax then
  return
end

local cmd = vim.cmd

cmd([[syn region gotmplAction matchgroup=gotmplDelimiter start="{{-\?" end="-\?}}" contains=@gotmplExpr]])

cmd([[syn region gotmplComment matchgroup=gotmplDelimiter start="{{-\?\s*/\*" end="\*/-\?\s*}}" contains=gotmplTodo]])
cmd([[syn keyword gotmplTodo contained TODO FIXME XXX NOTE HACK BUG]])

cmd([[syn cluster gotmplExpr contains=gotmplKeyword,gotmplFunction,gotmplVariable,gotmplPipe,gotmplString,gotmplRawString,gotmplNumber,gotmplBool,gotmplNil,gotmplOperator,gotmplField,gotmplIdentifier]])

cmd([[syn keyword gotmplKeyword contained if else end range with template block define]])

cmd([[syn keyword gotmplFunction contained and call html index js len not or print printf println slice urlquery eq ne lt le gt ge]])
cmd([[syn keyword gotmplFunction contained default empty coalesce toJson fromJson toYaml fromYaml toToml fromToml]])
cmd([[syn keyword gotmplFunction contained trim trimAll trimPrefix trimSuffix nospace upper lower title untitle repeat substr]])
cmd([[syn keyword gotmplFunction contained contains hasPrefix hasSuffix quote squote cat indent nindent replace]])
cmd([[syn keyword gotmplFunction contained list append prepend first rest last initial reverse uniq without has compact concat]])
cmd([[syn keyword gotmplFunction contained dict get set unset hasKey pluck keys values merge mergeOverwrite]])
cmd([[syn keyword gotmplFunction contained b64enc b64dec sha1sum sha256sum adler32sum]])
cmd([[syn keyword gotmplFunction contained now date dateModify dateInZone duration ago toDate]])
cmd([[syn keyword gotmplFunction contained int int64 float64 toString toStrings]])
cmd([[syn keyword gotmplFunction contained add sub mul div mod max min ceil floor round]])
cmd([[syn keyword gotmplFunction contained kindOf kindIs typeOf typeIs deepEqual]])
cmd([[syn keyword gotmplFunction contained include required fail tpl lookup]])
cmd([[syn keyword gotmplFunction contained regexMatch regexFind regexFindAll regexReplaceAll regexReplaceAllLiteral regexSplit]])
cmd([[syn keyword gotmplFunction contained env expandenv getHostByName]])
cmd([[syn keyword gotmplFunction contained semver semverCompare]])
cmd([[syn keyword gotmplFunction contained derivePassword genPrivateKey buildCustomCert genCA genSelfSignedCert genSignedCert encryptAES decryptAES]])
cmd([[syn keyword gotmplFunction contained osBase osDir osExt osClean osIsAbs pathBase pathDir pathExt pathClean pathIsAbs]])

cmd([[syn match gotmplVariable contained "\$\w*"]])
cmd([[syn match gotmplField contained "\.\w\+"]])
cmd([[syn match gotmplPipe contained "|"]])
cmd([[syn match gotmplOperator contained ":="]])

cmd([[syn region gotmplString start=+"+ skip=+\\"+ end=+"+ contained]])
cmd([[syn region gotmplRawString start=+`+ end=+`+ contained]])

cmd([[syn match gotmplNumber contained "\<\d\+\>"]])
cmd([[syn match gotmplNumber contained "\<\d\+\.\d*\>"]])
cmd([[syn match gotmplNumber contained "\<\.\d\+\>"]])

cmd([[syn keyword gotmplBool contained true false]])
cmd([[syn keyword gotmplNil contained nil]])

vim.api.nvim_set_hl(0, "gotmplDelimiter", { default = true, link = "PreProc" })
vim.api.nvim_set_hl(0, "gotmplAction", { default = true, link = "NONE" })
vim.api.nvim_set_hl(0, "gotmplComment", { default = true, link = "Comment" })
vim.api.nvim_set_hl(0, "gotmplTodo", { default = true, link = "Todo" })
vim.api.nvim_set_hl(0, "gotmplKeyword", { default = true, link = "Keyword" })
vim.api.nvim_set_hl(0, "gotmplFunction", { default = true, link = "Function" })
vim.api.nvim_set_hl(0, "gotmplVariable", { default = true, link = "Identifier" })
vim.api.nvim_set_hl(0, "gotmplField", { default = true, link = "Type" })
vim.api.nvim_set_hl(0, "gotmplPipe", { default = true, link = "Operator" })
vim.api.nvim_set_hl(0, "gotmplOperator", { default = true, link = "Operator" })
vim.api.nvim_set_hl(0, "gotmplString", { default = true, link = "String" })
vim.api.nvim_set_hl(0, "gotmplRawString", { default = true, link = "String" })
vim.api.nvim_set_hl(0, "gotmplNumber", { default = true, link = "Number" })
vim.api.nvim_set_hl(0, "gotmplBool", { default = true, link = "Boolean" })
vim.api.nvim_set_hl(0, "gotmplNil", { default = true, link = "Constant" })

vim.b.current_syntax = "gotmpl"
