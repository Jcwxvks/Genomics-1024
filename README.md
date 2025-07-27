# Genetic QC, GWAS & QTL Analysis with PLINK

This repository provides a simple workflow for performing basic genetic data quality control, Genome-Wide Association Studies (GWAS), and Quantitative Trait Loci (QTL) analysis using [PLINK 1.9](https://www.cog-genomics.org/plink/1.9/) and R. The workflow demonstrates how to run these analyses on example data and visualize the results.

## Project Overview

Single nucleotide polymorphisms (SNPs) are the most common DNA sequence polymorphisms in human chromosomes. This project aims to understand phenotype-related SNP extraction and analysis in human chromosome 22 samples.

## Repository Contents

- **`chs_chr22_kgp.vcf`**  
  Test genotype data file in VCF format, containing SNPs on chromosome 22 for the CHS (Southern Han Chinese) population. Data sourced from the 1000 Genomes Project.

- **`chs_chr22_pheno.txt`**  
  Phenotype file containing:
  - `case_control`: Categorical trait (1 = control, 2 = case)
  - `gene_expression`: Continuous trait representing the expression level of a gene

- **`PLINK.sh`**  
  Shell script to run PLINK commands for data quality control and association analysis.

- **`Script.R`**  
  R script that:
  - Generates a Manhattan plot for GWAS results (highlighting the top 3 SNPs)
  - Generates a Manhattan plot for QTL results (highlighting the top 3 SNPs)
  - Creates scatter plots of genotype vs gene expression for the relevant SNPs

## How to use

1. **Run PLINK Analysis**

   ```bash
   bash PLINK.sh
   ```
   
   This will use PLINK to perform genotype QC and run both GWAS and QTL association tests as follows:
      - Convert VCF to PLINK binary format
      - Filter SNPs and samples as needed
      - Run association tests for categorical (`case_control`) and continuous (`gene_expression`) traits
  
2. **Run R Visualization**

   ```R
   source("Script.R")
   ```

   This will uses [qqman](https://cran.r-project.org/web/packages/qqman/index.html) to generate Manhattan plots for:
      - GWAS results (`case_control` trait)
      - QTL results (`gene_expression` trait)
      - Scatter plots show the relationship between significant SNPs and gene expression.

## References

- **Tools: [PLINK 1.9](https://www.cog-genomics.org/plink/1.9/), [qqman](https://cran.r-project.org/web/packages/qqman/index.html)**

## License

This project is open for academic and educational purposes.
