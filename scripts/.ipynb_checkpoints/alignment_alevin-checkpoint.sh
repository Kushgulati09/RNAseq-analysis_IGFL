#!/bin/bash

#This code is only for eyelids_full_skin dataset as it used HRR accession codes

folder_path="/home/jovyan/ifbdata/spatial_cell_id/Kush/data/eyelids_full_skin/HRA000395/"

for dir in "$folder_path"HRR*/; do          # wildcard HRR*/ to match folder starting with HRR (* matches any string of characters)
                                            # / ensures we match only directories and not files 
                                            
        dir_name="${dir%/}"                 # ${dir%/}remove the trailing slash from the $dir variable
        dir_name="${dir_name##*/}"          # ${dir_name##*/} gives the directory name without the leading path
        # Constructing the paths for the fastq.gz files
        f1="${dir}${dir_name}_f1.fastq.gz"
        r2="${dir}${dir_name}_r2.fastq.gz"

        # Print the paths of the files
        # echo "$f1"
        # echo "$r2"
        output_dir="/home/jovyan/ifbdata/spatial_cell_id/Kush/alignment/eyelids_full_skin_alevin/$dir_name"
        mkdir -p "$output_dir"  # This ensures that the output directory is created if it doesn't exist.

        salmon alevin -l ISR -1 $f1 -2 $r2 --chromium  -i /home/jovyan/ifbdata/spatial_cell_id/Reference/human_salmon_index -p 16 -o $output_dir --tgMap /home/jovyan/ifbdata/spatial_cell_id/Reference/txp2gene/txp2gene.tsv
done
