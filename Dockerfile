FROM julia:1.8-bullseye

RUN apt update
RUN apt install --yes python3 python3-pip git
RUN python3 -m pip install --upgrade wheel pip
RUN python3 -m pip install jupyter-book jupyter-cache

WORKDIR /io

COPY Manifest.toml /io/.
COPY Project.toml /io/.
COPY Makefile /io/.

ENV JULIA_MPI_BINARY=""
ENV JULIA_CUDA_USE_BINARYBUILDER="true"
ENV JULIA_CONDAPKG_BACKEND="Null"
ENV JULIA_PYTHONCALL_EXE="/usr/bin/python3"

RUN python3 -m pip install numpy

ENV JULIA_DEPOT_PATH=/usr/local/julia/local/share/julia:$JULIA_DEPOT_PATH
RUN make setup
RUN julia -e 'println("export PATH=$(DEPOT_PATH[1])/bin:\$PATH")' >> /etc/bash.bashrc
