function Spatial_processing_PET_THK5351_flutemetamol_Part_I(radiotracer)
%
% % Script Part I: spatial processing of PET data of two radiotracers
% (THK5351 and flutemetamol). The script contains : Loading data (PET raw
% data "Ecat format"), conversion of the data into .nii, rename of images,
% realignment of the dynamic data and creation of the sumframe image.
%
% Radiotracers: THK5351 = 1; Flutemetamol = 2;
% THK5351: 40 to 60min corresponding to 23-26 frames
% Flutemetamol: all frames
%
% Note: data is supposed to be organized as follow:
% % /root_pth/subject-name/PET (PET data)
% % /root_pth/subject-name/MRI/nii (MRI files)
%
% M.Bahri: 2017/09/04
% -------------------------------------------------------------------------
% =========================================================================
global data;
spm pet;
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')

data = pm0_COF_data(fullfile(root_pth));

for isub = 1:size(data,2)
    fprintf(1,'PROCESSING SUBJECT %i : %s\n',isub,data(isub).id)
    
    % check for MRI an dPET directories
    cd(fullfile(data(isub).dir));
    if exist('MRI','dir')==0
        fprintf(1,'Pas de MRI pour %s\n',data(isub).id)
    elseif exist('PET','dir')==0
        fprintf(1,'Pas de PET pour %s\n',data(isub).id)
    else
    % Dynamic PET: Loading ".v"
        PET_dir = fullfile(data(isub).dir,'PET');
        [rawPET] = spm_select('FPList',PET_dir,strcat('^',data(isub).id,'_.+de10\.v$'));
        PETDyn_dir = fullfile(PET_dir,'Dynamic')
        mkdir(PETDyn_dir);
        cd(PETDyn_dir);
        
        matlabbatch = [];
        matlabbatch{1}.spm.util.import.ecat.data = cellstr(rawPET);
        matlabbatch{1}.spm.util.import.ecat.opts.ext = 'nii';
        spm_jobman('run',matlabbatch);
        clear matlabbatch;
        % Rename converted files : hexadecimal to decimal numbering
        Ren = {'1' 	'01';...
            '2' 	'02';...
            '3' 	'03';...
            '4' 	'04';...
            '5' 	'05';...
            '6' 	'06';...
            '7' 	'07';...
            '8' 	'08';...
            '9' 	'09';...
            '10' 	'0a';...
            '11' 	'0b';...
            '12' 	'0c';...
            '13' 	'0d';...
            '14' 	'0e';...
            '15' 	'0f';...
            '16' 	'10';...
            '17' 	'11';...
            '18' 	'12';...
            '19' 	'13';...
            '20' 	'14';...
            '21' 	'15';...
            '22' 	'16';...
            '23' 	'17';...
            '24' 	'18';...
            '25' 	'19';...
            '26' 	'1a';...
            '27' 	'1b';...
            '28' 	'1c';...
            '29' 	'1d';...
            '30' 	'1e';...
            '31' 	'1f';...
            '32' 	'20'};
        [ncfiles]=spm_select('FPList',PETDyn_dir,strcat('^',data(isub).id,'*.+_de10_.+\.nii$'));
        for i = size(ncfiles,1):-1:1
            [pthref,namref,extref] = fileparts(ncfiles(i,:));
            if(i < 10)
            else
                if strcmp(namref(end-1:end),Ren{i,2})==1
                    movefile(ncfiles(i,:),fullfile(pthref,[namref(1:end-2) Ren{i,1} extref]));
                end
            end
        end
        % Motion correction: realignment of frames without reslicing
        [files]=spm_select('FPList',PETDyn_dir,strcat('^',data(isub).id,'*.+\.nii$'));
        motion_correction_DynPET_noreslice(files);
        % Create sumframe image (THK5351: 40-60 minutes coresponding to 23-26
        % frames
        [rnsfiles]=spm_select('FPList',PETDyn_dir,strcat('^rns',data(isub).id,'*.+\.nii$'));
        [pth,nam,ext] = fileparts(rnsfiles(1,:));
        cd(PET_dir);
        % THK5351: 40-60 minutes coresponding to 23-26 frames
        if(radiotracer == 1)
            tpmfiles=[];
            for i=23:26
                tpmfiles = [tpmfiles;rnsfiles(i,:)];
            end
            matlabbatch{1}.spm.util.imcalc.input = cellstr(tpmfiles);
            matlabbatch{1}.spm.util.imcalc.output = fullfile(PET_dir,[nam '_40-60' ext]);
            matlabbatch{1}.spm.util.imcalc.expression = 'sum(X)';
            matlabbatch{1}.spm.util.imcalc.options.dmtx = 1;
            spm_jobman('run',matlabbatch);
            clear matlabbatch;
        end
        % Flutemetamol: sum of all frames
        if(radiotracer == 2)
            matlabbatch{1}.spm.util.imcalc.input = cellstr(rnsfiles);
            matlabbatch{1}.spm.util.imcalc.output = fullfile(PET_dir,[nam '_sumframes' ext]);
            matlabbatch{1}.spm.util.imcalc.expression = 'sum(X)';
            matlabbatch{1}.spm.util.imcalc.options.dmtx = 1;
            spm_jobman('run',matlabbatch);
            clear matlabbatch;
        end
    end
end
fprintf(1,'Attention: since the PET image will be coregistered to structural image,\n. It is necessary to reorient the PET *_sumframes.nii or/and PET *_40-60.nii\n into the T1/MT structural MRI image before running PART II\n')








