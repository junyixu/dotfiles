if get(g:, 'vim_markdown_math', 0)
  syn region mkdMath start="\\\@<!\\(" end="\\)" contains=@tex keepend
  syn region mkdMath start="\\\@<!\\\[" end="\\\]" contains=@tex keepend
endif

