export TEXLIVE=/usr/local/texlive/2021
export MATLAB=/opt/MATLAB/R2019b

export PATH=$HOME/bin:$HOME/.local/bin/:$MATLAB/bin:$PATH

# texlive
export PATH=$TEXLIVE/bin/x86_64-linux:$PATH
export MANPATH=$TEXLIVE/texmf-dist/doc/man:$MANPATH
export INFOPATH=$TEXLIVE/texmf-dist/doc/info:$INFOPATH
