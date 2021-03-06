#!/bin/bash
#SBATCH --job-name=ppta_pe_gwb_fixsl_intorf_30nf_x1_nosn4p
#SBATCH --output=/fred/oz002/bgoncharov/correlated_noise_logs/ppta_ptmcmc_pe_gwb_fixslope_inter_orf_30nf_set_x1_nosn4p_%A_%a.out
#SBATCH --ntasks=4
#SBATCH --time=1-21
#SBATCH --mem-per-cpu=7G
#SBATCH --tmp=12G
#SBATCH --array=0

pyv="$(python -c 'import sys; print(sys.version_info[0])')"
if [ "$pyv" == 2 ]
then
    echo "$pyv"
    module load numpy/1.16.3-python-2.7.14
fi

srun echo $TEMPO2
srun echo $TEMPO2_CLOCK_DIR
srun python /home/bgonchar/correlated_noise_pta_2020/run_analysis.py --prfile "/home/bgonchar/correlated_noise_pta_2020/params/ppta_dr2_ptmcmc_pe_gwb_fixslope_interp_orf_30_nf_set_x_1_nosn4p_20210101.dat" --num $SLURM_ARRAY_TASK_ID
