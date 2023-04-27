#!/bin/bash

input_dir="/work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs"

file_list=(
Anopheles_stephensi.faa
Anopheles_sinensis.faa
Anopheles_minimus.faa
Anopheles_merus.faa
Anopheles_maculatus.faa
Anopheles_gambiae.faa
#Anopheles_gambiae_str._PEST.faa
Anopheles_funestus.faa
Anopheles_farauti.faa
Anopheles_epiroticus.faa
Anopheles_dirus.faa
Anopheles_darlingi.faa
Anopheles_culicifacies.faa
Anopheles_coluzzi.faa
Anopheles_christyi.faa
Anopheles_atroparvus.faa
Anopheles_arabiensis.faa
Anopheles_albimanus.faa
Aedes_albopictus.faa
)

for input_fasta in "${file_list[@]}"; do
  i=$(echo "$input_fasta" | awk -F'[_]' '{print $1}')
  j=$(echo "$input_fasta" | awk -F'[_]' '{print substr($2, 1, length($2)-4)}')
  echo -e "\033[34mProcessing file: $input_fasta\033[0m"

  while read -r line; do
    if [[ $line == ">"* ]]; then
      id_string=$(echo $line | awk -F'[_]' '{print $2}')
      organism_name=$(echo "$input_fasta" | awk -F'[_]' '{print $1 " " $2}')
      organism_name_print=$(echo "$input_fasta" | awk -F'[_]' '{sub(/....$/, "", $2); print $1 " " $2}')
 	  matching_file="$input_dir/raw_inputs/$id_string.fasta"
      if [[ -f $matching_file ]]; then
        pub_gene_id=$(grep -A 1 -E "\"organism_name\":\"${organism_name// /\\s}\"|\"$id_string\"" "$matching_file" | grep -oE '"pub_gene_id":"[A-Za-z0-9]*"' | grep -oE '[A-Za-z0-9]*')
        if [[ -n $pub_gene_id ]]; then
          grep -A1 "$pub_gene_id" /work/soghigian_lab/references/NCBI/CDS/GCF_002204515.2_AaegL5.0_cds_from_genomic.fna | head -n 2 >> "/work/soghigian_lab/abdullah.zubair2/507/Orthograph/$i"_"$j.fasta"
          echo -e "\033[32mpub_gene_id found in ${matching_file:98} for $organism_name_print\033[0m"
        else
          echo -e "\e[31m!!pub_gene_id NOT FOUND in matching file!!\e[0m"
        fi
      else
        echo -e "\e[31m!!MATCHING FILE NOT FOUND: $matching_file!!\e[0m"
      fi
    fi
  done < "$input_dir/$input_fasta"

  # Check if the number of sequences in both files is the same
  input_seq_count=$(grep -c "^>" "$input_dir/$input_fasta")
  output_seq_count=$(grep -c "^>" "/work/soghigian_lab/abdullah.zubair2/507/Orthograph/$i"_"$j.fasta")

  echo "Input fasta length: $input_seq_count"
  echo "Output fasta length: $output_seq_count"
  if [[ $input_seq_count -eq $output_seq_count ]]; then
    echo -e "\033[34m\n\n\n\n\n# OF SEQS SAME\n\n\n\n\n\033[0m"
  else
    echo -e "\n\n\n\n\n\e[31m!!# OF SEQS DIFFERENT!!\e[0m\n\n\n\n\n"
    for i in {1..3}; do printf '\a'; done
  fi

done
