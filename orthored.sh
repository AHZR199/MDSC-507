#!/bin/bash
####### Reserve computing resources #############
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=144:00:00
#SBATCH --mem=70G
####### Specify Environment Variables #############
export NCBIBLAST=/work/soghigian_lab/apps/ncbi-blast-2.12.0+/bin
export ABBLAST=/work/soghigian_lab/apps/AB-BLAST/ab-blast-20200317-linux-x64/
PATH=/work/soghigian_lab/apps/ncbi-blast-2.12.0+/bin:$PATH
PATH=/work/soghigian_lab/apps/SWIPE/:$PATH
PATH=/work/soghigian_lab/apps/raxml/standard-RAxML/:$PATH
PATH=/work/soghigian_lab/apps/mcl/mcl-14-137/bin/:$PATH
PATH=/work/soghigian_lab/abdullah.zubair2/test/OrthoReD_v20180830:$PATH
PATH=/work/soghigian_lab/apps/mafft-7.490-without-extensions/bin:$PATH

 

#first, active the conda env before submitting the job:
#conda activate /work/soghigian_lab/apps/conda/envs/orthored

####### Script Below #############
#Commands for giving the query files proper headers
#cd /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/
#rm *_red.faa
#FILES="/work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/*.faa"
#for f in $(ls $FILES);
#do
#	name=$(basename $f .faa)
#	if [[ $name != "Aedes_aegypti" && $name != "Anopheles_albimanus" && $name != "Anopheles_arabiensis" && $name != "Anopheles_gambiae_str._PEST" && $name != "Anopheles_sinensis" && $name != "Anopheles_stephensi" ]]; then
#		awk '/^>/ {split($0, a, "_"); sub(/at[0-9]+/, "", a[2]); printf("%s-%s_%s-%s_na_na\n", a[1], a[2], substr(a[3], 1, 1), a[4])} !/^>/ {print}' $f > ${name}_red.faa
#	fi
#done
#cat *_red.faa > query.fas
#cp /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/*_red.faa /work/soghigian_lab/abdullah.zubair2/507/orthoRED/OrthoReD/stuff
#rm *_red.faa
#cd /work/soghigian_lab/abdullah.zubair2/507/orthoRED/OrthoReD

#perl OrthoReD_v20180830/step-01-02.pl --query Anopheles_stephensi_red.faa --q_seq_type AA --query Anopheles_sinensis_red.faa --q_seq_type AA --query Anopheles_gambiae_str._PEST_red.faa --q_seq_type AA --query Anopheles_arabiensis_red.faa --q_seq_type AA --query Anopheles_albimanus_red.faa --q_seq_type AA --query Aedes_aegypti_red.faa --q_seq_type AA --spp_list /work/soghigian_lab/abdullah.zubair2/507/orthoRED/OrthoReD/query_species_list.txt --q_clean NO 

#perl OrthoReD_v20180830/step-03-04.pl --query query.fas --q_seq_type AA --subject stuff/Culex_quinquefasciatus_red.faa --subject stuff/Culex_pipiens_pallens_red.faa --subject stuff/Anopheles_minimus_red.faa --subject stuff/Anopheles_merus_red.faa --subject stuff/Anopheles_maculatus_red.faa --subject stuff/Anopheles_gambiae_red.faa --subject stuff/Anopheles_funestus_red.faa --subject stuff/Anopheles_farauti_red.faa --subject stuff/Anopheles_epiroticus_red.faa --subject stuff/Anopheles_dirus_red.faa --subject stuff/Anopheles_darlingi_red.faa --subject stuff/Anopheles_culicifacies_red.faa --subject stuff/Anopheles_coluzzii_red.faa --subject stuff/Anopheles_christyi_red.faa --subject stuff/Anopheles_atroparvus_red.faa --subject stuff/Aedes_albopictus_red.faa --s_seq_type AA --database_name culicidae --spp_list /work/soghigian_lab/abdullah.zubair2/507/orthoRED/OrthoReD/species_list.txt --s_clean NO --q_clean NO 

perl OrthoReD_v20180830/step-05-06.pl --query query.fas --q_seq_type AA --database Step-04_DATABASE/02_DATABASE/ --db_type 'AA' --spp_list /work/soghigian_lab/abdullah.zubair2/507/orthoRED/OrthoReD/species_list.txt --og 'Culex quinquefasciatus' --og 'Culex pipiens' --threads 12
