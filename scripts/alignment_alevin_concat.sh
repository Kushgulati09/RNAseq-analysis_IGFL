#!/bin/bash

# This is for the concatednated lanes fastq dataset from "multiscale_spacial_mapping"

Acc_file="/home/jovyan/ifbdata/spatial_cell_id/Kush/data/multiscale_spacial_mapping/concat_names.txt"
folder_path="/home/jovyan/ifbdata/spatial_cell_id/Kush/data/multiscale_spacial_mapping/"

while IFS= read -r line; do                        # IFS is set to emtpy to ensure it don't trip whitespaces
    f1="${folder_path}${line}_R1_concat.fastq.gz"             # -r preventing backslashes from being interpreted as escape characters
    f2="${folder_path}${line}_R2_concat.fastq.gz"             # reads each line and stores in variable "line"

    output_dir="/home/jovyan/ifbdata/spatial_cell_id/Kush/alignment/multiscale_spacial_mapping_alevin/$line"
    mkdir -p "$output_dir"  # This ensures that the output directory is created if it doesn't exist.

    salmon alevin -l ISR -1 $f1 -2 $f2 --chromium  -i /home/jovyan/ifbdata/spatial_cell_id/Reference/human_salmon_index -p 16 -o $output_dir --tgMap /home/jovyan/ifbdata/spatial_cell_id/Reference/txp2gene/txp2gene.tsv

done < "$Acc_file"
