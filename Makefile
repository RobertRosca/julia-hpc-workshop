setup:
	julia --project=$(CURDIR) -e "using Pkg; Pkg.instantiate(); Pkg.precompile()"
	julia --project=$(CURDIR) -e "using PythonCall"
	julia --project=$(CURDIR) -e "using MPI; MPI.install_mpiexecjl(; force=true)"
	julia --project=$(CURDIR) -e 'using IJulia; installkernel("julia"); installkernel("Julia (4 Threads)", "--threads=4", "--project=@.", specname="julia-4-threads")'

html:
	jupyter-book build . --builder html
	cp $(CURDIR)/static/* $(CURDIR)/_build/html/_static/.
	cp -r $(CURDIR)/static $(CURDIR)/_build/html/static

linkcheck:
	jupyter-book build . --builder linkcheck

docker-build:
	docker build -t julia-hpc-workshop-jupyterbook .

docker-build-nocache:
	docker build -t julia-hpc-workshop-jupyterbook --no-cache .

define DOCKER_RUN
docker run --workdir=/io  -v $(CURDIR):/io julia-hpc-workshop-jupyterbook
endef

docker-bash:
	docker run -it --workdir=/io  -v $(CURDIR):/io julia-hpc-workshop-jupyterbook bash

docker-html:
	$(DOCKER_RUN) make html

docker-linkcheck:
	$(DOCKER_RUN) make linkcheck
