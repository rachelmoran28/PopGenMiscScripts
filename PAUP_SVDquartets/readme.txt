SVDquartets SNP-based tree steps:

1. Make a nexus file from vcf using the ruby script convert_vcf_to_nexus.rb.
Usage:

ruby convert_vcf_to_nexus.rb NAME.vcf NAME.nex 

The ruby script convert_vcf_to_nexus.rb is available here:
https://github.com/mmatschiner/tutorials/blob/master/species_tree_inference_with_snp_data/src/convert_vcf_to_nexus.rb 

2. Make a .nex file that contains info on where to find the nexus file to run (see run_paup.nex for an example).

3. Make a script to execute the PAUP command and call the run_paup.nex file (see run_paup.sh for an example).
