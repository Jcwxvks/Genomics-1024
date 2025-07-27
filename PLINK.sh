# Identify SNPs and sample deletions
plink --vcf chs_chr22_kgp.vcf --allow-extra-chr --allow-no-sex --freq

# determine the MAF of the SNP
plink --vcf chs_chr22_kgp.vcf --allow-extra-chr --allow-no-sex --pheno chs_chr22_pheno.txt --pheno-name case_control --assoc

# Use phenotype "case control" for GWAS
plink --vcf chs_chr22_kgp.vcf --allow-extra-chr --allow-no-sex --pheno chs_chr22_pheno.txt --pheno-name gene_expression --linear

# Use phenotype "gene expression" for QTL analysis
plink --vcf chs_chr22_kgp.vcf --allow-extra-chr --allow-no-sex --recode A -out snp_genotypes
