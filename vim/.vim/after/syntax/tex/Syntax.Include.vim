" matlab 和 c 的语法高亮
call SyntaxRange#Include('\\begin{minted}\(\[.*\]\)\{0,1}{matlab}', '\\end{minted}', 'matlab', 'NonText')
call SyntaxRange#Include('\\begin{minted}\(\[.*\]\)\{0,1}{c}', '\\end{minted}', 'c', 'NonText')
call SyntaxRange#Include('\\mint{matlab}|', '|', 'matlab', 'NonText')

" :call SyntaxRange#IncludeEx('start="\\begin{minted}\(\[.*\]\)\{0,1}{matlab}" skip="^[-+@       ]" end="^$"', 'diff')

" sagetex syntax
" https://github.com/lervag/vimtex/issues/2027
function SetupTeXInlineBlocks()
	let s:TeX_indentexpr=&indentexpr  " backup the normal values
	let s:TeX_indentkeys=&indentkeys

	if !exists("*GetPythonIndent")
		unlet b:did_indent
		source $VIMRUNTIME/indent/python.vim  " to define that function ^^ (assuming the internal indentation function is named GetPythonIndent)
		let s:Python_indentkeys=&indentkeys
    	let &indentexpr=s:TeX_indentexpr  " revert the indent
	endif

	if !exists("*GetLuaIndent")
		unlet b:did_indent
		source $VIMRUNTIME/indent/lua.vim
		let s:Lua_indentkeys=&indentkeys
    	let &indentexpr=s:TeX_indentexpr
	endif

	call SyntaxRange#Include('^\s*\\begin{luacode\*}', '\\end{luacode\*}', 'lua', 'Statement')
	call SyntaxRange#Include('^\s*\\directlua\s*{', '}', 'lua', 'Statement')
	call OnSyntaxChange#Install("LuaEnvironmentInTeX", "^synIncludeLua$", 1, "a")
	auto User SyntaxLuaEnvironmentInTeXEnterA set indentexpr=GetLuaIndent() | let &indentkeys=s:Lua_indentkeys
    auto User SyntaxLuaEnvironmentInTeXLeaveA let &indentexpr=s:TeX_indentexpr | let &indentkeys=s:TeX_indentkeys

	call SyntaxRange#Include('\\begin{python}', '\\end{python}', 'python', 'Statement')
	call SyntaxRange#Include('\v\\(py|pyc|pyq|pycq)\s*\{', '}', 'python', 'Statement')
	call OnSyntaxChange#Install("PyEnvironmentInTeX", "^synIncludePython$", 1, "a")
	auto User SyntaxPyEnvironmentInTeXEnterA set indentexpr=GetPythonIndent(v:lnum) | let &indentkeys=s:Python_indentkeys
    auto User SyntaxPyEnvironmentInTeXLeaveA let &indentexpr=s:TeX_indentexpr | let &indentkeys=s:TeX_indentkeys
endfunction

" augroup TeXInlineBlocks
" 	auto! FileType tex call SetupTeXInlineBlocks()
" augroup END

setlocal concealcursor=
