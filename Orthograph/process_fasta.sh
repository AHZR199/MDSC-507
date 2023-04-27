#!/bin/bash

input_fasta="/work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/Aedes_aegypti_prot.faa"
input_dir="/work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/raw_inputs"

while read -r line; do
  if [[ $line == ">"* ]]; then
    id_string=$(echo $line | awk -F'[_]' '{print $2}')
    echo "ID string found: $id_string"
    matching_file="$input_dir/$id_string.fasta"
    if [[ -f $matching_file ]]; then
      echo "FOUND MATCHING FILE: $matching_file"
      pub_gene_id=$(grep -A 1 'Aedes aegypti' "$matching_file" | grep -oE '[0-9]+;?')
      pub_gene_id=$(echo "$pub_gene_id" | awk -F';' '{print $1}')
      if [[ -n $pub_gene_id ]]; then
        echo "HEADER FOUND: $line"
        echo "Pub_gene_id: $pub_gene_id"
        grep -A1 "$pub_gene_id" /work/soghigian_lab/references/NCBI/CDS/GCF_002204515.2_AaegL5.0_cds_from_genomic.fna | head -n 2 >> /work/soghigian_lab/abdullah.zubair2/507/Orthograph/abc.fasta
      fi
    fi
  fi
done < "$input_fasta"
