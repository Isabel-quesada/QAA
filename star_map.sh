#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=compute
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=4
conda activate QAA
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /home/iquesada/bgmp/bioinfo/Bi623/QAA/trimmed_data/6_2D_mbnl_S5_L008_R1_trimmed_p.fastq.gz /home/iquesada/bgmp/bioinfo/Bi623/QAA/trimmed_data/6_2D_mbnl_S5_L008_R2_trimmed_p.fastq.gz \
--genomeDir /home/iquesada/bgmp/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.110.STAR_2.7.10b \
--outFileNamePrefix 6_2D_mbnl_S5_L008
