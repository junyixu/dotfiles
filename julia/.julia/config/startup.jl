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

# TODO 如果我用 conda 这句可能造成问题。特别是我用 git 同步
ENV["PYTHON"]="/usr/bin/python"

macro paste()
	include_string(Main, read(pipeline(`xclip -quiet -out -selection`, stderr=stderr), String));
end

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

# https://discourse.julialang.org/t/how-to-convert-vector-of-vectors-to-matrix/72609/33?u=junix
Base.Matrix(::AbstractVector{<:AbstractArray}) = throw(ArgumentError("Matrix(vv) does not support vectors of arrays; perhaps you mean stack(vv) or reduce(hcat, vv)?"))

using Statistics
