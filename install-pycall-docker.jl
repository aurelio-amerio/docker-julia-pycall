using Pkg

ENV["PYTHON"] = "" 
ENV["CONDA_JL_HOME"] = "/software/miniconda3/envs/julia"

Pkg.add("PyCall")
Pkg.build("PyCall")

using PyCall

np=pyimport("numpy")

println("Numpy version: $(np.__version__)")
