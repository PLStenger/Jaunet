# Jaunet

  <div align="center">
  <img src="https://github.com/PLStenger/Jaunet/blob/main/98_database_files/Jaunet_plan_8modalites.png" width="800">
  </div>

### Installing pipeline :


<details>
  <summary>Click here to see how to install this pipeline</summary>

  
First, open your terminal. Then, run these two command lines :

    pwd
    /scratch_vol1/fungi

    cd -place_in_your_local_computer
    git clone https://github.com/PLStenger/Jaunet.git

</details> 

### Running pipeline :

<details>
  
    # For run all pipeline, lunch only this command line : 
    time nohup bash 000_run_all_pipeline_in_one_script.sh &> 000_run_all_pipeline_in_one_script.out
  
    time nohup bash 00_quality_check_by_FastQC.sh &> 00_quality_check_by_FastQC.out
    >
  
    time nohup bash 01_renamed_sequences.sh &> 01_renamed_sequences.out
    >real	0m9,114s
    >user	0m0,355s
    >sys	0m6,420s
  
     
    time nohup bash 02_trimmomatic_q30.sh &> 02_trimmomatic_q30.out
    >real    74m13,168s
    >user    535m20,636s
    >sys     24m43,419s
  
    time nohup bash 03_cleaned_data_quality_check_by_FastQC.sh &> 03_cleaned_data_quality_check_by_FastQC.out
    >real    44m31,850s
    >user    69m36,311s
    >sys     3m45,328s
  
    time nohup bash 04_qiime2_import_PE.sh &> 04_qiime2_import_PE.out
    >real    3m46,676s
    >user    3m44,336s
    >sys     0m35,434s
  
    time nohup bash 05_qiime2_denoise_PE.sh &> 05_qiime2_denoise_PE.out
    >real    103m44,848s
    >user    484m44,613s
    >sys     10m8,215s
  
    time nohup bash 06_qiime2_tree_PE.sh &> 06_qiime2_tree_PE.out
    >real    2m35,519s
    >user    2m47,075s
    >sys     0m29,329s
  
    time nohup bash 07_qiime2_rarefaction_PE.sh &> 07_qiime2_rarefaction_PE.out
    >
  
    time nohup bash 08_qiime2_calculate_and_explore_diversity_metrics_PE.sh &> 08_qiime2_calculate_and_explore_diversity_metrics_PE.out
    >
  
    time nohup bash 09_core_biom_PE.sh &> 09_core_biom_PE.out
    >
  
    time nohup bash 10_qiime2_assign_taxonomy_PE.sh &> 10_qiime2_assign_taxonomy_PE.out
    >


</details> 
