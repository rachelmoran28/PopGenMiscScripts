module load GCCcore/8.3.0 
module load Ruby/2.7.1

#ruby convert_vcf_to_nexus.rb NAME.vcf NAME.nex
ruby convert_vcf_to_nexus.rb populations.snps.vcf singlesnp_p2_r04_wEflab_nohyb_nolowcov.nex
