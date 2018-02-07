%%---------------------------------------------------------------------
% Load Created Contact Matrix
%=======================================================================
% check if it is a tuple or not
%=======================================================================
filename = INPUT_FILE ;
check = dlmread(filename);
s = size(check);
if s(2)== 3 % if column length == 3    
    disp('Input is in Tuple format'); 
    cont = dlmread(filename);   
else   
    disp('Input is in Square Matrix format');
    cont = dlmread(filename);
    %----------------------------------
    % convert to tuple_format
    %----------------------------------
    matrix2tuple;
    disp('Conversion to Tuple Format Done sucessfully');
end
 pos = [];
%=======================================================================
[spath,fname,ext] = fileparts(filename); % Get the file prefix
%% 
 %-----------------------------
 % Remove zero contacts
 %-----------------------------
  
 ind_greater_IF = find(cont(:,3) > 0 & ~isnan(cont(:,3)) & cont(:,1)~= cont(:,2) );
 contact  = cont(ind_greater_IF,:);
 pos = [contact(:,1)', contact(:,2)'];
 %---------------------------  
   lstCons =   contact;
 %---------------------------
   
%%  
%--------------------------
% Sort the positions
%---------------------------
pos = unique(pos,'sorted');
%% 
%--------------------------
% The Number of position
%---------------------------
n = length(pos);
fprintf('Number of points: %d\n', n);
%% 
%--------------------------
% map position to absolute id
%---------------------------
mapping = [];

 for i = 1:n   
    mapping = [mapping; pos(i), i];
 end
 
myKeys =  mapping(:,1);
myValues = mapping(:,2);

Map = containers.Map(myKeys,myValues);
 %% output the mapping of coordinate to id in the output structure
mapname = strcat(path,num2str(fname), '_coordinate_mapping.txt');
dlmwrite(mapname,mapping);
%% Replace the Position with the Mapping ID defined
 for i= 1:length(lstCons)
    x = lstCons(i,1);
    y = lstCons(i,2);
    value_x = Map(x);
    value_y = Map(y);
    lstCons(i,1) = value_x ;
    lstCons(i,2) = value_y ;    
end
 