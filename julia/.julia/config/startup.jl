#=
    startup
    Copyright © 2022 junyi <junyi@Junix>

    Distributed under terms of the MIT license.
=#

# https://github.com/KristofferC/OhMyREPL.jl/issues/166
# https://github.com/jpalardy/vim-slime/pull/314
# using OhMyREPL
# @async begin
#     # reinstall keybindings to work around https://github.com/KristofferC/OhMyREPL.jl/issues/166
#     sleep(1)
#     OhMyREPL.Prompt.insert_keybindings()
# end
# using LinearAlgebra
# using Statistics

ENV["PYTHON"]="/usr/bin/python"
macro paste()
	include_string(Main, read(pipeline(`xclip -quiet -out -selection`, stderr=stderr), String));
end

ϵ0=8.8541878128e−12

using DelimitedFiles
macro csv(mat)
	quote
		local filename=$(string(mat))*".csv"
		writedlm(filename, $(esc(mat)), ",")
		run(`xdg-open $filename`)
	end
end

using PhysicalConstants
macro constant(arg)
	:($(esc(arg))=PhysicalConstants.CODATA2018.$(arg).val)
end
