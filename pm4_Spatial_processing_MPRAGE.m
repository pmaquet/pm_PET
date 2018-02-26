function pm4_Spatial_processing_MPRAGE
%-----------------------------------------------------------------------
% Job saved on 13-Nov-2017 14:38:15 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (12.3)
% cfg_basicio BasicIO - Unknown
% CHECK WITH CP THE ORDER OF COREGISTRATION AND NORMALIZATION STEPS
%-----------------------------------------------------------------------

global data;
spm pet;
root_pth ='C:/thk';

data = COF_data(root_pth);

for isub = 1:size(data,2)
    cd(fullfile(data(isub).dir));
    mfile = spm_select('FPList','MRI\nii','^s.+-000224-.+\.nii');
    pfile = spm_select('FPList','PET','^rns.+_40-60\.nii');
    matlabbatch=[];
    matlabbatch{1}.spm.spatial.coreg.estimate.ref = {mfile};
    matlabbatch{1}.spm.spatial.coreg.estimate.source = {pfile};
    matlabbatch{1}.spm.spatial.coreg.estimate.other = {''};
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
    matlabbatch{2}.spm.spatial.normalise.estwrite.subj.vol(1) = cfg_dep('Coregister: Estimate: Coregistered Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
    matlabbatch{2}.spm.spatial.normalise.estwrite.subj.resample = {mfile;pfile};
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.biasreg = 0.0001;
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.biasfwhm = 60;
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.tpm = {'C:\CRCcodes\SPM12\tpm\TPMcrc12.nii'};
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.affreg = 'mni';
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.fwhm = 0;
    matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.samp = 3;
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.bb = [-78 -112 -70;78 76 85];
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.vox = [2 2 2];
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.interp = 4;
    matlabbatch{2}.spm.spatial.normalise.estwrite.woptions.prefix = 'w';
    
    spm_jobman('run',matlabbatch);
    
end
