#!/bin/bash

#This code is for datasets using SRR accession codes
#Just update the paths and --chromium/--chromiumV3 for each dataset. 

Acc_file="/home/jovyan/ifbdata/spatial_cell_id/Kush/data/sun_protected_human_skin_inguinoiliac/SRR_Acc_List_3.txt"
folder_path="/home/jovyan/ifbdata/spatial_cell_id/Kush/data/sun_protected_human_skin_inguinoiliac/"

while IFS= read -r line; do                        # IFS is set to emtpy to ensure it don't trip whitespaces
    f1="${folder_path}${line}_1.fastq"             # -r preventing backslashes from being interpreted as escape characters
    f2="${folder_path}${line}_2.fastq"             # reads each line and stores in variable "line"

    output_dir="/home/jovyan/ifbdata/spatial_cell_id/Kush/alignment/sun_protected_human_skin_inguinoiliac_alevin/$line"
    mkdir -p "$output_dir"  # This ensures that the output directory is created if it doesn't exist.

    salmon alevin -l ISR -1 $f1 -2 $f2 --chromium  -i /home/jovyan/ifbdata/spatial_cell_id/Reference/human_salmon_index -p 16 -o $output_dir --tgMap /home/jovyan/ifbdata/spatial_cell_id/Reference/txp2gene/txp2gene.tsv

done < "$Acc_file"
