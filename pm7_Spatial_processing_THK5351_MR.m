function Spatial_processing_PET_THK5351_flutemetamol_Part_II(radiotracer)
%
% Script Part II: spatial processing of PET data of two radiotracers
% (THK5351 and flutemetamol). The script contains: loading of data (PET
% sumframe, MT structural MRI image and AAL atlas), coregistration of the
% PET to the MT image, normalisation of the PET using the normalisation
% parameters obtained during the normalisation of the MT image (see
% Spatial_processing_MPM script), extraction of the regional uptake and
% creation of RSUV image.
% THK5351: RSUV image was obtained by dividing the normalised pve corrected
% PET image by the mean uptake of the cerebelum GM.
% Text file containing the cerebelum GM mean uptake values.
% Flutemetamol: text file containing all AAL rois uptake values.
%
% M.Bahri: 2017/09/04
% -------------------------------------------------------------------------
% SPM-style file renaming (pm 20180412)
% image PET originale                                                                       = rnsCOF*40-60.nii
% image PET originale + coregister PET to MT image                                          = rrnsCOF*40-60
% image PET originale + coregister + petpvc                                                 = PrrnsCOF*40-60_IY
% image PET originale + coregister + petpvc + normalization with MPM parameters             = wPrrnsCOF*40-60
% image PET originale + coregister + petpvc + normalization  + SUV                          = SUVwPrrns*40-60
% image PET originale + coregister + petpvc + normalization  + SUV + division par mean WM   = SUVRwPrrns*40-60
% =========================================================================

% Radiotracer: THK5351 = 1; Flutemetamol = 2
global data;
spm pet;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')
% =========================================================================

%% cd: corrected fsl config
% in matlab system('bash -c <fsl_command>'), .bashrc which calls fsl_config_script is not executed
% thus the way to do it is system('bash -c <caller_shell_script fsl_command>')
% caller_shell_script (bash_call.sh in ~/code calls fsl_config_script, then executes fsl_command
%
if ispc,
    %   bash_call.sh no longer in thk_code directory, moved to ~/code
    %    bash_call_file=fullfile(fileparts(mfilename('fullpath')),'bash_call.sh')
    %    prefix=['bash -c "' bash_call_file '" '];
    prefix=['bash -c "~/code/bash_call.sh '];
    suffix='"';
else
    prefix='';
    suffix='';
end;
% -cd

%%


% =========================================================================
%
data = pm0_COF_data(fullfile(root_pth));
% Open output text file
% switch radiotracer
%     case 1
% =========================================================================
% Load Cerebelum grey mater mask
Refroi_CerebGM = fullfile(root_pth,'thk_codes','erodeRefroi_CerebGM_MNI.nii');
ma = spm_vol(Refroi_CerebGM);
mask = spm_read_vols(ma);
ind = find(abs(mask) == 9);
% Open a text file
fid = fopen(fullfile(root_pth,'thk_codes','PET_CerebelumGM_values.txt'), 'w');
fprintf(fid,'Subject_id\t');
fprintf(fid,'%s\t','CereblumGM(Bq/cc)');
%     case 2
aal2_atlas = fullfile(spm('Dir'),'toolbox','aal','ROI_MNI_V5.nii');
aal2_rois = fullfile(spm('Dir'),'toolbox','aal','ROI_MNI_V5.txt');
% Read atlas file
atlas_img = spm_vol(aal2_atlas);
Vol_atlas = spm_read_vols(atlas_img);
mask_values = round(unique(Vol_atlas));
Vol_atlasRounded = round(Vol_atlas);
% get rois names
roisfile = readcoglog(aal2_rois);
% open a text file
fidout = fopen(fullfile(root_pth,'PET_aalROIs_values.txt'), 'w');
fprintf(fidout,'Subject_id\t')
for roi=1:length(roisfile)
    fprintf(fidout,'%s\t',char(roisfile{roi}(2)));
end
fprintf(fidout,'%s\t%s\t%s','GM','WM','CSF');
% end
% =========================================================================
for isub =setdiff([1:size(data,2)],3) %[4 14 23 32 39 41 44 45] %
    fprintf(1,'PROCESSING SUBJECT %i / %i : %s\n',isub,size(data,2),data(isub).id)
    % check for MRI and PET directories
    if exist(fullfile(root_pth,data(isub).id,'PET'),'dir')==0 || isempty(data(isub).thkid)
        fprintf(1,'Pas de PET pour %s\n',data(isub).id)
    elseif exist(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'),'dir')==0
        fprintf(1,'Pas de MRI pour %s\n',data(isub).id)
    elseif exist(fullfile(root_pth,data(isub).id,'MRI','nii2','Results'),'dir')==7
        % load segmented tissues (c1... c6)
        Segmaps = get_Segmaps(isub);
        MTmap = get_MTmap(isub);
        PETfile = get_PETfile(isub);
        Normdef = get_Normdef(isub);
        
        %% cd: make sure we have unix filepaths
        c4c5c6=fullfile(data(isub).dir,'MRI','nii2','c4c5c6.nii');
        mask4d=fullfile(data(isub).dir,'MRI','nii2','Mask4D.nii');
        fprintf(1,'calling fsl\n')
        if ispc,
            for i=1:6,
                fprintf(1,'Press return\n')
                [s r]=system(['bash -c ''~/code/wslpath -a -u "' Segmaps{i} '"''']);
                fprintf(1,'Call successful for %s\n',Segmaps{i})
                r(end)='';
                unix_Segmaps{i}=r;
            end
            fprintf(1,'Press return\n')
            [s r]=system(['bash -c ''~/code/wslpath -a -u "' c4c5c6 '"''']); r(end)='';
            fprintf(1,'Call successful for %s\n','c4c5c6')
            unix_c4c5c6=r;
            
            fprintf(1,'Press return\n')
            [s r]=system(['bash -c ''~/code/wslpath -a -u "' mask4d '"''']); r(end)='';
            fprintf(1,'Call successful for %s\n','mask4d')
            unix_mask4d=r;
        else
            unix_Segmaps=Segmaps;
            unix_c4c5c6=c4c5c6;
            unix_mask4d=mask4d;
        end
        % -cd
        
        %%
        fprintf(1,'Compute fsl masks\n')
        % Calculate the sum of the tissues c4, c5, c6 using fsl command line
        fprintf(1,'Press return\n')
        system([prefix 'fslmaths ' unix_Segmaps{4} ' -add ' unix_Segmaps{5} ' -add ' unix_Segmaps{6} ' ' unix_c4c5c6 suffix]);
        fprintf(1,'Call successful for %s\n','fslmaths')
        % Create the 4D mask containing c1,c2,c3, and the background including
        % c4,c5,and c6.
        fprintf(1,'Press return\n')
        system([prefix 'fslmerge -t ' unix_mask4d ' ' unix_Segmaps{1} ' ' unix_Segmaps{2} ' ' unix_Segmaps{3} ' ' unix_c4c5c6 suffix]);
        fprintf(1,'Call successful for %s\n','fslmerge')
        % =========================================================================
        % Coregister PET into MRI MT image using SPM
        [pth,nam,ext] = fileparts(PETfile);
        matlabbatch{1}.spm.spatial.coreg.estwrite.ref = cellstr(MTmap);
        matlabbatch{1}.spm.spatial.coreg.estwrite.source = cellstr(PETfile);
        spm_jobman('run',matlabbatch)
        clear matlabbatch;
        
        % =========================================================================
        %% cd: make sure we have unix filepaths
        fprintf(1,'Compute pvc\n')
        petpvc_in=fullfile(pth,['r' nam ext]);
        petpvc_out=fullfile(pth,['r' nam '_IY' ext]);
        if ispc,
            fprintf(1,'Press return\n')
            [s r]=system(['bash -c ''~/code/wslpath -a -u "' petpvc_in '"''']); r(end)='';
            fprintf(1,'Call successful for %s\n','petpvc_in')
            unix_petpvc_in=r;
            fprintf(1,'Press return\n')
            [s r]=system(['bash -c ''~/code/wslpath -a -u "' petpvc_out '"''']); r(end)='';
            fprintf(1,'Call successful for %s\n','petpvc_out')
            unix_petpvc_out=r;
        else
            unix_petpvc_in=petpvc_in;
            unix_petpvc_out=petpvc_out;
        end
        % -cd
        
        %%
        
        % Partial volume correction using PETPVC toolbox -->  rrns
        system([prefix 'petpvc -i ' unix_petpvc_in ' -m ' unix_mask4d ' -o ' unix_petpvc_out ' --pvc IY -x 6.0 -y 6.0 -z 6.0' suffix]);
        fprintf(1,'Call successful for %s\n','petpvc')
        
        % Rename PET image with petpvc following SPM filenaming
        % (prefixing)
        movefile(fullfile(pth,['r' nam '_IY' ext]),fullfile(pth,['Pr' nam  ext]))
        % Normalize PET & PETpvc images using MPM normalization parameters
        matlabbatch{1}.spm.spatial.normalise.write.subj.def = cellstr(Normdef)
        matlabbatch{1}.spm.spatial.normalise.write.subj.resample = {fullfile(pth,['r' nam ext]);fullfile(pth,['Pr' nam  ext])};
        % Bounding box, voxel size and interpolation options could be modified
        matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70;78 76 85];
        matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
        matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
        spm_jobman('run',matlabbatch)
        clear matlabbatch;
        
        % =========================================================================
        % Create a temporary PET image with same dimension as the AAL  atlas
        matlabbatch{1}.spm.util.imcalc.input = {aal2_atlas;fullfile(pth,['wr' nam '_IY' ext])};
        matlabbatch{1}.spm.util.imcalc.output = fullfile(pth,['tmpwr' nam '_IY' ext]);
        matlabbatch{1}.spm.util.imcalc.outdir = {pth};
        matlabbatch{1}.spm.util.imcalc.expression = 'i2';
        spm_jobman('run',matlabbatch);
        clear matlabbatch;
        
        switch radiotracer
            case 1
                fprintf(fidout,'\n%s\t%s',data(isub).id,'Radiotracer: THK5153');
                %                 % Extract Cerebelum GM value for each subject
                %                 Ma = spm_vol(fullfile(pth,['tmpwr' nam '_IY' ext]));
                %                 subj_vol = spm_read_vols(Ma);
                %                 % Calculate mean value of Cerebelum GM
                %                 region_mean = mean(subj_vol(ind));
                %                 fprintf(fid,'\n%s\t', char(data(isub).id));
                %                 fprintf(fid,'%d\t', region_mean);
                %                 % Normalized PET division by value in ROI Cerebelum GM
                %                 f = strcat('i1 ./ ',num2str(region_mean));
                %                 value1 = round(region_mean);
                %
                %                 matlabbatch{1}.spm.util.imcalc.input = {fullfile(pth,['wr' nam '_IY' ext])};
                %                 matlabbatch{1}.spm.util.imcalc.output = fullfile(pth,['wr' nam '_IY' strcat('_divROI',num2str(value1)) ext]);
                %                 matlabbatch{1}.spm.util.imcalc.outdir = {pth};
                %                 matlabbatch{1}.spm.util.imcalc.expression = f;
                %
                %                 spm_jobman('run',matlabbatch);
                %                 clear matlabbatch;
                
                 % =========================================================================
                % Create SUV image (Normalized PET is divided by injected dose and patient
                % weight) from  wrrn  and wPrrn images
                value = data(isub).Dose/data(isub).weight*1000; %(*1000 if dose in MBq)
                f = strcat('i1 ./ ',num2str(value));
                
                matlabbatch{1}.spm.util.imcalc.input = {fullfile(pth,['wr' nam ext])};
                matlabbatch{1}.spm.util.imcalc.output = fullfile(pth,['SUVwr' nam ext]);
                matlabbatch{1}.spm.util.imcalc.outdir = {pth};
                matlabbatch{1}.spm.util.imcalc.expression = f;
                spm_jobman('run',matlabbatch);
                clear matlabbatch;
                
                
                matlabbatch{1}.spm.util.imcalc.input = {fullfile(pth,['wPr' nam  ext])};
                matlabbatch{1}.spm.util.imcalc.output = fullfile(pth,['SUVwPr' nam  ext]);
                matlabbatch{1}.spm.util.imcalc.outdir = {pth};
                matlabbatch{1}.spm.util.imcalc.expression = f;
                spm_jobman('run',matlabbatch);
                clear matlabbatch;
                
                % =========================================================================
                % Create SUVR image by division by grey matter mask
                % pm 20180325
                % load individual white matter mask 
                Mask=spm_select('FPList',fullfile(data(isub).dir,'MRI','nii2','Results'),strcat('^wc2s',data(isub).LongMRI,'.+\.nii$'));
                Vmask = spm_vol(Mask);
                [Y,XYZmm]  = spm_read_vols(Vmask);
                Ind = intersect(find(Y>0.9), find(XYZmm(3,:)>0)); % WM above ACPC plane
                
                %load image wo petpvc
                IndivPET=spm_select('FPList',pth,['SUVwr' nam ext]);
                Vin = spm_vol(IndivPET);
                [Y,XYZmm]  = spm_read_vols(Vmask);
                region_mean = mean(Y(Ind));
                f = strcat('i1 ./ ',num2str(region_mean));
                
                matlabbatch{1}.spm.util.imcalc.input = {IndivPET};
                matlabbatch{1}.spm.util.imcalc.output = fullfile(pth,['SUVRwr' nam ext]);
                matlabbatch{1}.spm.util.imcalc.outdir = {pth};
                matlabbatch{1}.spm.util.imcalc.expression = f;
                
                spm_jobman('run',matlabbatch);
                clear matlabbatch region_mean;
                
                %load  image with petpvc
                IndivPET=spm_select('FPList',pth,['SUVwPr' nam ext]);
                Vin = spm_vol(IndivPET);
                [Y,XYZmm]  = spm_read_vols(Vmask);
                region_mean = mean(Y(Ind));
                f = strcat('i1 ./ ',num2str(region_mean));
                
                matlabbatch{1}.spm.util.imcalc.input = {IndivPET};
                matlabbatch{1}.spm.util.imcalc.output = fullfile(pth,['SUVRwPr' nam ext]);
                matlabbatch{1}.spm.util.imcalc.outdir = {pth};
                matlabbatch{1}.spm.util.imcalc.expression = f;
                
                spm_jobman('run',matlabbatch);
                clear matlabbatch region_mean;
                
            case 2
                fprintf(fidout,'\n%s\t%s',data(isub).id,'Radiotracer: Flutemetamol');
                % Extract AAL ROIs mean values for each subject
                Ma = spm_vol(fullfile(pth,['tmpwr' nam '_IY' ext]));
                subj_vol = spm_read_vols(Ma);
                for i = 1:length(roisfile)
                    region_mean(i) = mean(subj_vol(ind2sub(size(Vol_atlas),find(Vol_atlasRounded == str2num(char(roisfile{i}(3)))))));
                    fprintf(fidout,'%d\t', region_mean(i));
                end
                % Extract GM, WM, and CSF mean PET values. These values were
                % extracted from the PET pve corrected image (rrns
                % ...._IY.nii).
                Ma = spm_vol(fullfile(pth,['r' nam '_IY' ext]));
                subj_vol = spm_read_vols(Ma);
                for i = 1:3
                    Ma = spm_vol(Segmaps{i});
                    sub_vol = spm_read_vols(Ma);
                    index = find(sub_vol);
                    mask_mean(i) = mean(subj_vol(index));
                    fprintf(fidout, '%d\t',mask_mean(i));
                end
                % Create SUV image (Normalized PET is divided by injected dose
                % and patient weight)
                value = str2num(data(isub).dose)/str2num(data(isub).weight)*1000; %(*1000 if dose in MBq)
                f = strcat('i1 ./ ',num2str(value));
                
                matlabbatch{1}.spm.util.imcalc.input = {fullfile(pth,['wr' nam '_IY' ext])};
                matlabbatch{1}.spm.util.imcalc.output = fullfile(pth,['wr' nam '_IY_SUV' ext]);
                matlabbatch{1}.spm.util.imcalc.outdir = {pth};
                matlabbatch{1}.spm.util.imcalc.expression = f;
                
                spm_jobman('run',matlabbatch);
                clear matlabbatch;
        end
    end
end
status = fclose(fid);

% =========================================================================
%                              Functions
% =========================================================================
function [MTmap] = get_MTmap(isub);
global data
souname = data(isub).LongMRI;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'MRI','nii2','Results');
[MTmap]=spm_select('FPList',dirstruc,strcat('^s',souname,'-.+_MT.nii$'));
return

function [Segmaps] =  get_Segmaps(isub);
global data
souname = data(isub).LongMRI;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'MRI','nii2','Results');
for ii=1:6
    Segmaps{ii}=spm_select('FPList',dirstruc,strcat('^c',num2str(ii),'s',souname,'-.+_MT.nii$'));
end
return

function [PETfile] = get_PETfile(isub);
global data
souname = data(isub).id;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'PET');
[PETfile]=spm_select('FPList',dirstruc,strcat('^rns',souname,'_.+\.nii$'));
return

function [Normdef] =  get_Normdef(isub);
global data
souname = data(isub).LongMRI;
dirstruc = [];
dirstruc = fullfile(data(isub).dir,'MRI','nii2','Results');
[Normdef]=spm_select('FPList',dirstruc,strcat('^y_s',souname,'-.+_MT.nii$'));
return

