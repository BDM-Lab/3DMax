
		
MATLAB Code
-----------------------------------------------------------
**1. Set Parameters in the Main main_3DMax.m**
		

- Parameters to be set include 
	+ NUM: number of models to generate
	+ INPUT_FILE: hi-C contact file, each line contains 3 numbers (separated by a space) of a contact, position_1 position_2 interaction_frequencies  or a square matrix seperated by comma
	+ alpha = CONVERT_FACTOR: the factor used to convert IF to distance, distance = 1/(IF^factor), when not specified, the program will search for it in range [0.1, 2.0], step = 0.1
	+ LEARNING_RATE: learning rate for the optimization. 
	+ MAX_ITERATION: maximum number of iterations, the optimization may converge before this number
	
	
**2. Output: 
	+ *.pdb: contains models that can be visualized by pyMol, Chimera or GenomeFlow. __3DMax output all the number of models (NUM) Structures specified by user._
	+ *_Finalscores.txt: contains structure number and the spearman correlation of the best structure for each conversion factor (alpha)
	+ *_pearsoncorr.txt:  contains the Pearson correlation of the best structure for each conversion factor (alpha)
	+ *_spearmancorr.txt: contains the Spearman correlation of the best structure for each conversion factor (alpha)
	+ *_rmsd.txt: contains the rmsd of the best structure for each conversion factor (alpha)
	+ *_coordinate_mapping.txt: contains the mapping of genomic positions to indices in the model. Notice that indices start from 0, while in pyMol or Chimera, id starts from 1