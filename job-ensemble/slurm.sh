#! /bin/sh
#SBATCH -C haswell
#SBATCH -N 3
#SBATCH --qos=regular
#SBATCH -A nintern
#SBATCH --time=00:30:00

cd $SCRATCH/flux-workflow-examples/job-ensemble

module use /global/common/software/flux/modulefiles
module load czmq python jansson flux


srun -N3 --no-kill --wait=0 --mpi=none flux start -o,-S,log-filename=out /global/cscratch1/sd/hobbs/flux-workflow-examples/job-ensemble/ensemble.sh
wait
