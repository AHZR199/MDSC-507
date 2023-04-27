#!/bin/bash

input_dir="/work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs"

file_list=(
Aedes_aegypti.faa
)

for input_fasta in "${file_list[@]}"; do
  i=$(echo "$input_fasta" | awk -F'[_]' '{print $1}')
  j=$(echo "$input_fasta" | awk -F'[_]' '{print substr($2, 1, length($2)-4)}')
  echo -e "\033[34mProcessing file: $input_fasta\033[0m"

  while read -r line; do
    if [[ $line == ">"* ]]; then
      id_string=$(echo $line | awk -F'[_]' '{print $2}')
      echo "ID string found: $id_string"
      matching_file="$input_dir/raw_inputs/$id_string.fasta"
      if [[ -f $matching_file ]]; then
        echo "FOUND MATCHING FILE: $matching_file"
        pub_gene_id=$(grep "$i $j" "$matching_file" | awk -F"pub_gene_id" '{print $2}'|  awk -F'"' '{print $3}')
        pub_gene_id=$(echo "$pub_gene_id" | awk -F';' '{print $1}')
        if [[ -n $pub_gene_id ]]; then
          echo "HEADER FOUND: $line"
          header_id=$(grep "$pub_gene_id" /work/soghigian_lab/references/NCBI/CDS/GCF_002204515.2_AaegL5.0_cds_from_genomic.fna | head -n 1 | awk -F" " '{print $1}' | sed s'/>//g')
		  #then retrieve that header:
		  /work/soghigian_lab/apps/seqkit grep -p $header_id /work/soghigian_lab/references/NCBI/CDS/GCF_002204515.2_AaegL5.0_cds_from_genomic.fna >> ${i}_${j}.fasta
        fi
      fi
    fi
  done < "$input_dir/$input_fasta"
done
