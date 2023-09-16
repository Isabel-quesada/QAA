#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=interactive
#SBATCH --reservation=bgmp-res
#SBATCH --mail-user=iquesada@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB

conda activate QAA 

file1="/home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R1_001_cutadapt.fastq.gz"
file2="/home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R2_001_cutadapt.fastq.gz"
file3="/home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R1_001_cutadapt.fastq.gz"
file4="/home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R2_001_cutadapt.fastq.gz"

/usr/bin/time -v trimmomatic PE -threads 4 $file1 $file2  \
              /home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R1_trimmed_p.fastq.gz  /home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R1_trimmed_u.fastq.gz\
              /home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R2_trimmed_p.fastq.gz  /home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R2_trimmed_u.fastq.gz\
              LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35


/usr/bin/time -v trimmomatic PE -threads 4 $file3 $file4  \
              /home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R1_001_trimmed_p.fastq.gz  /home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R1_001_trimmed_u.fastq.gz\
              /home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R2_001_trimmed_p.fastq.gz  /home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R2_001_trimmed_u.fastq.gz\
              LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35