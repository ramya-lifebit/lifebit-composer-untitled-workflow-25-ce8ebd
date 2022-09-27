process downsample_1 {

    input:
        path fastq
        
    output:
        path "*.fastq", emit: output1
        
    script:
    """
#!/usr/bin/env bash

fastq='$fastq'
ratio=$params.downsample_1.ratio

seqtk sample -s100 \$fastq \$ratio > downsample_\${fastq}

    """

}