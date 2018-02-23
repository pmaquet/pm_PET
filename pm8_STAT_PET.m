function pm7_STAT_PET(action)
%-----------------------------------------------------------------------
global data;
spm pet;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')

data = pm0_COF_data(fullfile(root_pth));

switch action
case 1% without PETPVC
PETFiles = [];
for isub = 1:size(data,2)
    if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+60.nii')))
        PETFiles = [PETFiles;...
            cellstr(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+60.nii')))];
    end
end
matlabbatch{1}.spm.stats.factorial_design.dir = {'d:\thk\RES1'};
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = {'d:\thk\COF999\PET\wrrnsCOF999_b47_2d88_de10_01010001_40-60.nii,1'};
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = cellstr(PETFiles);
matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {'D:\thk\thk_codes\mask_20180209.nii'};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'P>T';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 -1];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'P<T';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [-1 1];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;
spm_jobman('run',matlabbatch);

case 2% with PETPVC
PETFiles = [];
for isub = 1:size(data,2)
    if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+Y.nii')))
        PETFiles = [PETFiles;...
            cellstr(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+Y.nii')))];
    end
end
matlabbatch{1}.spm.stats.factorial_design.dir = {'d:\thk\RES2'};
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = {'d:\thk\COF999\PET\wrrnsCOF999_b47_2d88_de10_01010001_40-60.nii,1'};
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = cellstr(PETFiles);
matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {'D:\thk\thk_codes\mask_20180209.nii'};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'P>T';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 -1];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'P<T';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [-1 1];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;
spm_jobman('run',matlabbatch);

case 3%SnPM
snpm
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignName = '2 Groups: Two Sample T test; 1 scan per subject';
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignFile = 'snpm_bch_ui_TwoSampT';
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.dir = {'d:\thk\RES3'};
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans1 = {'D:\thk\COF999\PET\swrrnsCOF999_b47_2d88_de10_01010001_40-60.nii'};
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans2 = {
                                                     'D:\thk\COF002\PET\swrrnsCOF002_b34_2d1a_de10_01010001_40-60.nii'
                                                     'D:\thk\COF004\PET\swrrnsCOF004_ad1_2b42_de10_01010001_40-60.nii'
                                                     'D:\thk\COF013\PET\swrrnsCOF013_b49_2d9a_de10_01010001_40-60.nii'
                                                     'D:\thk\COF014\PET\swrrnsCOF014_b35_2d23_de10_01010001_40-60.nii'
                                                     'D:\thk\COF015\PET\swrrnsCOF015_b4c_2db0_de10_01010001_40-60.nii'
                                                     'D:\thk\COF016\PET\swrrnsCOF016_ae0_2b80_de10_01010001_40-60.nii'
                                                     'D:\thk\COF020\PET\swrrnsCOF020_b05_2c27_de10_01010001_40-60.nii'
                                                     'D:\thk\COF023\PET\swrrnsCOF023_b48_2d91_de10_01010001_40-60.nii'
                                                     'D:\thk\COF028\PET\swrrnsCOF028_b3a_2d46_de10_01010001_40-60.nii'
                                                     'D:\thk\COF034\PET\swrrnsCOF034_b3b_2d4f_de10_01010001_40-60.nii'
                                                     'D:\thk\COF039\PET\swrrnsCOF039_ad0_2b39_de10_01010001_40-60.nii'
                                                     'D:\thk\COF043\PET\swrrnsCOF043_a0c_2cdb_de10_01010001_40-60.nii'
                                                     'D:\thk\COF049\PET\swrrnsCOF049_b19_2c82_de10_01010001_40-60.nii'
                                                     'D:\thk\COF055\PET\swrrnsCOF055_b4b_2da5_de10_01010001_40-60.nii'
                                                     'D:\thk\COF057\PET\swrrnsCOF057_a0b_2cd2_de10_01010001_40-60.nii'
                                                     'D:\thk\COF059\PET\swrrnsCOF059_b52_2ddb_de10_01010001_40-60.nii'
                                                     'D:\thk\COF063\PET\swrrnsCOF063_b51_2dd2_de10_01010001_40-60.nii'
                                                     'D:\thk\COF999\PET\swrrnsCOF999_b47_2d88_de10_01010001_40-60.nii'
                                                     };
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.cov = struct('c', {}, 'cname', {});
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.nPerm = 5000;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.vFWHM = [0 0 0];
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.bVolm = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.ST.ST_none = 0;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.tm.tm_none = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.im = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.masking.em = {'D:\thk\thk_codes\mask_20180209.nii,1'};
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalc.g_omit = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.tools.snpm.des.TwoSampT.globalm.glonorm = 1;

matlabbatch{2}.spm.tools.snpm.cp.snpmcfg(1) = cfg_dep('2 Groups: Two Sample T test; 1 scan per subject: SnPMcfg.mat configuration file', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','SnPMcfg'));
matlabbatch{3}.spm.tools.snpm.inference.SnPMmat(1) = cfg_dep('Compute: SnPM.mat results file', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','SnPM'));
matlabbatch{3}.spm.tools.snpm.inference.Thr.Vox.VoxSig.FWEth = 0.05;
matlabbatch{3}.spm.tools.snpm.inference.Tsign = 1;
matlabbatch{3}.spm.tools.snpm.inference.WriteFiltImg.WF_no = 0;
matlabbatch{3}.spm.tools.snpm.inference.Report = 'MIPtable';

% matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('2 Groups: Two Sample T test; 1 scan per subject: SnPMcfg.mat configuration file', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','SnPMcfg'));
% matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
% matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
% 
% matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
% matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'P>T';
% matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 -1];
% matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
% matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'P<T';
% matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [-1 1];
% matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
% matlabbatch{3}.spm.stats.con.delete = 0;
spm_jobman('run',matlabbatch);
end
