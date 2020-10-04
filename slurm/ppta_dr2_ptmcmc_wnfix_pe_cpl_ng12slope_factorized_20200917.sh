#!/bin/bash
#SBATCH --job-name=ppta_ptmcmc_wnfix_pe_cpl_ng12slope_factorized
#SBATCH --output=/fred/oz002/bgoncharov/correlated_noise_logs/ppta_ptmcmc_wnfix_pe_cpl_ng12slope_factorized_%A_%a.out
#SBATCH --ntasks=2
#SBATCH --time=1-0
#SBATCH --mem-per-cpu=2G
#SBATCH --tmp=2G
#SBATCH --array=1-12,14-19,21-25

module load numpy/1.16.3-python-2.7.14

srun echo $TEMPO2
srun echo $TEMPO2_CLOCK_DIR
srun python /home/bgonchar/correlated_noise_pta_2020/run_analysis.py --prfile "/home/bgonchar/correlated_noise_pta_2020/params/ppta_dr2_ptmcmc_wnfix_pe_common_pl_ng12gam_factorized_20200917.dat" --num $SLURM_ARRAY_TASK_ID
