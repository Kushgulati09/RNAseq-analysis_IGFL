This is for the workflow followed to handle error in 20 datasets of the "multiscale_spacial_mapping_alevin" publication:

Alevin output was not created for the 20 datasets due to their fastq file corruprtion, where for some lanes, the 
 len(sequence) != len(quality score)

Thus we used the tool "cutadapt" to check quality based errors in paired end reads and it makes changes in both corresponmding read files and provides updated fastq files with erroneous reads removed

Run cutadapt on the concat_R1 and concat_R2 of those 20 datasets (multiscale_spacial_mapping_alevin_2)

4 datasets showed error - igzip_lib.IsalError: Error -3 Invalid lookback distance found
..9530_S1
..9531_S2
..5739_S1
..5741_S3

and one dataset showed error - "F" instead of "+"
..5741_S1

But still produced fastq files fore the all 20 datasets which were then aligned using alevin without any error and these 20 datasets were then added to the concatenated adata with a label "multiscale_spacial_mapping_alevin_2" in the publication column to look for any error further and remove if required.
while other 38 datasets were labelled "multiscale_spacial_mapping_alevin".
