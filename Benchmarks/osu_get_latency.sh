#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=4G
#SBATCH --time=00:10:00



module load OpenMPI/4.1.4-GCC-12.2.0

#export OMPI_MCA_btl="^openib,ofi"


#srun --export=ALL ./test_mpi
#mpirun --mca mtl ofi -np $SLURM_NTASKS --mca mtl_base_verbose 100  
srun --export=ALL /mnt/parscratch/users/cs1nmu/public/tutorials/OSU-MicroBenchmarks/build.openmpi/libexec/osu-micro-benchmarks/mpi/one-sided/osu_get_latency
echo "======================================================================="
echo "======================================================================="
echo "======================================================================="
echo "======================================================================="
#mpirun --mca mtl ofi -np $SLURM_NTASKS --mca mtl_base_verbose 100  
srun --export=ALL /mnt/parscratch/users/cs1nmu/public/tutorials/OSU-MicroBenchmarks/build.openmpi/libexec/osu-micro-benchmarks/mpi/one-sided/osu_get_bw
