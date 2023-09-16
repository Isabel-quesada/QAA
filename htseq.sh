#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=compute
#SBATCH --mail-user=iquesada@uoregon.edu
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB

conda activate QAA

file1="/home/iquesada/bgmp/bioinfo/Bi623/QAA/16_3D_mbnl_S12_L008Aligned.out.sam"
file2="/home/iquesada/bgmp/bioinfo/Bi623/QAA/6_2D_mbnl_S5_L008Aligned.out.sam"
file3="/home/iquesada/bgmp/bioinfo/Bi623/QAA/mouse_reference/Mus_musculus.GRCm39.110.gtf"

/usr/bin/time -v htseq-count --stranded=yes $file1 $file3 > 16_3D_mbnl_S12_L008_fw_genecount.txt

/usr/bin/time -v htseq-count --stranded=reverse $file1 $file3 > 16_3D_mbnl_S12_L008_rv_genecount.txt

/usr/bin/time -v htseq-count --stranded=yes $file2 $file3 > 6_2D_mbnl_S5_L008_fw_genecount.txt

/usr/bin/time -v htseq-count --stranded=reverse $file2 $file3 > 6_2D_mbnl_S5_L008_rv_genecount.txt