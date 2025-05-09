#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -o log
#$ -e log
#$ -l s_vmem=8G
set -xv
set -o errexit
set -o nounset

Rscript noncanonicalpeptidesanalysis_Hotspot.R






