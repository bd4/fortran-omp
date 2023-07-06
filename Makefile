.PHONY: all
all: concurrent_omp_ifx concurrent_omp_gnu

concurrent_omp_ifx: concurrent_omp.F90
	ifx -fiopenmp -o $@ $<

concurrent_omp_gnu: concurrent_omp.F90
	gfortran -fopenmp -o $@ $<

.PHONY: clean
clean:
	rm -rf concurrent_omp_*
