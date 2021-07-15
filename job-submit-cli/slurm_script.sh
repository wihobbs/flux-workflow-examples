#! /bin/bash
#SBATCH -C haswell
#SBATCH -A nintern
#SBATCH -N 3
#SBATCH --qos=regular

module purge
module load e4s/21.02
spack env activate $HOME/newfluxenv
export PYTHONPATH=~/newfluxenv/.spack-env/view/lib/python3.8/site-packages

srun -N 3 -n 3 flux start -o,-S,out=fluxoutlog flux_script.sh
wait
