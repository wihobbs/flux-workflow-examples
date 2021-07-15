#! /bin/sh
#SBATCH -C haswell
#SBATCH -N 4
#SBATCH --qos=regular
#SBATCH -A nintern
#SBATCH --time=01:00:00

cd $SCRATCH/flux-workflow-examples/hierarchical-launching

module use /global/common/software/flux/modulefiles
module load czmq python jansson flux


srun -N3 --no-kill --wait=0 --mpi=none flux start -o,-S,log-filename=out /global/cscratch1/sd/hobbs/flux-workflow-examples/hierarchical-launching/parent.sh
wait
