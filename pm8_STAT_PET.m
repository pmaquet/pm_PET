function pm7_STAT_PET(smoothing,action)
% smoothing 0 = non; 1 = oui
% action : 1 = SPM sur images sans PET pvc; 2 = SPM sur images avec PET PVC; 3 = SnPM
%-----------------------------------------------------------------------
global data;
spm pet;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')
if ~nargin
    fprintf(1,'Spécifiez le smoothing et l''action\n');
    return
elseif nargin ==1
    fprintf(1,'One argument missing : Smoothing  ou action? \n');
    return
end

data = pm0_COF_data(fullfile(root_pth));

% =========================================================================
% Smooth MR files
% =========================================================================
if smoothing == 1
    MRFiles = [];
    for isub = 1:size(data,2)
        if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^wrrns',data(isub).id,'.+\.nii')))
            MRFiles = [MRFiles;...
                cellstr(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^wrrns',data(isub).id,'.+\.nii')))];
        end
    end
    matlabbatch{1}.spm.spatial.smooth.data = MRFiles;
    matlabbatch{1}.spm.spatial.smooth.fwhm = [2 2 2];
    matlabbatch{1}.spm.spatial.smooth.dtype = 0;
    matlabbatch{1}.spm.spatial.smooth.im = 0;
    matlabbatch{1}.spm.spatial.smooth.prefix = 's';
    spm_jobman('run',matlabbatch);
    clear matlabbatch
end

switch action
    case 1% without PETPVC
        fprintf(1,'SPM without PETPVC\n')
        PETFiles = [];
        for isub = 1:size(data,2)-1
            if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+60.nii')))
                PETFiles = [PETFiles;...
                    cellstr(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+60.nii')))];
            end
        end
        
        matlabbatch{1}.spm.stats.factorial_design.dir = {'d:\thk\RES_woPVC'};
        matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = {'d:\thk\COF999\PET\swrrnsCOF999_b47_2d88_de10_01010001_40-60.nii,1'};
        matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = PETFiles;
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
        fprintf(1,'SPM with PETPVC\n')
        PETFiles = [];
        for isub = 1:size(data,2)
            if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+Y.nii')))
                PETFiles = [PETFiles;...
                    cellstr(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+Y.nii')))];
            end
        end
        matlabbatch{1}.spm.stats.factorial_design.dir = {'d:\thk\RES_wPVC'};
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
         fprintf(1,'SnPM \n')
       PETFiles = [];
        for isub = 1:size(data,2)-1
            if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+60.nii')))
                PETFiles = [PETFiles;...
                    cellstr(spm_select('FPList',fullfile(data(isub).dir,'PET'),strcat('^swrrns',data(isub).id,'.+60.nii')))];
            end
        end
        
        matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignName = '2 Groups: Two Sample T test; 1 scan per subject';
        matlabbatch{1}.spm.tools.snpm.des.TwoSampT.DesignFile = 'snpm_bch_ui_TwoSampT';
        matlabbatch{1}.spm.tools.snpm.des.TwoSampT.dir = {'d:\thk\RES_SnPM'};
        matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans1 = {'D:\thk\COF999\PET\swrrnsCOF999_b47_2d88_de10_01010001_40-60.nii'};
        matlabbatch{1}.spm.tools.snpm.des.TwoSampT.scans2 = PETFiles;
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
