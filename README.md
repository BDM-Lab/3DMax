------------------------------------------------------------------------------------------------------------------------------------
# A maximum likelihood algorithm for reconstructing 3D structures of human chromosomes from chromosomal contact data (3DMax)
------------------------------------------------------------------------------------------------------------------------------------
**Bioinformatics, Data Mining, Machine Learning (BDM) Laboratory,**

**University of Missouri, Columbia MO 65211**

----------------------------------------------------------------------

**Developer:** <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Oluwatosin Oluwadare <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department of Computer Science <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;University of Missouri, Columbia <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: oeow39@mail.missouri.edu 

**Contact:** <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Jianlin Cheng, PhD <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department of Computer Science <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;University of Missouri, Columbia <br />
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: chengji@missouri.edu 
	 
--------------------------------------------------------------------	

**1.	Content of folders:**
-----------------------------------------------------------	
* **executable**: latest version can be found in the release tab
* examples: contains example data and outputs generated from 3DMax for these datasets 
* src: ClusterTAD **Java** and **MATLAB** source codes
* lib: The dependency libraries used for the Java source code


**2.	Hi-C Data used in this study:**
-----------------------------------------------------------
In our study, we used the synthetic dataset from Trussart et al. The contact maps, the original models and their reconstructed models 
used in this study were downloaded from http://sgt.cnag.cat/3dg/datasets/. 

The Hi-C  datasets we used can be downloaded from here : http://sysbio.rnet.missouri.edu/bdm_download/3DMax/ 


**3.	Input matrix file format:**
-----------------------------------------------------------
3DMax allows two formats:
* Tuple Input format(**_preferred_**) : A hi-C contact file, each line contains 3 numbers (separated by a space) of a contact, position_1 position_2 interaction_frequencies
* Square Matrix Input format: The square matrix is a comma seperated N by N intra-chromosomal contact matrix derived from Hi-C data, where N is the number of equal-sized regions of a chromosome.


**4.	Usage:**
-----------------------------------------------------------
**4.1. 	Java:** <br />
To run the tool, open command line interface and type: 	 **java -jar 3DMax.jar parameters.txt** 

- Parameters are configured in the 'parameters.txt' file:
	+ NUM: number of models to generate
	+ OUTPUT_FOLDER: output folder
	+ INPUT_FILE: hi-C contact file, each line contains 3 numbers (separated by a space) of a contact, position_1 position_2 interaction_frequencies  or a square matrix seperated by comma
	+ CONVERT_FACTOR: the factor used to convert IF to distance, distance = 1/(IF^factor), when not specified, the program will search for it in range [0.1, 2.0], step = 0.1
	+ CHROMOSOME_LENGTH: remove it if there is only one chromosome. If there are multiple chromosomes in the input data, specify number of points (or beads) of chromosomes in the input data, separated by a comma. These numbers must be consistent with the input data.	
	+ VERBOSE: true or false to output gradient values during optmization
	+ LEARNING_RATE: learning rate for the optimization, if optimization fails, try to reduce this value
	+ MAX_ITERATION: maximum number of iterations, the optimization may converge before this number

See in /examples/ for sample files


**5.	Output**
-----------------------------------------------------------
3DMax produces 4  files"

- Output: there are 4 files	
	+ *.pdb: contains the model and can be visualized by pyMol, Chimera or GenomeFlow
	+ *_log_a_number.txt: contains the settings used to build the model and Spearman's correlation of reconstructed distances and input IFs
	+ *_log.txt: NUM > 1, the files contains settings and average root means square error (RMSE) and average correlation of Spearman's and Pearson's correlations of separate models
	+ *_coordinate_mapping.txt: contains the mapping of genomic positions to indices in the model. Notice that indices start from 0, while in pyMol or Chimera, id starts from 1

**6. Disclaimer**
-----------------------------------------------------------
The executable software and the source code of 3DMax is distributed free of charge as it is to any non-commercial users. The authors hold no liabilities to the performance of the program.

**7. Citations**
-----------------------------------------------------------


**8. Common questions**
-----------------------------------------------------------
**8.1. Is there a computing speed difference between the Java and MATLAB implementation?**

Yes, we explained in out manuscript. For the Java implementation is faster compared to the MATLAB implementation on all datasets

**8.2. Is there a difference in the model generated by the Java and MATLAB implementation?**

Yes, we explained in out manuscript. For the Java implementation is faster compared to the MATLAB implementation on all datasets

-----------------------------------------------------------
>>>>>>> first commit 3DMax
