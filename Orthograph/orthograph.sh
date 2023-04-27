#!/bin/bash
####### Reserve computing resources #############
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=144:00:00
#SBATCH --mem=70G
####### Specify Environment Variables #############
module load gcc/10.2.0
module load perl/5.32.0
PATH=/work/soghigian_lab/apps/bbmap:$PATH
PATH=/work/soghigian_lab/apps/SPAdes-3.15.3-Linux/bin:$PATH
PATH=/work/soghigian_lab/apps/fastp:$PATH
PATH=/work/soghigian_lab/apps/mafft-7.490-without-extensions/bin:$PATH
PATH=/work/soghigian_lab/apps/sqlite-amalgamation-3370000:$PATH
PATH=/work/soghigian_lab/apps/hmmer-3.3.2/bin:$PATH
PATH=/work/soghigian_lab/apps/exonerate-2.2.0-x86_64/bin:$PATH
PATH=/work/soghigian_lab/apps/ncbi-blast-2.12.0+/bin:$PATH
PATH=/work/soghigian_lab/apps/Orthograph-0.7.1:$PATH
export PERL5LIB=/work/soghigian_lab/apps/conda/envs/ahtree/lib/site_perl/5.26.2:/work/soghigian_lab/apps/conda/envs/ahtree/lib/site_perl/5.26.2/x86_64-linux-thread-multi


####### Script Below #############
#cd /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs
cd /work/soghigian_lab/abdullah.zubair2/507/Orthograph
#Set includes:
#Culex_quinquefasciatus
#Culex_pipiens_pallens
#Aedes_albopictus
#Anopheles_atroparvus
#Anopheles_christyi
#Anopheles_coluzzii
#Anopheles_culicifacies
#Anopheles_darlingi
#Anopheles_dirus
#Anopheles_epiroticus
#Anopheles_farauti
#Anopheles_funestus
#Anopheles_gambiae
#Anopheles_maculatus
#Anopheles_merus
#Anopheles_minimus



#orthograph-manager --create -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Culex_quinquefasciatus.faa --ogs-version 1 --ogs-taxon-name Culex_quinquefasciatus -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Culex_pipiens_pallens.faa --ogs-version 1 --ogs-taxon-name Culex_pipiens_pallens -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Aedes_albopictus.faa --ogs-version 1 --ogs-taxon-name Aedes_albopictus -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_atroparvus.faa --ogs-version 1 --ogs-taxon-name Anopheles_atroparvus -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_christyi.faa --ogs-version 1 --ogs-taxon-name Anopheles_christyi -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_coluzzii.faa --ogs-version 1 --ogs-taxon-name Anopheles_coluzzii -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_culicifacies.faa --ogs-version 1 --ogs-taxon-name Anopheles_culicifacies -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_darlingi.faa --ogs-version 1 --ogs-taxon-name Anopheles_darlingi -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_dirus.faa --ogs-version 1 --ogs-taxon-name Anopheles_dirus.faa -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_epiroticus.faa --ogs-version 1 --ogs-taxon-name Anopheles_epiroticus.faa -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_farauti.faa --ogs-version 1 --ogs-taxon-name Anopheles_farauti -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_funestus.faa --ogs-version 1 --ogs-taxon-name Anopheles_funestus -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_gambiae.faa --ogs-version 1 --ogs-taxon-name Anopheles_gambiae -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_maculatus.faa --ogs-version 1 --ogs-taxon-name Anopheles_maculatus -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_merus.faa --ogs-version 1 --ogs-taxon-name Anopheles_merus -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#orthograph-manager --load-ogs-peptide Anopheles_minimus.faa --ogs-version 1 --ogs-taxon-name Anopheles_minimus -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf

##orthograph-manager /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/tax_for_orthograph_FINAL.cog -o -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf

##orthograph-analyzer --prepare -c /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph2.conf
#
## declare an array variable
#"Anopheles_stephensi, Anopheles_albimanus" "Anopheles_arabiensis" "Anopheles_gambiae_str._PEST" "Anopheles_sinensis" "Anopheles_stephensi"
declare -a arr=("Aedes_aegypti", "Anopheles_stephensi, Anopheles_albimanus" "Anopheles_arabiensis" "Anopheles_gambiae_str._PEST" "Anopheles_sinensis" "Anopheles_stephensi")

## loop through array
for i in "${arr[@]}"
do
   echo "$i"
   sed "s/basetax/$i/g" /work/soghigian_lab/abdullah.zubair2/507/Orthograph/orthograph3.conf > /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/configs/orthograph_$i.conf
   orthograph-analyzer --configfile /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/configs/orthograph_$i.conf
   orthograph-reporter --configfile /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs/configs/orthograph_$i.conf
   perl /work/soghigian_lab/apps/Orthograph-0.7.1/summarize_orthograph_results.pl -i /work/soghigian_lab/abdullah.zubair2/507/Orthograph/output -o done -c -t -s -u -d /work/soghigian_lab/abdullah.zubair2/507/Orthograph/ref_tax.txt
   
done

