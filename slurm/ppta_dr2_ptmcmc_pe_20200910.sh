#!/bin/bash
#SBATCH --job-name=ppta_ptmcmc_pe
#SBATCH --output=/fred/oz002/bgoncharov/correlated_noise_logs/ppta_ptmcmc_pe_%A_%a.out
#SBATCH --ntasks=2
#SBATCH --time=1-0
#SBATCH --mem-per-cpu=2G
#SBATCH --tmp=2G
#SBATCH --array=3,9,18,21

module load numpy/1.16.3-python-2.7.14

srun echo $TEMPO2
srun echo $TEMPO2_CLOCK_DIR
srun python /home/bgonchar/correlated_noise_pta_2020/run_analysis.py --prfile "/home/bgonchar/correlated_noise_pta_2020/params/ppta_dr2_ptmcmc_pe_20200910.dat" --num $SLURM_ARRAY_TASK_ID
