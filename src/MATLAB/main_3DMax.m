%%========================================================================
 % Implementation of 3DMax algorithm
 %  Language: MATLAB
	
 %	@author: Oluwatosin Oluwadare 
 %	Department of Electrical Engineering and Computer Science
 %	University of Missouri, Columbia
 %	Columbia
 %	USA	
 %	email: 	oeow39@mail.missouri.edu
	
 %	Last Update: 2/7/2018
	
 %	Instructions: https://github.com/BDM-Lab/3DMax
 %========================================================================

clear;
clc;
disp ('============================================');
disp ('Data = Hi-C data  ');
disp ('===========================================');
path = 'Scores/';
%==========================================================================
% Make directory if it doesn't exist
%--------------------------------------------------------------------------
if ~exist('Scores', 'dir')
    % Folder does not exist so create it.
    mkdir('Scores');
end
%--------------------------------------------------------------------------
% 3DMax Variables
%--------------------------------------------------------------------------

smooth_factor = 1e-6 ; % for numerical stability

NEAR_ZERO =0.00001; % used to signify a boundary of convergence

NUM = 1; 
  
LEARNING_RATE = 0.5; % Specify the learning rate.

INPUT_FILE = '';
    

MAX_ITERATION = 2000; % maximum number of iterations
%==========================================================================

[filepath, name, ext] = fileparts(INPUT_FILE);

S  = [];
TS = [];
Corr = [];
P_CORR = [];
RMSD = [];
new_name = name;

%=========================================================================
ReadInput; % Load the contact file
%=========================================================================
% specify the alpha
for CONVERT_FACTOR = 0.5:0.5

        %-------------------------
        Convert2Distance;
        %-------------------------
        % For each CONVERT_FACTOR generate N structures
        s= [];
        ts=[];
        cor=[]; 
        P_corr = [];
        rmsd = [];
        totalIF = 0;        
        for l = 1:NUM
            disp ('=============================================================================');
            fprintf('Creating structure at CONVERT_FACTOR = %f and structure = %d\n', CONVERT_FACTOR,l);
            disp ('=============================================================================');
            %-------------------------
            Optimization;
            %-------------------------
            %========================================================================
            % scoring using spearman correlation, pearson correlation and  RMSD     
            %------------------------------------------------------------------------
             str_name =[ path,num2str(name),'_CONVERT_FACTOR=',num2str(CONVERT_FACTOR),'N=',num2str(l)];
             %----------------------
             Evaluation;
             %-----------------------             
             %output scores ::: S shows the scores for different CONVERT_FACTOR            
             ts = [ts;CONVERT_FACTOR,l,SpearmanRHO];                        
             cor = [cor;SpearmanRHO];  %output the correlation         
            %----------------------
            %pearson correlation           
            P_corr = [P_corr;PearsonRHO];
            %----------------------
            % perform root mean square error
            rmsd = [rmsd;rmse];
            %------------------------------------------------------------------------     
            %output pdb and image
            %------------------------------------------------------------------------
            output_3DMax; % default run
        end
         %------------------------------------------------------------------------     
         %Select the representative model for the CONVERT_FACTOR value
         %------------------------------------------------------------------------
           [v,index]= max(ts(:,3));
           TS = [TS;ts(index,:)];      
           Corr = [Corr;max(cor)];
           P_CORR = [P_CORR ;max(P_corr)];
           RMSD = [RMSD;min(rmsd)];    
end

% ========================================================================
% Select the representative model for the chromosome
%---=--========------------------------------------------------------------
[val,index]= max(TS(:,3));
CONVERT_FACTOR = TS(index,1);
l = TS(index,2);
pl =  P_CORR(index);
% save scores to file
f_scores =strcat(path,num2str(new_name),'_Finalscores.txt');
dlmwrite(f_scores,sprintf('CONVERT_FACTOR\tStructure Number\tSpearman Correlation'));
dlmwrite(f_scores,TS);
%save pearson correlation
scores =strcat(path,num2str(new_name),'_pearsoncorr.txt');
dlmwrite(scores, P_CORR );
%save spearman correlation
scores =strcat(path,num2str(new_name),'_spearmancorr.txt');
dlmwrite(scores,Corr);
%save RMSD
scores =strcat(path,num2str(new_name),'_rmsd.txt');
dlmwrite(scores,RMSD);

final_name =[ num2str(new_name),'_CONVERT_FACTOR=',num2str(CONVERT_FACTOR),'N=',num2str(l),'.pdb']; 
readme =strcat(path,num2str(new_name),'_readme.txt');
fprintf('\n===============================================\n');
fprintf('The representative structure is %s\n', final_name);  
fprintf('The Spearman Correlation of this structure: %f\n', val);  
fprintf('The Pearson Correlation of this structure: %f\n', pl);  
fid = fopen(readme,'wt');
msg = ['The representative structure is ',final_name]; 
fprintf(fid,msg);
fclose(fid);

