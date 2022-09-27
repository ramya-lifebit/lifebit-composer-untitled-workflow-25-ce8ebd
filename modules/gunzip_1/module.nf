process gunzip_1 {

    input:
        path afile
        
    output:
        path "*.gz", emit: output1
        
    script:
    """
#!/usr/bin/env bash

afile='$afile'

gzip -f $afile

    """

}