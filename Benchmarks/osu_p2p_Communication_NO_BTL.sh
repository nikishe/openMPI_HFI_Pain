#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem=8G
#SBATCH --time=01:00:00



module load OpenMPI/4.1.4-GCC-12.2.0

export OMPI_MCA_btl="^openib,ofi"


echo "==========================================collective/osu_allreduce=========================================="
srun --export=ALL /mnt/parscratch/users/cs1nmu/public/tutorials/OSU-MicroBenchmarks/build.openmpi/libexec/osu-micro-benchmarks/mpi/pt2pt/osu_latency
echo "==========================================collective/osu_bcast=============================================="
srun --export=ALL /mnt/parscratch/users/cs1nmu/public/tutorials/OSU-MicroBenchmarks/build.openmpi/libexec/osu-micro-benchmarks/mpi/pt2pt/osu_bw