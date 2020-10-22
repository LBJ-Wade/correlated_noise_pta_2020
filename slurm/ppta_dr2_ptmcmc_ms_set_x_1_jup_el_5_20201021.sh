#!/bin/bash
#SBATCH --job-name=ppta_ptmcmc_ms_set_x_1_ephem_jup_el_5
#SBATCH --output=/fred/oz002/bgoncharov/correlated_noise_logs/ppta_ptmcmc_ms_set_x_1_ephem_jup_el_5_%A_%a.out
#SBATCH --ntasks=4
#SBATCH --time=0-19
#SBATCH --mem-per-cpu=4G
#SBATCH --tmp=10G
#SBATCH --array=0

pyv="$(python -c 'import sys; print(sys.version_info[0])')"
if [ "$pyv" == 2 ]
then
    echo "$pyv"
    module load numpy/1.16.3-python-2.7.14
fi

srun echo $TEMPO2
srun echo $TEMPO2_CLOCK_DIR
srun python /home/bgonchar/correlated_noise_pta_2020/run_analysis.py --prfile "/home/bgonchar/correlated_noise_pta_2020/params/ppta_dr2_ptmcmc_ms_set_x_1_jup_el_5_20201021.dat" --num $SLURM_ARRAY_TASK_ID
