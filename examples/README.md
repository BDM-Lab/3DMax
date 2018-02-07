- To run the program, open command line and type: java -jar 3DMax.jar parameters.txt

- Parameters are configured in the 'parameters.txt' file:
	+ NUM: number of models to generate
	+ OUTPUT_FOLDER: output folder
	+ INPUT_FILE: hi-C contact file, each line contains 3 numbers (separated by a space) of a contact, position_1 position_2 interaction_frequencies  or a square matrix seperated by comma
	+ CONVERT_FACTOR: the factor used to convert IF to distance, distance = 1/(IF^factor), when not specified, the program will search for it in range [0.1, 2.0], step = 0.1
	+ CHROMOSOME_LENGTH: remove it if there is only one chromosome. If there are multiple chromosomes in the input data, specify number of points (or beads) of chromosomes in the input data, separated by a comma. These numbers must be consistent with the input data.	
	+ VERBOSE: true or false to output gradient values during optmization
	+ LEARNING_RATE: learning rate for the optimization. Increase the learning rate to reduce running time. [Max recommended = 1]
	+ MAX_ITERATION: maximum number of iterations, the optimization may converge before this number

- Output: there are 4 files	
	+ *.pdb: contains the model and can be visualized by pyMol or Chimera
	+ *_log_a_number.txt: contains the settings used to build the model and Spearman's correlation of reconstructed distances and input IFs
	+ *_log.txt: NUM > 1, the files contains settings and average root means square error (RMSE) and average correlation of Spearman's and Pearson's correlations of separate models
	+ *_coordinate_mapping.txt: contains the mapping of genomic positions to indices in the model. Notice that indices start from 0, while in pyMol or Chimera, id starts from 1

- To run the program with different input, settings, just change to a different parameter file: java -jar 3DMax.jar parameters_gm12878_chr11_10kb.txt