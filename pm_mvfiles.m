root_pth ='D:\thk';
addpath('D:\thk\thk_codes')

data = pm0_COF_data(fullfile(root_pth));

for ii = 1:size(data,2)
    fprintf(1,'   Subject %i\n',ii)
    if exist(fullfile(data(ii).dir,'MRI','nii2','Results')) ==7
        cd(fullfile(data(ii).dir,'MRI','nii2','Results'))
        mkdir('hMRI')
        Files = dir('c*.nii');
        for ifile = 1:size(Files,1)
            fprintf(1,'   file %i\n',ifile)
            copyfile(Files(ifile).name,fullfile('hMRI',Files(ifile).name))
        end
    end
end
% ---------------------------
sub = ls('E*')
for isub = 4:size(sub,1)
    cd(sub(isub,:));
    mkdir MRI;
    mkdir PET;
    mkdir z_old;
    Nii = ls('ni*');
    movefile(Nii,'MRI');
    Vfiles = ls('*.v');
    for ifile = 1:size(Vfiles,1);
        movefile(Vfiles(ifile,:),'PET');
    end
    Type = {'*.nii' '*.mat' '*.ps' '*.txt'};
    for itype = 1:size(Type,2);
        eval(['Cof = ls(''' Type{itype} ''')']);
        for ifile = 1:size(Cof,1);
            movefile(Cof(ifile,:),'z_old');
        end
    end
    cd('..')
end

% changer un champ dans data
root_pth ='D:\thk';
for ii = 1:size(data,2)
    Ind = regexp(data(ii).dir,'\');
    Sname = data(ii).dir(Ind(end)+1:end)
    data(ii).dir = fullfile(root_pth,Sname)
end

root_pth ='D:\thk';
addpath('D:\thk\thk_codes')
data = pm0_COF_data(fullfile(root_pth));
for ii = 1:size(data,2)
    Ind = regexp(data(ii).dir,'\');
    Sname = data(ii).dir(Ind(end)+1:end)
    data(ii).dir = fullfile(root_pth,Sname)
end

% Recursively checking a field in directories
root_pth ='D:\thk';
addpath('D:\thk\thk_codes')
data = pm0_COF_data(fullfile(root_pth));
for ii = 1:size(data,2)
    Ind = regexp(data(ii).dir,'\');
    Sname = data(ii).dir(Ind(end)+1:end);
    REs = exist(fullfile(root_pth,Sname,'MRI','nii2')); %,'Results'));
    if REs == 7
        fprintf(1,'%s %i\n',Sname,REs)
        movefile(fullfile(root_pth,Sname,'MRI','nii2'),fullfile(root_pth,Sname,'MRI','nii3'))
    end
end



%------------------------------------------
% moving Exxx to COFxxx
data = COF_data(pwd);
Dirs = ls('E*');
for isub = 1:size(data,2)
    for idir = 1:size(Dirs,1)
        if strcmp(data(isub).thkid,Dirs(idir,:))==1
            fprintf(1,'rename %s in %s \n',data(isub).thkid,data(isub).id)
            movefile(data(isub).thkid,data(isub).id)
        end
    end
end

%------------------------------------------
% Delete dynamic directories
global data;
root_pth ='D:/thk';
data = pm0_COF_data(root_pth);
for isub = 1:size(data,2)
    cd(fullfile(data(isub).dir,'PET'));
    if exist('Dynamic')==7
    rmdir('Dynamic','s')
    end
    delete('*.nii')   
    fprintf(1,'Sub %i %s\n',isub, data(isub).dir)
end

%------------------------------------------
% Delete old MR directories
global data;
root_pth ='D:\thk';

data = pm0_COF_data([ root_pth ]);

for isub = 1:size(data,2)
    fprintf(1,'subject %i %s \n',isub, data(isub).id)
    cd(fullfile(data(isub).dir,'MRI'));
    if exist('nii') == 7
        fprintf(1,'nii in  %s removed\n', data(isub).dir)
    rmdir('nii','s')
    end
end