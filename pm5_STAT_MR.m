function pm8_STAT_MR

%-----------------------------------------------------------------------
% % TO LIST FILES
% MRFiles = [];
% for isub = 1:size(data,2)
%     if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^ws',data(isub).LongMRI,'.+\.nii')))
%         MRFiles = [MRFiles;...
%             cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^ws',data(isub).LongMRI,'.+\.nii')))];
%     end
% end

%-----------------------------------------------------------------------
global data;
spm fmri;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')
data = pm0_COF_data(fullfile(root_pth));
numparam = 4;

% =========================================================================
% Smooth MR files
% =========================================================================
% MRFiles = [];
% for isub = 1:size(data,2)
%     if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^ws',data(isub).LongMRI,'.+\.nii')))
%         MRFiles = [MRFiles;...
%             cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^ws',data(isub).LongMRI,'.+\.nii')))];
%     end
% end
% matlabbatch{1}.spm.spatial.smooth.data = MRFiles;
% matlabbatch{1}.spm.spatial.smooth.fwhm = [4 4 4];
% matlabbatch{1}.spm.spatial.smooth.dtype = 0;
% matlabbatch{1}.spm.spatial.smooth.im = 0;
% matlabbatch{1}.spm.spatial.smooth.prefix = 's';
%     spm_jobman('run',matlabbatch);

% =========================================================================
% SEPARATE T2 TESTS FOR EACH PARAMETER
matlabbatch= []; MTTmp=[]; PDTmp= []; R1Tmp = []; R2s_OLSTmp = [];subjcount = 0;
for isub = 1:size(data,2)-1
    if exist(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'),'dir')==0
        fprintf(1,'Pas de MRI pour %s\n',data(isub).id)
    elseif ~isempty(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'))==1
        for  iparam = numparam+1:2*numparam
            subjcount = subjcount+1;
            if iparam == 5
                MTTmp = [MTTmp; cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+MT\.nii')))];
            elseif iparam == 6
                PDTmp = [PDTmp;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+PD\.nii')))];
            elseif iparam == 7
                R1Tmp = [R1Tmp;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+R1\.nii')))];
            elseif iparam == 8
                R2s_OLSTmp = [R2s_OLSTmp;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+R2s_OLS\.nii')))];
            end
        end
    end
end
Param = {'MT' 'PD' 'R1' 'R2s_OLS'};
for iparam = 1:numparam
    Tmp = cellstr(spm_select('FPList',fullfile(data(end).dir,'MRI','nii2','Results'),strcat('^sws',data(end).LongMRI,'.+ ', Param{iparam} ,'\.nii')));
    DOI = cellstr(['D:\thk\RES_' Param{iparam} ]);
    POI = eval([Param{iparam} 'Tmp']);
    matlabbatch{1}.spm.stats.factorial_design.dir = DOI;
    matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = Tmp;
    matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = POI;
    matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 0;
    matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
    matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
    matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
    matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
    matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
    matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
    matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
    matlabbatch{1}.spm.stats.factorial_design.masking.em = {'d:\thk\thk_codes\mask_20180209.nii,1'};
    matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
    matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
    matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
    
    matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
    matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
    matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
    
    matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'P>C';
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 -1];
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'P<C';
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [-1 1];
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
    matlabbatch{3}.spm.stats.con.delete = 0;
    spm_jobman('run',matlabbatch);
end

% ========================================================================
% ESSAI FULL FACTORIAL EFFECTS SUBJECTS AND PARAMETERS
% matlabbatch{1}.spm.stats.factorial_design.dir = {'d:\thk\RES4'};
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = 'PARAMETERS';
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 4;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = 'SUBJECTS';
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 32;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;
%
%
% % Fill out cells for controls
% MTTmp=[]; PDTmp= []; R1Tmp = []; R2Tmp = [];subjcount = 0;
% for isub = 1:size(data,2)
%     if exist(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'),'dir')==0
%         fprintf(1,'Pas de MRI pour %s\n',data(isub).id)
%     elseif ~isempty(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'))==1
%         for  iparam = 1:numparam
%             subjcount = subjcount+1;
%             if iparam == 1
%                 MTTmp = [cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+MT\.nii')))];
%                 matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(subjcount).scans = MTTmp;
%             elseif iparam == 2
%                 PDTmp = [cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+PD\.nii')))];
%                 matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(subjcount).scans = PDTmp;
%             elseif iparam == 3
%                 R1Tmp = [cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+R1\.nii')))];
%                 matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(subjcount).scans = R1Tmp;
%             elseif iparam == 4
%                 R2Tmp = [cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+R2s_OLS\.nii')))];
%                 matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(subjcount).scans = R2Tmp;
%             end
%             matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(subjcount).levels = [iparam;subjcount];
%         end
%     end
% end
%
% matlabbatch{1}.spm.stats.factorial_design.des.fd.contrasts = 1;
% matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
% matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
% matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
% matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
% matlabbatch{1}.spm.stats.factorial_design.masking.em = {'d:\thk\thk_codes\mask_20180209.nii,1'};
% matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
% matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
% matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

% matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
% matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
% matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
%
% matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
% matlabbatch{3}.spm.stats.con.consess{1}.fcon.name = 'ALL';
% matlabbatch{3}.spm.stats.con.consess{1}.fcon.weights = [1 -1 0 0 0 0 0 0
%                                                         0 0 1 -1 0 0 0 0
%                                                         0 0 0 0 1 -1 0 0
%                                                         0 0 0 0 0 0 1 -1];
% matlabbatch{3}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
% matlabbatch{3}.spm.stats.con.delete = 0;

% =========================================================================
% ESSAI FULL FACTORIAL  Effects PARAMETERS AND GROUP

% data = pm0_COF_data(fullfile(root_pth));
% numparam = 4;
%
% matlabbatch{1}.spm.stats.factorial_design.dir = {'d:\thk\RES4'};
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = 'GROUP';
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 2;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = 'PARAMETERS';
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 4;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;
% % Fill out cells for patient
% for  iparam = 1:numparam
%     Tmp = [];
%     if iparam == 1
%         Tmp = spm_select('FPList',fullfile(data(end).dir,'MRI','nii2','Results'),strcat('^sws',data(end).LongMRI,'.+MT\.nii'));
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).levels = [iparam;1];
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).scans = cellstr(Tmp);
%     elseif iparam == 2
%         Tmp = spm_select('FPList',fullfile(data(end).dir,'MRI','nii2','Results'),strcat('^sws',data(end).LongMRI,'.+PD\.nii'));
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).levels = [iparam;1];
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).scans = cellstr(Tmp);
%     elseif iparam == 3
%         Tmp = spm_select('FPList',fullfile(data(end).dir,'MRI','nii2','Results'),strcat('^sws',data(end).LongMRI,'.+R1\.nii'));
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).levels = [iparam;1];
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).scans = cellstr(Tmp);
%     elseif iparam == 4
%         Tmp = spm_select('FPList',fullfile(data(end).dir,'MRI','nii2','Results'),strcat('^sws',data(end).LongMRI,'.+R2s_OLS\.nii'));
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).levels = [iparam;1];
%         matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(iparam).scans = cellstr(Tmp);
%     end
% end
% % Fill out cells for controls
% MTTmp=[]; PDTmp= []; R1Tmp = []; R2Tmp = [];subjcount = 0;
% for isub = 1:size(data,2)-1
%     if exist(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'),'dir')==0
%         fprintf(1,'Pas de MRI pour %s\n',data(isub).id)
%     elseif ~isempty(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'))==1
%         for  iparam = numparam+1:2*numparam
%             subjcount = subjcount+1;
%             if iparam == 5
%                 MTTmp = [MTTmp; cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+MT\.nii')))];
%             elseif iparam == 6
%                 PDTmp = [PDTmp;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+PD\.nii')))];
%             elseif iparam == 7
%                 R1Tmp = [R1Tmp;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+R1\.nii')))];
%             elseif iparam == 8
%                 R2Tmp = [R2Tmp;cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^sws',data(isub).LongMRI,'.+R2s_OLS\.nii')))];
%             end
%         end
%     end
% end
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).scans = MTTmp;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).scans = PDTmp;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(7).scans = R1Tmp;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(8).scans = R2Tmp;
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).levels = [1;2];
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).levels = [2;2];
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(7).levels = [3;2];
% matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(8).levels = [4;2];
%
% matlabbatch{1}.spm.stats.factorial_design.des.fd.contrasts = 1;
% matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
% matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
% matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
% matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
% matlabbatch{1}.spm.stats.factorial_design.masking.em = {'d:\thk\thk_codes\mask_20180209.nii,1'};
% matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
% matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
% matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
%
% % matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
% % matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
% % matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
% %
% % matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
% % matlabbatch{3}.spm.stats.con.consess{1}.fcon.name = 'ALL';
% % matlabbatch{3}.spm.stats.con.consess{1}.fcon.weights = [1 -1 0 0 0 0 0 0
% %                                                         0 0 1 -1 0 0 0 0
% %                                                         0 0 0 0 1 -1 0 0
% %                                                         0 0 0 0 0 0 1 -1];
% % matlabbatch{3}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
% % matlabbatch{3}.spm.stats.con.delete = 0;
%
% spm_jobman('run',matlabbatch);
% ========================================================================
% essai de flexible factorial
% MRFiles = [];
% for isub = 1:size(data,2)
%     if ~isempty(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^ws',data(isub).LongMRI,'.+\.nii')))
%         MRFiles = [MRFiles;...
%             cellstr(spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^ws',data(isub).LongMRI,'.+\.nii')))];
%     end
% end
% MAKE I FACTOR MATRIX
% numparam = 4;
% R = ones(1,size(MRFiles,1)); %[1:size(MRFiles,1)];
% S = kron([1:size(MRFiles,1)/numparam],ones(1,numparam)); %[1:size(MRFiles,1)];
% P = repmat([1:numparam],1,size(MRFiles,1)/numparam);
% G = [ones(1,numparam) 2*ones(1,size(MRFiles,1)-numparam)];
% I = [R' G' P' R'] %ones(size(MRFiles,1),1)%[R' P' G' S']; %ones(size(MRFiles,1),1)]; %
% matlabbatch{1}.spm.stats.factorial_design.dir = {'d:\thk\RES4'};
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).name = 'GROUP';
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).dept = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).variance = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).gmsca = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).ancova = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).name = 'PARAMETERS';
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).dept = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).variance = 1;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).gmsca = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).ancova = 0;
% % matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).name = 'SUBJECTS';
% % matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).dept = 0;
% % matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).variance = 1;
% % matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).gmsca = 0;
% % matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).ancova = 0;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.specall.scans = cellstr(MRFiles);
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.specall.imatrix = I;
% matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{1}.fmain.fnum = 2;
% matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
% matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
% matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
% matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
% matlabbatch{1}.spm.stats.factorial_design.masking.em = {'D:\thk\thk_codes\mask_20180209.nii,1'};
% matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
% matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
% matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
% matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
% matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
% matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
% matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
% matlabbatch{3}.spm.stats.con.consess{1}.fcon.name = 'P vs C';
% matlabbatch{3}.spm.stats.con.consess{1}.fcon.weights = [-1 -1];
% matlabbatch{3}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
% matlabbatch{3}.spm.stats.con.consess{2}.fcon.name = '<UNDEFINED>';
% matlabbatch{3}.spm.stats.con.consess{2}.fcon.weights = '<UNDEFINED>';
% matlabbatch{3}.spm.stats.con.consess{2}.fcon.sessrep = 'none';
% matlabbatch{3}.spm.stats.con.delete = 0;
% [kron(diff(-eye(4)),[1 0 0]);
%  kron(diff(-eye(4)),[0 1 0]);
%  kron(diff(-eye(4)),[0 0 1])]
return
