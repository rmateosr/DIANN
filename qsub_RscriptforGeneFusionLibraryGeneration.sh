#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -l s_vmem=8G
set -xv
set -o errexit
set -o nounset
module use /usr/local/package/modulefiles/
module load R/4.4.3

Rscript Gene_Fusion_Library_Generation.Rscript






