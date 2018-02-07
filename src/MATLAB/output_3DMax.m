%Increase structure Size
convert2xyz;

scale=100/max(max(xyz));
xyz=xyz*scale;
%output pdb file
data.X=xyz(:,1);
data.Y=xyz(:,2);
data.Z=xyz(:,3);
%data.outfile = ['../hic/output/', num2str(name),'.pdb']; %output directory.

data.outfile = [str_name,'.pdb']; %output directory.

if exist(data.outfile, 'file')==2   %delet file if exists.
  delete(data.outfile);
end

mat2pdb(data); % Converts the mat XYZ coordinates to PDB format.
%% Output 2 results: .jpg, .pdb file
%--------------------------------------------------------------------------
%output jpg file
%jpg.output= ['../hic/output/', num2str(name),'.jpg']; %output directory.
% jpg.output= [str_name,'.jpg']; %output directory.
% 
% if exist(jpg.output, 'file')==2   %delet file if exists.
%   delete(jpg.output);
% end
% saveas(figure(1),jpg.output);