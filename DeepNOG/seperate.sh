#!/bin/bash


base_dir="/work/soghigian_lab/abdullah.zubair2/507/DeepNOG"


folders=("arabiensis" "albimanus" "sinensis" "stephensi" "aegypti" "gambiae_str._PEST")

#iterate through each folder
for folder in "${folders[@]}"; do
  # Create matches.txt and mismatch.txt in each folder
  touch "${base_dir}/${folder}/matches.txt"
  touch "${base_dir}/${folder}/mismatch.txt"


  while IFS= read -r line; do
    #check if the line contains 'YES' or 'NO' and write the line without 'YES' or 'NO' into the respective files
    if [[ $line == *"YES"* ]]; then
      echo "${line//YES}" >> "${base_dir}/${folder}/matches.txt"
    elif [[ $line == *"NO"* ]]; then
      echo "${line//NO}" >> "${base_dir}/${folder}/mismatch.txt"
    fi
  done < "${base_dir}/${folder}/accuracy.txt"
done
