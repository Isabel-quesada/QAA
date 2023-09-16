#!/bin/bash

#SBATCH --partition=compute
#SBATCH --job-name=star_index
#SBATCH --output=star_index_%j.out
#SBATCH --error=star_index_%j.err
#SBATCH --time=0-03:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --account=bgmp
#SBATCH --mem=32G
#SBATCH --cpus-per-task=4
conda activate bgmp_star
/usr/bin/time -v STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir /home/iquesada/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.110.STAR_2.7.10b \
--genomeFastaFiles /home/iquesada/bgmp/bioinfo/Bi623/QAA/mouse_reference/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /home/iquesada/bgmp/bioinfo/Bi623/QAA/mouse_reference/Mus_musculus.GRCm39.110.gtf
