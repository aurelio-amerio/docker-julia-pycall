FROM julia:latest

LABEL maintainer="Aurelio Amerio <aure.amerio[at]techytok.com>" 

WORKDIR /tmp
# install miniconda3
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /software/miniconda3
RUN /software/miniconda3/condabin/conda init
ENV PATH /software/miniconda3/bin:$PATH

# update conda and create julia environment
RUN conda update -n base conda -y
RUN conda update -n base --all -y
RUN conda install -c conda-forge tmux -y
RUN conda create --name julia python=3.6
RUN conda install -n julia conda -y
RUN conda update -n julia --all -y

COPY install-pycall-docker.jl /tmp
# install pycall
RUN julia install-pycall-docker.jl
# clear tmp folder
RUN rm -rf /tmp/*