#!/bin/bash

input_dir="/work/soghigian_lab/abdullah.zubair2/507/DeepNOG/"
output_dir="/work/soghigian_lab/abdullah.zubair2/507/DeepNOG/"


for input_file in $input_dir*.csv; do
    # Get species name from input file
    species=$(basename "$input_file" .csv)
    species=$(echo "$species" | cut -d "_" -f 2-)
    

    output_file="$output_dir$species/accuracy.txt"
    

    total_genes=0
    match_count=0
    nonmatch_count=0
    

    while IFS=',' read -r sequence_id prediction confidence; do

        if [[ $sequence_id == "sequence_id" ]]; then
            continue
        fi
        

        gene_id=$(echo "$prediction" | sed 's/sco//')
        

        if [[ "$sequence_id" == *"$gene_id"* ]]; then
            match="YES"
            ((match_count++))
        else
            match="NO"
            ((nonmatch_count++))
        fi
        

        echo "$gene_id $match"
        echo "$gene_id $match" >> "$output_file"
        
        ((total_genes++))
    done < "$input_file"
    

    echo "Total genes: $total_genes" >> "$output_file"
    echo "Matches: $match_count" >> "$output_file"
    echo "Non-matches: $nonmatch_count" >> "$output_file"
    echo "$species" >> accuracy_by_species.txt
    printf "Accuracy: %.2f%%\n" $(bc -l <<< "$match_count/$total_genes * 100") >> accuracy_by_species.txt
    printf "Accuracy: %.2f%%\n" $(bc -l <<< "$match_count/$total_genes * 100") >> "$output_file"
done
