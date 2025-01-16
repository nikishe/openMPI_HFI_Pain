#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=4G
#SBATCH --time=00:10:00



module load OpenMPI/4.1.4-GCC-12.2.0

export OMPI_MCA_btl="^smcuda,vader,tcp,self"

#srun --export=ALL ./test_mpi
mpirun --mca btl tcp -np $SLURM_NTASKS --mca mtl_base_verbose 100  ./test_mpi