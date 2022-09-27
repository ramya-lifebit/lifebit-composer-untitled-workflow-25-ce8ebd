nextflow.enable.dsl=2

include { downsample_1 } from './modules/downsample_1/module.nf'
include { fastqc_1 } from './modules/fastqc_1/module.nf'
include { gunzip_1 } from './modules/gunzip_1/module.nf'
include { gwas_vcf_regenie_1 } from './modules/gwas_vcf_regenie_1/module.nf'

workflow {
input1 = Channel.fromPath(params.downsample_1.fastq)
input2 = Channel.fromPath(params.fastqc_1.fastq)
input3 = Channel.fromPath(params.gunzip_1.any_file)
input4 = Channel.fromPath(params.gwas_vcf_regenie_1.ch_user_input_vcf)
input5 = Channel.fromPath(params.gwas_vcf_regenie_1.ch_king_reference_data).splitCsv()
input6 = Channel.fromPath(params.gwas_vcf_regenie_1.ch_input_pheno_transform)
input7 = Channel.fromPath(params.gwas_vcf_regenie_1.ch_high_ld_regions)
input8 = Channel.fromPath(params.gwas_vcf_regenie_1.ch_gwas_cat)
input9 = Channel.fromPath(params.gwas_vcf_regenie_1.ch_ld_scores)
input10 = Channel.fromPath(params.gwas_vcf_regenie_1.ch_pheno)
downsample_1(input1)
fastqc_1(input2)
gunzip_1(input3)
gwas_vcf_regenie_1(input4, input5, input6, input7, input8, input9, input10)
}
