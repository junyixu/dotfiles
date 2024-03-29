setlocal commentstring=(*\ %s\ *)
imap <buffer> `0 \[Emptyset]
imap <buffer> `6 \[Partial]
imap <buffer> `8 \[Infinity]
imap <buffer> `= \[Equiv]
imap <buffer> `\ \[Setminus]
imap <buffer> `. \[Cdot]
imap <buffer> `* \[Times]
imap <buffer> `< \[Langle]
imap <buffer> `> \[Rangle]
imap <buffer> `H \[Hbar]
imap <buffer> `+ \[Dagger]
imap <buffer> `[ \[Subseteq]
imap <buffer> `] \[Supseteq]
imap <buffer> `( \[Subset]
imap <buffer> `) \[Supset]
imap <buffer> `A \[Forall]
imap <buffer> `a \[Alpha]
imap <buffer> `b \[Beta]
imap <buffer> `c \[Chi]
imap <buffer> `d \[Delta]
imap <buffer> `e \[Epsilon]
imap <buffer> `E \[CapitalEpsilon]
imap <buffer> `f \[Phi]
imap <buffer> `g \[Gamma]
imap <buffer> `h \[Eta]
imap <buffer> `i \[Iota]
imap <buffer> `k \[Kappa]
imap <buffer> `l \[Lambda]
imap <buffer> `m \[Mu]
imap <buffer> `M \[CapitalMu]
imap <buffer> `n \[Nu]
imap <buffer> `N \[CapitalNu]
imap <buffer> `p \[Pi]
imap <buffer> `q \[Theta]
imap <buffer> `r \[Rho]
imap <buffer> `s \[Sigma]
imap <buffer> `t \[Tau]
imap <buffer> `y \[Psi]
imap <buffer> `u \[Upsilon]
imap <buffer> `w \[Omega]
imap <buffer> `z \[Zeta]
imap <buffer> `x \[Xi]

command! MathematicaNormalModeCreateCell :execute 'normal! :set paste<CR>m`O(**  **)<ESC>``:set nopaste<CR>'
command! MathematicaVisualModeCreateCell :execute 'normal! gvD:set paste<CR>O(**  **)<CR>(**  **)<ESC>P:set nopaste<CR>'
command! MathematicaInsertModeCreateCell :execute 'normal! I(**  **) '

nnoremap <buffer><silent> <M-c> :MathematicaNormalModeCreateCell<CR>
vnoremap <buffer><silent> <M-c> :<C-u>MathematicaVisualModeCreateCell<CR>
inoremap <buffer><silent> <M-c> <C-o>:MathematicaInsertModeCreateCell<CR>

