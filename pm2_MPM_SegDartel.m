function pm1_MPM_SegDartel
%-----------------------------------------------------------------------
% Segment MPM
% Create DARTEL template
% pm 20171218
%-----------------------------------------------------------------------
global data;
% spm fmri;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')

data = pm0_COF_data(fullfile(root_pth));
MTFiles=[];PDFiles=[];R1Files=[]; R2Files=[];
for isub = 32 %1:size(data,2)
    if exist(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('.+MT\.nii')),'file')==2
        fprintf(1,'LOADING SUBJECT %i : %s\n',isub,data(isub).id)
        MTFiles = [MTFiles;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('.+MT\.nii')))];
        PDFiles = [PDFiles;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('.+PD\.nii')))];
        R1Files = [R1Files;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('.+R1\.nii')))]; 
        R2Files = [R2Files;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('.+R2s_OLS\.nii')))];
    else
        fprintf(1,'SKIPPING SUBJECT %i : %s\n',isub,data(isub).id)
    end
end
% Files = [MTFiles;PDFiles;R1Files;R2Files];
matlabbatch{1}.spm.tools.hmri.proc.proc_pipel.output.indir = 1;
matlabbatch{1}.spm.tools.hmri.proc.proc_pipel.s_vols = MTFiles;
matlabbatch{1}.spm.tools.hmri.proc.proc_pipel.vols_pm = [ 
                                                        {MTFiles}
                                                        {PDFiles} 
                                                        {R1Files} 
                                                        {R2Files} 
                                                        ];
matlabbatch{1}.spm.tools.hmri.proc.proc_pipel.vox = [1 1 1];
matlabbatch{1}.spm.tools.hmri.proc.proc_pipel.bb = [-78 -112 -70;78 76 85];
matlabbatch{1}.spm.tools.hmri.proc.proc_pipel.fwhm = [6 6 6];
matlabbatch{1}.spm.tools.hmri.proc.proc_pipel.pipe_c = 2;
spm_jobman('run',matlabbatch);
