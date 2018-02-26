function pm1_MPM_ImpOrComp
%-----------------------------------------------------------------------
% Importantion des DICOM MPM
% Auto-orient
% Compute Parametric Maps
% pm 20171201
%-----------------------------------------------------------------------
% pour savoir si la MPM a été importée :
% for ii = 1:size(data,2)
% Tmp = ls(fullfile(data(ii).dir,'MRI','ima'));
%     if isempty(data(ii).LongMRI)
%         fprintf(1,'%i %s %i, MPM non scannée \n',ii,data(ii).id,size(Tmp,1))
%     else
%         fprintf(1,'%i %s %i \n',ii,data(ii).id,size(Tmp,1))
%     end
% end
% for ii = 1:size(data,2)
% fprintf(1,'%i %s\n',ii,data(ii).id)
% end
% 1 COF002
% 2 COF004
% 3 COF008
% 4 COF009
% 5 COF012
% 6 COF013
% 7 COF014
% 8 COF015
% 9 COF016
% 10 COF017
% 11 COF020
% 12 COF023
% 13 COF024
% 14 COF025
% 15 COF026
% 16 COF027
% 17 COF028
% 18 COF034
% 19 COF035
% 20 COF036
% 21 COF039
% 22 COF040
% 23 COF043
% 24 COF044
% 25 COF045
% 26 COF048
% 27 COF049
% 28 COF050
% 29 COF055
% 30 COF057
% 31 COF059
% 32 COF060
% 33 COF061
% 34 COF062
% 35 COF063
% 36 COF065
% 37 COF068
% 38 COF070
% 39 COF999
%-----------------------------------------------------------------------

global data;
spm fmri;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')
cd ('D:\thk\thk_codes')

data = pm0_COF_data(root_pth);

for isub = [3 10 20 32] % 3: COF008 %1:size(data,2) 
    if isempty(data(isub).LongMRI)
        fprintf(1,'SKIPPING SUBJECT %i : %s - no MPM - \n',isub,data(isub).id)
    else
        fprintf(1,'PROCESSING SUBJECT %i : %s\n',isub,data(isub).id)
        if exist(fullfile(data(isub).dir,'MRI','nii2'),'dir') == 0
            mkdir(fullfile(data(isub).dir,'MRI','nii2'))
        else
            rmdir(fullfile(data(isub).dir,'MRI','nii2'),'s')
            mkdir(fullfile(data(isub).dir,'MRI','nii2'))
            fprintf(1,'---nii2 directory deleted---\n')
        end
        %Import
        fprintf(1,'---Importing---\n')
        DicomFiles = spm_select('FPList',fullfile(data(isub).dir,'MRI','ima'),strcat('^',data(isub).id,'.+\.IMA'));
        AllDicomFiles = DicomFiles; Bfile = [];
        Ind = regexp(DicomFiles(end,:),'\.');
        LastSess = str2double(DicomFiles(end,Ind(end-10)+1:Ind(end-9)-1));
        for iloop = 1:LastSess
            fprintf(1,'    ---Processing session %i---\n',iloop)
            % identifier la bonne session
            Ind1 = regexp(AllDicomFiles(1,:),'\.');
            if iloop<10
                DicomFiles = spm_select('FPList',fullfile(data(isub).dir,'MRI','ima'),strcat('^COF.+000',num2str(iloop),'\.....\.',{'2016', '2017'},'.+\.IMA'))
            else
                DicomFiles = spm_select('FPList',fullfile(data(isub).dir,'MRI','ima'),strcat('^COF.+00',num2str(iloop),'\.....\.',{'2016', '2017'},'.+\.IMA'))
            end
            matlabbatch{1}.spm.tools.hmri.dicom.data                                = cellstr(DicomFiles);
            matlabbatch{1}.spm.tools.hmri.dicom.root                                = 'flat';
            matlabbatch{1}.spm.tools.hmri.dicom.outdir                              = cellstr(fullfile(data(isub).dir,'MRI','nii2'));
            matlabbatch{1}.spm.tools.hmri.dicom.protfilter                          = '.*';
            matlabbatch{1}.spm.tools.hmri.dicom.convopts.format                     = 'nii';
            matlabbatch{1}.spm.tools.hmri.dicom.convopts.icedims                    = 0;
            matlabbatch{1}.spm.tools.hmri.dicom.convopts.metaopts.mformat           = 'sepext';
            
            spm_jobman('run',matlabbatch);
            matlabbatch = [];
        end
        advance=1;
        % Auto-orient
        if advance==1
            fprintf(1,'---Auto-orienting---\n')
            AoFile = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'.+\.nii'));
            matlabbatch{1}.spm.tools.hmri.autoreor.reference                        = cellstr(AoFile(1,:));
            matlabbatch{1}.spm.tools.hmri.autoreor.template                         = {'C:\CRCcodes\SPM12\canonical\avg152T1.nii'};
            matlabbatch{1}.spm.tools.hmri.autoreor.other                            = cellstr(AoFile);
            matlabbatch{1}.spm.tools.hmri.autoreor.output.indir                     = 'yes';
            matlabbatch{1}.spm.tools.hmri.autoreor.dep                              = 'individual';
            matlabbatch = [];
            advance=2;
            % Compute MPM maps
            if advance==2
                fprintf(1,'---Computing maps---\n')
                if str2double(data(isub).B1) < 10
                    B1Files = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-000',data(isub).B1,'-.+\.nii'));
                else
                    B1Files = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-00',data(isub).B1,'-.+\.nii'));
                end
                B0Files = [];
                if str2double(data(isub).B0magn) < 10
                    B0Files = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-000',data(isub).B0magn,'-.+\.nii'));
                else
                    B0Files = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-00',data(isub).B0magn,'-.+\.nii'));
                end
                if str2double(data(isub).B0phase) < 10
                    B0Files = cat(1,B0Files,spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-000',data(isub).B0phase,'-.+\.nii')));
                else
                    B0Files = cat(1,B0Files,spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-00',data(isub).B0phase,'-.+\.nii')));
                end
                if str2double(data(isub).MTw) < 10
                    MTFiles = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-000',data(isub).MTw,'-.+\.nii'));
                else
                    MTFiles = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-00',data(isub).MTw,'-.+\.nii'));
                end
                if str2double(data(isub).PDw) < 10
                    PDFiles = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-000',data(isub).PDw,'-.+\.nii'));
                else
                    PDFiles = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-00',data(isub).PDw,'-.+\.nii'));
                end
                if str2double(data(isub).T1w) < 10
                    T1Files = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-000',data(isub).T1w,'-.+\.nii'));
                else
                    T1Files = spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2'),strcat('^s',data(isub).LongMRI,'-00',data(isub).T1w,'-.+\.nii'));
                end
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.output.indir                  = 'yes';
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.sensitivity.RF_none           = 'noRF';
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.b1_type.i3D_EPI.b1input       = cellstr(B1Files);
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.b1_type.i3D_EPI.b0input       = cellstr(B0Files);
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.b1_type.i3D_EPI.b1parameters.b1metadata = 'yes';
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.raw_mpm.MT                    = cellstr(MTFiles);
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.raw_mpm.PD                    = cellstr(PDFiles);
                matlabbatch{1}.spm.tools.hmri.create_mpm.subj.raw_mpm.T1                    = cellstr(T1Files);
                spm_jobman('run',matlabbatch);
                matlabbatch = [];
            else
                fprintf(1,'NO FILE TO ORIENT FOR SUBJECT %i : %s\n',isub,data(isub).id)
            end
        else
            fprintf(1,'NO FILE TO COMPUTE FOR SUBJECT %i : %s\n',isub,data(isub).id)
        end
    end
end



