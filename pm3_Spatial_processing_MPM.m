function Spatial_processing_MPM
%
% Script for spatial processing of the MRI multiparameter maps for data
% generated with the Prisma scanner.
% This script uses the Maps preprocessing-segmention function implemented
% in VBQ toolbox under SPM12 (unified segmrntation algorithm is used with
% multi-spectral data).
%
% Input: R1, R2s, MT, and A maps.
%
% Output: segmented tissues (c1-6) in native space (+ Dartel Imported) as
% well as in MNI space with and without modulation, and the deformation
% fields for the spatially normalising image to MNI space. R1, R2s, MT, and
% A maps in MNI space are also provided.
%
% This script call a batch named "Batch_Spatial_processing_MPM.mat". Please
% provied the right path of the batch "batch_pth".
%
% M.Bahri: 2017/01/11
% -------------------------------------------------------------------------
% =========================================================================

global data;
spm fmri;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')

data = pm0_COF_data(fullfile(root_pth));

for isub =32
    fprintf(1,'PROCESSING SUBJECT %i : %s\n',isub,data(isub).id)
    if exist(fullfile(data(isub).dir,'MRI','nii2','Results')) == 7
        % Load batch
        load('Batch_Spatial_processing_MPM.mat');
        
        % load R1 Maps
        R1map = get_R1map(isub);
        R2smap = get_R2smap(isub);
        MTmap = get_MTmap(isub);
        Amap = get_Amap(isub);
        
        matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {cellstr(R1map)};
        matlabbatch{2}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {cellstr(R2smap)};
        matlabbatch{3}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {cellstr(MTmap)};
        matlabbatch{4}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {cellstr(Amap)};
        % Tissue probabiliy maps
        matlabbatch{5}.spm.tools.VBQ.proc.preproc.tissue(1).tpm = cellstr(fullfile(spm('dir'),'tpm','TPMcrc12.nii,1'));
        matlabbatch{5}.spm.tools.VBQ.proc.preproc.tissue(2).tpm = cellstr(fullfile(spm('dir'),'tpm','TPMcrc12.nii,2'));
        matlabbatch{5}.spm.tools.VBQ.proc.preproc.tissue(3).tpm = cellstr(fullfile(spm('dir'),'tpm','TPMcrc12.nii,3'));
        matlabbatch{5}.spm.tools.VBQ.proc.preproc.tissue(4).tpm = cellstr(fullfile(spm('dir'),'tpm','TPMcrc12.nii,4'));
        matlabbatch{5}.spm.tools.VBQ.proc.preproc.tissue(5).tpm = cellstr(fullfile(spm('dir'),'tpm','TPMcrc12.nii,5'));
        matlabbatch{5}.spm.tools.VBQ.proc.preproc.tissue(6).tpm = cellstr(fullfile(spm('dir'),'tpm','TPMcrc12.nii,6'));
        
        spm_jobman('run',matlabbatch)
    end
end


% =========================================================================
%                              Functions
% =========================================================================

function [R1map] = get_R1map(isub);
global data
souname = data(isub).LongMRI;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'MRI','nii2','Results');
[R1map]=spm_select('FPList',dirstruc,strcat('^s',souname,'-.+_R1.nii$'));
return

function [R2smap] = get_R2smap(isub);
global data
souname = data(isub).LongMRI;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'MRI','nii2','Results');
[R2smap]=spm_select('FPList',dirstruc,strcat('^s',souname,'-.+_R2s.+\.nii$'));
return

function [MTmap] = get_MTmap(isub);
global data
souname = data(isub).LongMRI;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'MRI','nii2','Results');
[MTmap]=spm_select('FPList',dirstruc,strcat('^s',souname,'-.+_MT.nii$'));
return

function [Amap] =  get_Amap(isub);
global data
souname = data(isub).LongMRI;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'MRI','nii2','Results');
[Amap]=spm_select('FPList',dirstruc,strcat('^s',souname,'-.+_PD.nii$'));
return

% =========================================================================
% ======================= Put your data here ==============================





