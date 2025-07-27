# install and library necessary packages
if (!require("qqman")) install.packages("qqman")
library(qqman)

# read GWAS results
gwas_data <- read.table("plink.assoc", header = TRUE)

# select top 3 related SNPs based on minimized p-value
top_snps_gwas <- gwas_data[order(gwas_data$P), ][1:3, ]

# draw manhattan plots with labeling 3 related SNPs
pdf("gwas_manhattan.pdf")
manhattan(gwas_data, main="GWAS Manhattan Plot", 
          highlight=top_snps_gwas$SNP, col=c("blue4", "orange3"))
dev.off()

# read QTL results
qtl_data <- read.table("plink.assoc.linear", header = TRUE)

# select top 3 related SNPs based on minimized p-value
top_snps_qtl <- qtl_data[order(qtl_data$P), ][1:3, ]

# draw manhattan plots with labeling 3 related SNPs
pdf("qtl_manhattan.pdf")
manhattan(qtl_data, main="QTL Manhattan Plot", 
          highlight=top_snps_qtl$SNP, col=c("red4", "green3"))
dev.off()

# Read the genotype data from PLINK output
geno_data <- read.table("snp_genotypes.raw", header = TRUE)

# select top SNP from top_snps_qtl
top_snp <- "X22.17722055.A.G_A"
geno_data <- geno_data[, c("FID", "IID", top_snp)]  # FID, IID and top SNP phenotype

# Read phenotypic data of gene expression
pheno_data <- read.table("chs_chr22_pheno.txt", header = TRUE)

# incorporate genotype and gene expression data
combined_data <- merge(geno_data, pheno_data, by = c("FID", "IID"))

# Rename column
colnames(combined_data)[3] <- "GENO"  # genotype
colnames(combined_data)[5] <- "EXP"   # gene expression

# Save the merged data as a txt file
write.table(combined_data, "geno_expression_data.txt", row.names = FALSE, quote = FALSE, sep = "\t")

# read geno_expression_data.txt
geno_expr_data <- read.table("geno_expression_data.txt", header = TRUE)

# draw the scatter plot
pdf("gene_expression_scatter.pdf")
plot(geno_expr_data$GENO, geno_expr_data$EXP,
     xlab="Genotype (0=AA, 1=AB, 2=BB)", ylab="Gene Expression",
     main=paste("Gene Expression vs Genotype for SNP", top_snp),
     col="blue", pch=19)
dev.off()


