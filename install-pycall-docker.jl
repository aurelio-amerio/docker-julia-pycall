using Pkg

ENV["PYTHON"] = "" 
ENV["CONDA_JL_HOME"] = "/software/miniconda3/envs/julia"

Pkg.add("PyCall")
Pkg.build("PyCall")

using PyCall

np=pyimport("numpy")
hp=pyimport("healpy")

println(np.__version__)
println(hp.__version__)
