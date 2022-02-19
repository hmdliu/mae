#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=2-00:00:00
#SBATCH --mem=20GB
#SBATCH --gres=gpu:v100:1
#SBATCH --job-name=torch
#SBATCH --output=mae-base-100.out
#SBATCH --error=mae-base-100.out

# clear all modules
module purge

# call singularity env
singularity exec --nv \
	    --overlay /scratch/hl3797/DL-S2022/pytorch1.8.0-cuda11.1.ext3:ro \
	    /scratch/work/public/singularity/cuda11.1-cudnn8-devel-ubuntu18.04.sif \
	    /bin/bash -c "source /ext3/env.sh; python main_pretrain_new.py"