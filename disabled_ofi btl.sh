#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=4G
#SBATCH --time=00:10:00



module load OpenMPI/4.1.4-GCC-12.2.0

export mtl_ofi_enable_sep=0


#srun --export=ALL ./test_mpi
mpirun -np $SLURM_NTASKS ./test_mpi