#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=compute
#SBATCH --mail-user=iquesada@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB

module load fastqc/0.11.5

file1="/projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R1_001.fastq.gz"
file2="/projects/bgmp/shared/2017_sequencing/demultiplexed/6_2D_mbnl_S5_L008_R2_001.fastq.gz"
file3="/projects/bgmp/shared/2017_sequencing/demultiplexed/16_3D_mbnl_S12_L008_R1_001.fastq.gz"
file4="/projects/bgmp/shared/2017_sequencing/demultiplexed/16_3D_mbnl_S12_L008_R2_001.fastq.gz"

/usr/bin/time -v fastqc -o /home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R1_001_fastqc $file1
/usr/bin/time -v fastqc -o /home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008_R2_001_fastqc $file2
/usr/bin/time -v fastqc -o /home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R1_001_fastqc $file3
/usr/bin/time -v fastqc -o /home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008_R2_001_fastqc $file4
