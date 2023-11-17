#!/usr/bin/env Rscript


setwd("/Users/rmoran/Desktop/cavefish/afvaper/")

#setwd("/home/mcgaughs/shared/Datasets/afvaper")

# install.packages("remotes",repos = "http://cran.us.r-project.org")
# remotes::install_github("JimWhiting91/afvaper")

library(afvaper,verbose = F)

library(vcfR,verbose = F)
library(ggplot2)


vcf_in <- read.vcfR("NW_019170535.1_Concat_HardFilt_246Indv_biSNPsONLY.AllRepsRemoved.Phased.ExcludeHet.MAF01.Miss02.vcf.gz")
vcf_in2 <- read.vcfR("/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/split_vcf_chr_SNPs_only/NW_019170536.1_Concat_HardFilt_246Indv_biSNPsONLY.AllRepsRemoved.Phased.ExcludeHet.MAF01.Miss02.vcf.gz")
vcf_in3 <- read.vcfR("/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/split_vcf_chr_SNPs_only/NW_019170537.1_Concat_HardFilt_246Indv_biSNPsONLY.AllRepsRemoved.Phased.ExcludeHet.MAF01.Miss02.vcf.gz")


#A popmap, with individuals in column 1 and population/habitat/ecotype in column 2
popmap <- read.table("7caves_parallel.popmap")



#A list of vectors describing parallel replicates.
# Build vector list. For our data it will be "surface","cave" replicates
vector_list <- list(
                    c("Mante","Vasquez"),
                    c("Mante","Molino"),
                    c("Rascon","Pachon"),
                    c("Rascon","Palmaseca"),
                    c("Rascon","Tinaja"),
                    c("Rascon","Yerbaniz"))



# Name vectors (we will use cave pop names to name each vector)
names(vector_list) <- c("Vasquez","Molino","Pachon","Palmaseca","Tinaja","Yerbaniz")

#In order to analyse our VCF, we need to transform the inputs into a list of allele frequency change matrices, where each row is the normalised allele frequency change vector (AFV) for one of our replicates, for N SNPs (where N is our window size). This is handled with the calc_AF_vectors() function:

# Set our window size
window_snps = 200

# Calculate Allele Frequency Change Vector Matrices
AF_input <- calc_AF_vectors(vcf = vcf_in,
                            window_size = window_snps,
                            popmap = popmap,
                            vectors = vector_list,
                            n_cores = 2)

# Show features of input...
print(paste0("Number of windows = ",length(AF_input)))

print(paste0("Number of SNPs per window = ",ncol(AF_input[[1]])))

print(paste0("Number of vectors per window = ",nrow(AF_input[[1]])))



#We also want to build a set of null vectors, in which the population assignment is shuffled among individuals and new vectors are calculated using the same structure as the originals.  We do this using the same function, but pass a null_perms value to describe how many random vectors to calculate:

# How many permutations to run
null_perm_N = 290 #chr1

# Calculate Allele Frequency Change Vector Matrices
null_input <- calc_AF_vectors(vcf = vcf_in,
                              window_size = window_snps,
                              popmap = popmap,
                              vectors = vector_list,
                              n_cores = 2,
                              null_perms = null_perm_N)

# Show features of input...
print(paste0("Number of null windows = ",length(null_input)))
print(paste0("Number of SNPs per window = ",ncol(null_input[[1]])))
print(paste0("Number of vectors per window = ",nrow(null_input[[1]])))

#Note here that 1000 null permutations is on the low side, and a value closer to 10,000+ would be better. In practise, given it is easiest to run these functions over separate chromosomes, we can aim for a total of 10,000 null vectors from across all chromosomes and combine null vectors calculated on individual chromosomes. The easiest way to do this is to divide the desired total of 10,000 (or more) up between chromosomes based on the relative sizes (this info is available in a genome fasta index for e.g.).

###################
# How many permutations do we want in total?
total_perms <- 10000

genome_fai <- data.frame(chr=c("chr1","chr2","chr3", "chr4","chr5","chr6","chr7", "chr8", "chr9",
                               "chr10","chr11", "chr12", "chr13", "chr14","chr15","chr16","chr17", "chr18", "chr19",
                               "chr20","chr21", "chr22", "chr23", "chr24","chr25"),
                         size=c(26953843	,34292151	  ,74127438	,25652880	,40584741	,52532229 ,40813162 ,27092187 ,42966623 ,35377769 ,11650534 ,31403898 ,44161018 ,38842236 ,35718434 ,41032606 ,28317440 ,41377133 ,35429340 ,36262418 ,21661149 ,32506130 ,38085671 ,47266144 ,46505145))



# Fetch proportional size of all chromosomes
chr_props <- genome_fai$size/sum(genome_fai$size)
chr_perms <- data.frame(chr=genome_fai$chr,
                        perms=round(chr_props * total_perms))

# This gives us approximately 10000 null perms in total, distributed across the genome according to relative size of chromosomes...
#print(chr_perms)
#chr perms
#1   chr1   290
#2   chr2   368
#3   chr3   797
#4   chr4   276
#5   chr5   436
#6   chr6   564
#7   chr7   439
#8   chr8   291
#9   chr9   462
#10 chr10   380
#11 chr11   125
#12 chr12   337
#13 chr13   475
#14 chr14   417
#15 chr15   384
#16 chr16   441
#17 chr17   304
#18 chr18   445
#19 chr19   381
#20 chr20   390
#21 chr21   233
#22 chr22   349
#23 chr23   409
#24 chr24   508
#25 chr25   500

###################



# Perform eigen analysis
eigen_res <- lapply(AF_input,eigen_analyse_vectors)

# View chromosomal regions:
head(names(eigen_res))

# View eigenvalue distribution of first matrix
eigen_res[[1]]$eigenvals

# View eigenvector loadings of first matrix
eigen_res[[1]]$eigenvecs

# View head of SNP scores
head(eigen_res[[1]]$A_matrix)


###########
#Find Null Cutoffs
###########


# Get cutoffs for 95%, 99% and 99.9%
null_cutoffs <- find_null_cutoff(null_input,cutoffs = c(0.95,0.99,0.999))
null_cutoffs


###########
#Calculate empirical p-values
###########


# Calculate p-vals
pvals <- eigen_pvals(eigen_res,null_input)

# Show lowest pvals
head(pvals)



###########
#Plot Eigenvalues Along Chromosomes
###########

# Plot the raw eigenvalues, and visualise the cutoff of 99%
all_plots <- eigenval_plot(eigen_res,cutoffs = null_cutoffs[,"95%"])


#png(file="chr1_eig1.png",
#    width=600, height=350)

# Show the plots for eigenvalue 1
all_plots[[2]]

#dev.off()


# Plot empirical p-values, -log10(p) of 2 ~ p=0.01, 3 ~ p=0.001 etc.
all_plots_p <- eigenval_plot(eigen_res,null_vectors = null_input,plot.pvalues = T)

#png(file="chr1_pvals.png",
#    width=600, height=350)

all_plots_p[[2]]

# Pull the figure 
eig2_pval_fig <- all_plots_p[[2]]

# Edit
eig2_pval_fig + theme(title = element_blank()) + geom_step(colour="black") +
  geom_segment(aes(x = 165437, y = 2.5, xend = 175742, yend = 2.5, colour = "segment"))+
  geom_segment(aes(x = 175906, y = 2.5, xend = 181876, yend = 2.5, colour = "segment"))

#-log10(0.0001)




#dev.off()


###########
#Pull Significant Windows
###########

# Recall the use of find_null_cutoffs() to fetch a matrix of cutoffs...
# null_cutoffs

# Find significant windows above 99.9% null permutation
significant_windows <- signif_eigen_windows(eigen_res,null_cutoffs[,"95%"])

# Display 'outliers'
significant_windows




###########
#Summarize Outliers
###########


# Summarise parallel evolution in windows that are significant on eigenvector 1
eig1_parallel <- summarise_window_parallelism(window_id = significant_windows[[1]],
                                              eigen_res = eigen_res,
                                              loading_cutoff = 0.3,
                                              eigenvector = 1)
# Show results
head(eig1_parallel)



# Summarise
eig2_parallel <- summarise_window_parallelism(window_id = significant_windows[[2]],
                                              eigen_res = eigen_res,
                                              loading_cutoff = 0.3,
                                              eigenvector = 2)
# Show results
head(eig2_parallel)


# Summarise
eig3_parallel <- summarise_window_parallelism(window_id = significant_windows[[3]],
                                              eigen_res = eigen_res,
                                              loading_cutoff = 0.3,
                                              eigenvector = 3)
# Show results
head(eig3_parallel)



###########
#Explore candidate regions
###########

######## might have messed some code up here trying to get eig2 ##########

# Fetch an A matrix 
#eigen_res[[1]] = significnat window #1
#eigen_res[[2]] = significnat window #2
A_mat <- eigen_res[[7]]$A_matrix
head(A_mat)
tail(A_mat)


to_plot <- data.frame(snp=rownames(A_mat),
                      eig2_score=A_mat[,2])

to_plot <- to_plot %>% tidyr::separate("snp",into=c("chr","pos"),sep=".1_")
to_plot$pos <- as.integer(to_plot$pos)


#png(file="plot_eig2.png",width=600, height=350)

ggplot(to_plot,aes(x=pos,y=abs(eig2_score)))+
  geom_point()+
  labs(y="Eig2 Score",x="Pos (bp)") +
  geom_segment(aes(x = 165437, y = 0.67, xend = 175742, yend = 0.67, colour = "segment")) +
  geom_segment(aes(x = 175906, y = 0.67, xend = 181876, yend = 0.67, colour = "segment")) +
  MyTheme
	

#dev.off()
