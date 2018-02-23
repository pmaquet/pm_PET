function data = COF_data(pathtodata);

% PM introduced thk inputs. Dose is in MBq. 20170828
% ------------------------------------------------------------------------
data = struct('DIR',pathtodata, ... %dir of the study
    'num', [],'id',[], 'sessname',[], 'sspname',[], 'dir',[], 'dev',[], 'EFcoord',[], ...
    'FIDmri',[],'Sname',[],'MRI',[],'LongMRI',[],'T1w',[],'PDw',[],'MTw',[],...
    'B1',[],'B0magn',[],'B0phase',[],'MANfile',[],'LAPfile',[],'EEGfile',[], ...
    'DCMfile',[],'FPL_OPL',[],'Sleep_cycles',[],'wkTime',[], 'SleepTime',[], ...
    'dlmo',[], 'peak', [], 'ecd', [], 'dcm', [], 'twoback',[], 'threeback', [], ...
    'pvt', [], 'kss_alone', [], 'kss_tasks', [],'kss_tms',[],'vas_alone', [],...
    'vas_tasks', [],'vas_tms', []);

num = 0;

% template
% num = num + 1;
% data(num).weight     = []; % kg
% data(num).height     = []; % cm
% data(num).num        = num;
% data(num).id          = '';%
% data(num).thkid       = [];
% data(num).Dose       = []; % MBq
% data(num).PTname      = ['P1' ; 'P2'];
% data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5' ; 'S6']; %nb of the run for session - from which f00x should start
% data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5' ; 'S6'];
% data(num).dir         = fullfile(pathtodata,data(num).id);
% data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
% data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
% data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
% data(num).Sname       = {'LSMA'};
% data(num).channel     = '';
% data(num).MRI         = {',1'};
% data(num).LongMRI     = '';
% data(num).T1w         = '';
% data(num).PDw         = '';
% data(num).MTw         = '';
% data(num).B1          = '';
% data(num).B0magn     = ''; data(num).B0phase      = '';
% data(num).MRIvisits   = '';
% data(num).PTfile     = {{'spmeeg_.mat'} ... %P1
% {'spmeeg_.mat'} ...%P2
% };
% data(num).DCMfile     = {'merged_spmeeg_.mat'};
% data(num).EEGfile     = {{'spmeeg_.mat'} ... %S1
%     {'spmeeg_.mat'} ... %S2
%     {'spmeeg_.mat'} ... %S3
%     {'spmeeg_.mat'} ... %S4
%     {'spmeeg_.mat'} ... %S5
%     {'spmeeg_.mat'} ... %S6
%     };
% data(num).FPL_OPL = []; 
% data(num).Sleep_cycles = {};
% data(num).wkTime = [];
% data(num).SleepTime = [];
% data(num).closestE = [];
% data(num).dlmo = [];
% data(num).peak = [];
% data(num).ecd = [];
% data(num).dcm = [];
% data(num).twoback = [];
% data(num).threeback = [];
% data(num).sart = [];
% data(num).pvt = [];
% data(num).kss_alone = []; %Add any missing or excluded sessions
% data(num).kss_tasks = [];
% data(num).kss_tms = [];
% data(num).vas_alone = [];
% data(num).vas_tasks = [];
% data(num).vas_tms = [];

%1 - COF002
num = num + 1;
data(num).num         = num;
data(num).weight      = 60; % kg
data(num).height      = 160; % cm
data(num).id          = 'COF002';%
data(num).thkid       = 'E0709';%
data(num).Dose        = 190;
data(num).PTname      = ['P1' ; 'P2']; %nb of the run for session - from which f00x should start
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5' ; 'S6']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5' ; 'S6'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s845-0002-00001-000224-01.nii,1'};
data(num).LongMRI     = '1337';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).PTfile     = {{'spmeeg_COF002_PT1_20160609_150353_4.mat'} ... %P1
    {'spmeeg_COF002_PT2_20160609_150353_10.mat'} ...%P2
    };
data(num).EEGfile     = {{'spmeeg_COF002_S1_EEGTMS_20160615_103442_4.mat'} ... %S1
    {'spmeeg_COF002_S2_EEGTMS_20160615_143347_2.mat'} ... %S2
    {'spmeeg_COF002_S3_EEGTMS_20160615_174210_3.mat'} ... %S3
    {'spmeeg_COF002_S4_TMSEEG_0160615_201630_2.mat'} ... %S4
    {'spmeeg_COF002_S5_TMSEEG_20160615_223919_2.mat'} ... %S5
    {'spmeeg_COF002_S6_TMSEEG_20160616_024056_2.mat'} ... %S6
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [7];
data(num).SleepTime = [1];
data(num).closestE = [];
data(num).dlmo = [19.89];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [4 8];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [5 7];
data(num).kss_tasks = [2];
data(num).kss_tms = [];
data(num).vas_alone = [5 7];
data(num).vas_tasks = [2];
data(num).vas_tms = [];

%2 - COF004
num = num + 1;
data(num).num        = num;
data(num).weight     = 92;
data(num).height     = 181;
data(num).id          = 'COF004';%
data(num).thkid       = 'E0573';
data(num).Dose       = 190;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s939-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '993';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9';
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF004_P1_20160705_090823_2.mat'} ... %P1
{'spmeeg_COF004_P2_20160705_090823_3_2.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF004_S1_TMSEEG_20160713_071709_4.mat'} ... %S1
    {'spmeeg_COF004_S2_TMSEEG_20160713_115942_2.mat'} ... %S2
    {'spmeeg_COF004_S3_TMSEEG_20160713_154558_2.mat'} ... %S3
    {'spmeeg_COF004_S4_TMSEEG_20160713_192459_3.mat'} ... %S4
    {'spmeeg_COF004_S5_TMSEEG_20160713_222122_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [5.5];
data(num).SleepTime = [22.5];
data(num).closestE = [];
data(num).dlmo = [22.34];
data(num).dlmosas = 22.8730;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = []; % D' of S7, 8 and 9 is <=0
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%3 - COF008
num = num + 1;
data(num).num         = num;
data(num).weight      = 74;
data(num).height      = 169;
data(num).id          = 'COF008';%
data(num).thkid       = 'E0586';%
data(num).Dose        = 173;
data(num).PTname      = ['P1' ; 'P2'];%
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s914-0002-00001-000224-01.nii,1'};
data(num).MRIvisits   = '2';
data(num).LongMRI     = '916'; % Not done for this subject
data(num).T1w         = '2';
data(num).PDw         = '3';
data(num).MTw         = '4';
data(num).B1          = '5';
data(num).B0magn      = '6'; 
data(num).B0phase     = '';
data(num).PTfile     = {{'spmeeg_COF008_P1_20160624_103503_3.mat'} ... %P1
    {'spmeeg_COF008_P2_0160624_103503_5.mat'} ...%P2
    };
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF008_S1_TMSEEG_20160825_082122_3.mat'} ... %S1
    {'spmeeg_COF008_S2_TMSEEG_20160825_114617_2.mat'} ... %S2
    {'spmeeg_COF008_S3_TMSEEG_20160825_174518_2.mat'} ... %S3
    {'spmeeg_COF008_S4_TMSEEG_20160825_211614_2.mat'} ... %S4
    {'spmeeg_COF008_S5_TMSEEG_20160825_233422_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 7;
data(num).SleepTime = 23;
data(num).closestE = [];
data(num).dlmo = 20.94;
data(num).dlmosas = 21.5487;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%4 - COF009
num = num + 1;
data(num).num        = num;
data(num).weight     = 58;
data(num).height     = 144;
data(num).id          = 'COF009';%
% data(num).thkid       = [];
% data(num).Dose       = [];
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1006-0005-00001-000224-01.nii,1'};
data(num).MRIvisits   = '2';
data(num).LongMRI     = '1466'; % Not done yet
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF009_P1_20160920_094402_5.mat'} ... %P1
{'spmeeg_COF009_P2_20160920_094402_8.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF009_S1_TMSEEG_20161122_081554_3.mat'} ... %S1
    {'spmeeg_COF009_S2_TMSEEG_20161122_150037_2.mat'} ... %S2
    {'spmeeg_COF009_S3_TMSEEG_20161122_161826_2.mat'} ... %S3
    {'spmeeg_COF009_S4_TMSEEG_20161122_200114_2.mat'} ... %S4
    {'spmeeg_COF009_S5_TMSEEG_20161122_222154_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 7;
data(num).SleepTime = 22.5;
data(num).closestE = [];
data(num).dlmo = [18.52];
data(num).dlmosas = 20.0480;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%5 - COF012 
num = num + 1;
data(num).num        = num;
data(num).weight     = 59;
data(num).height     = 165;
data(num).id          = 'COF012';%
% data(num).thkid       = [];
% data(num).Dose       = [];
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s940-0005-00001-000224-01.nii,1'};
data(num).MRIvisits   = '1';
data(num).LongMRI     = '940';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15';
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF012_20160705_124512_4.mat'} ... %P1
{'spmeeg_COF012_P2_20160705_124512_8.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF012_S1_TMSEEG_20160713_091521_3.mat'} ... %S1
    {'spmeeg_COF012_S2_TMSEEG_20160713_144852_2.mat'} ... %S2
    {'spmeeg_COF012_S3_TMSEEG_20160713_184024_2.mat'} ... %S3
    {'spmeeg_COF012_S4_TMSEEG_20160713_210803_3.mat'} ... %S4
    {'spmeeg_COF012_S5_TMSEEG_20160714_010232_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 6.5;
data(num).SleepTime = 22.5;
data(num).closestE = [];
data(num).dlmo = [20.06];
data(num).dlmosas = 21.1010;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];


%6 - COF013
num = num + 1;
data(num).num         = num;
data(num).weight      = 64;
data(num).height      = 170;
data(num).id          = 'COF013';%
data(num).thkid       = 'E0716';%
data(num).Dose        = 185;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s994-0014-00001-000224-01.nii,1'};
data(num).LongMRI     = '1009';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF013_P1_20160822_140742_6.mat'} ... %P1
{'spmeeg_COF013_P2_20160822_140742_9.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF013_S1_TMSEEG_20160825_101432_4.mat'} ... %S1
    {'spmeeg_COF013_S2_TMSEEG_20160825_162111_4.mat'} ... %S2
    {'spmeeg_COF013_S3_TMSEEG_20160825_200654_2.mat'} ... %S3
    {'spmeeg_COF013_S4_TMSEEG_20160825_222953_2.mat'} ... %S4
    {'spmeeg_COF013_S5_TMSEEG_20160826_021744_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 8;
data(num).SleepTime = 23.25;
data(num).closestE = [];
data(num).dlmo = [20.83];
data(num).dlmosas = 21.4572;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = []; %D' of S9 is <=0
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%7 - COF014
num = num + 1;
data(num).num         = num;
data(num).weight      = 81;
data(num).height      = 181;
data(num).id          = 'COF014';%
data(num).thkid       = 'E0710';%
data(num).Dose        = 190;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s995-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '997';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF014_P1_20160817_122626_6.mat'} ... %P1
{'spmeeg_COF014_P2_20160817_122626_8.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF014_S1_TMSEEG_20160907_100508_4.mat'} ... %S1
    {'spmeeg_COF014_S2_TMSEEG_20160907_163015_2.mat'} ... %S2
    {'spmeeg_COF014_S4_TMSEEG_20160907_223114_2.mat'} ... %S4
    {'spmeeg_COF014_S5_TMSEEG_20160908_023028_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 8;
data(num).SleepTime = 0;
data(num).closestE = [];
data(num).dlmo = [22.24];
data(num).dlmosas = 22.8029;
data(num).peak = [3];
data(num).ecd = [3];
data(num).dcm = [3];
data(num).twoback = []; %D' of S9 is <=0
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [3];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [3];

%8 - COF015
num = num + 1;
data(num).num         = num;
data(num).weight      = 71;
data(num).height      = 168;
data(num).id          = 'COF015';%
data(num).thkid       = 'E0722';%
data(num).Dose        = 199;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1007-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1007';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF015_P1_20160920_120500_8.mat'} ... %P1
{'spmeeg_COF015_P2_20160920_120500_11.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF015_S1_TMSEEG_20170307_080820_6.mat'} ... %S1
    {'spmeeg_COF015_S2_20170307_111547_3.mat'} ... %S2
    {'spmeeg_COF015_S3_TMSEEG_20170307_185755_2.mat'} ... %S3
    {'spmeeg_COF015_S4_TMSEEG_20170307_212048_3.mat'} ... %S4
    {'spmeeg_COF015_S5_20170308_012700_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [7];
data(num).SleepTime = [22.5];
data(num).closestE = [];
data(num).dlmo = [20.83];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%9 - COF016
num = num + 1;
data(num).num         = num;
data(num).weight      = 64;
data(num).height      = 161;
data(num).id          = 'COF016';%
data(num).thkid       = 'E0577';%
data(num).Dose        = 191;
data(num).PTname      = ['P1' ; 'P2' ; 'P3'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s989-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '989';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF016_P1_20160803_124831_6.mat'} ... %P1
{'spmeeg_COF016_P2_20160803_124831_9.mat'} ...%P2
{'spmeeg_COF016_P3_20160803_124831_14.mat'} ...%P3
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF016_S1_TMSEEG_20160811_101158_3.mat'} ... %S1
    {'spmeeg_COF016_S2_TMSEEG_20160811_163013_2.mat'} ... %S2
    {'spmeeg_COF016_S3_TMSEEG_20160811_200454_2.mat'} ... %S3
    {'spmeeg_COF016_S4_TMSEEG_20160811_223726_2.mat'} ... %S4
    {'spmeeg_COF016_S5_TMSEEG_20160812_023633_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 8;
data(num).SleepTime = 0;
data(num).closestE = [];
data(num).dlmo = [19.79];
data(num).dlmosas = 20.7651;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%10 - COF017
num = num + 1;
data(num).num         = num;
data(num).weight      = 83;
data(num).height      = 182;
data(num).id          = 'COF017';%
data(num).thkid       = 'E0578';%
data(num).Dose        = 194;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s988-0006-00001-000224-01.nii,1'};
data(num).LongMRI     = '990';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF017_P1_20160803_095649_7.mat'} ... %P1
{'spmeeg_COF017_P2_20160803_095649_10.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF017_S1_TMSEEG_20160811_081922_3.mat'} ... %S1
    {'spmeeg_COF017_S2_TMSEEG_20160811_110607_2.mat'} ... %S2
    {'spmeeg_COF017_S3_TMSEEG_20160811_174536_2.mat'} ... %S3
    {'spmeeg_COF017_S4_TMSEEG_20160811_210107_2.mat'} ... %S4
    {'spmeeg_COF017_S5_TMSEEG_20160811_233922_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 7;
data(num).SleepTime = 22.5;
data(num).closestE = [];
data(num).dlmo = [21.41];
data(num).dlmosas = 22.1814;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%11 - COF020
num = num + 1;
data(num).num         = num;
data(num).weight      = 66;
data(num).height      = 166;
data(num).id          = 'COF020';%
data(num).thkid       = 'E0588';%
data(num).Dose        = 196;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s999-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '999';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF020_P1_20160830_103128_8.mat'} ... %P1
{'spmeeg_COF020_P2_20160830_103128_12.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF020_S1_TMSEEG_20160907_004057_3.mat'} ... %S1
    {'spmeeg_COF020_S2_TMSEEG_20160907_111422_2.mat'} ... %S2
    {'spmeeg_COF020_S3_TMSEEG_20160907_172546_1.mat'} ... %S3
    {'spmeeg_COF020_S4_TMSEEG_20160907_212919_2.mat'} ... %S4
    {'spmeeg_COF020_S5_TMSEEG_20160907_232617_6.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 7;
data(num).SleepTime = 23.5;
data(num).closestE = [];
data(num).dlmo = [20.17];
data(num).dlmosas = 20.6664;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [7];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [7];
data(num).vas_tasks = [6];
data(num).vas_tms = [];

%12 - COF023
num = num + 1; 
data(num).num         = num;
data(num).weight      = 76;
data(num).height      = 174;
data(num).id          = 'COF023';%
data(num).thkid       = 'E0715';%
data(num).Dose        = 202;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['1' ; '2' ; '3' ; '4' ; '5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1040-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1040';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '13';
data(num).B1          = '15';
data(num).B0magn      = '16'; 
data(num).B0phase     = '17';
data(num).PTfile     = {{'spmeeg_COF023_P1_20161026_104129_4.mat'} ... %P1
{'spmeeg_COF023_P2_20161026_104129_6.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF023_S1_TMSEEG_20161116_082955_5.mat'} ... %S1
    {'spmeeg_COF023_S2_TMSEEG_20161116_111907_2.mat'} ... %S2
    {'spmeeg_COF023_S3_TMSEEG_20161116_180514_4.mat'} ... %S3
    {'spmeeg_COF023_S4_TMSEEG_20161116_212304_2.mat'} ... %S4
    {'spmeeg_COF023_S5_TMSEEG_20161117_023202_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 8;
data(num).SleepTime = 22.5;
data(num).closestE = [];
data(num).dlmo = [20.44];
data(num).dlmosas = 21.7222;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%13 - COF024
num = num + 1;
data(num).num         = num;
data(num).weight      = 100;
data(num).height      = 188;
data(num).id          = 'COF024';%
data(num).thkid       = 'E0707';%
data(num).Dose        = 195;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1020-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1020';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12'; %'13';
data(num).B1          = '14'; %'15';
data(num).B0magn      = '15'; %'16'; 
data(num).B0phase     = '16'; %'17';
data(num).PTfile     = {{'spmeeg_COF024_P1_20160930_132228_7.mat'} ... %P1
{'spmeeg_COF024_P2_20160930_132228_12.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF024_S1_TMSEEG_20161007_075347_3.mat'} ... %S1
    {'spmeeg_COF024_S2_TMSEEG_20161007_104250_4.mat'} ... %S2
    {'spmeeg_COF024_S3_TMSEEG_20161007_171812_2.mat'} ... %S3
    {'spmeeg_COF024_S4_TMSEEG_20161007_204209_2.mat'} ... %S4
    {'spmeeg_COF024_S5_TMSEEG_20161007_225748_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 6.5;
data(num).SleepTime = 23.5;
data(num).closestE = [];
data(num).dlmo = [21.23];
data(num).dlmosas = 22.3320;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%14 - COF025
num = num + 1;
data(num).num         = num;
data(num).weight      = 54;
data(num).height      = 163;
data(num).id          = 'COF025';%
data(num).thkid       = 'E0735';
data(num).Dose       = 195;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['01' ; '02' ; '03' ; '04' ; '05'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1026-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1026';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF025_P1_20161006_101426_9.mat'} ... %P1
{'spmeeg_COF025_P2_20161006_101426_13.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF025_S1_TMSEEG_20161021_072544_6.mat'} ... %S1
    {'spmeeg_COF025_S2_TMSEEEG_20161021_144027_2.mat'} ... %S2
    {'spmeeg_COF025_S3_TMSEEG_20161021_153749_2.mat'} ... %S3
    {'spmeeg_COF025_S4_TMSEEG_20161021_202327_2.mat'} ... %S4
    {'spmeeg_COF025_S5_TMSEEG_20161022_002540_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 6;
data(num).SleepTime = 22.75;
data(num).closestE = [];
data(num).dlmo = [20.6];
data(num).dlmosas = 21.1648;
data(num).peak = [2];% bad session
data(num).ecd = [2];
data(num).dcm = [2];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%15 - COF026
num = num + 1;
data(num).num         = num;
data(num).weight      = 85;
data(num).height      = 170;
data(num).id          = 'COF026';%
% data(num).Dose       = '';
% data(num).thkid       = [];
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1035-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1046';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF026_P1_20161020_094201_14.mat'} ... %P1
{'spmeeg_COF026_P2_20161020_094201_16.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF026_S1_TMSEEG_20170316_090832_6.mat'} ... %S1
    {'spmeeg_COF026_S2_TMSEEG_20170316_153236_3.mat'} ... %S2
    {'spmeeg_COF026_S3_TMSEEG_20170316_190532_2.mat'} ... %S3
    {'spmeeg_COF026_S4_TMSEEG_20170316_214132_2.mat'} ... %S4
    {'spmeeg_COF206_S5_TMSEEG_170317_015941_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [7.25];
data(num).SleepTime = [23];
data(num).closestE = [];
data(num).dlmo = [19.82];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%16 - COF027
num = num + 1;
data(num).num         = num;
data(num).weight      = 82;
data(num).height      = 179;
data(num).id          = 'COF027';%
data(num).thkid       = 'E0765';
data(num).Dose        = 196;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['01' ; '02' ; '03' ; '04' ; '05'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s160930090910DST131221107524366021-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1422'; 
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF027_P1_20160930_094435_6.mat'} ... %P1
{'spmeeg_COF027_P2_20160930_094435_14.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF027_S1_TMSEEG_20161007_094328_3.mat'} ... %S1
    {'spmeeg_COF027_S2_TMSEEG_20161007_155810_5.mat'} ... %S2
    {'spmeeg_COF027_S3_TMSEEG_20161007_193622_3.mat'} ... %S3
    {'spmeeg_COF027_S4_TMSEEG_20161007_214919_2.mat'} ... %S4
    {'spmeeg_COF027_S5_TMSEEG_20161008_014227_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 7.5;
data(num).SleepTime = 23;
data(num).closestE = [];
data(num).dlmo = [20.13];
data(num).dlmosas = 21.3714;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%17 - COF028
num = num + 1;
data(num).num         = num;
data(num).weight      = 53;
data(num).height      = 158;
data(num).id          = 'COF028';%
data(num).thkid       = 'E0711';%
data(num).Dose        = 191;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['1' ; '2' ; '3' ; '4' ; '5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1049-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1049';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF028_P1_20161111_103234_6.mat'} ... %P1
{'spmeeg_COF028_P2_20161111_103234_9.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF028_S1_TMSEEG_20161126_092529_3.mat'} ... %S1
    {'spmeeg_COF028_S2_TMSEEG_20161126_155038_2.mat'} ... %S2
    {'spmeeg_COF028_S3_TMSEEG_20161126_193801_2.mat'} ... %S3
    {'spmeeg_COF028_S4_TMSEEG_20161126_220622_2.mat'} ... %S4
    {'spmeeg_COF028_S5_TMSEEG_20161127_014102_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 7.5;
data(num).SleepTime = 22.5;
data(num).closestE = [];
data(num).dlmo = [20.39];
data(num).dlmosas = 21.3657;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%18 - COF034
num = num + 1;
data(num).num         = num;
data(num).weight      = 72;
data(num).height      = 171;
data(num).id          = 'COF034';%
data(num).Dose        = 189;
data(num).thkid       = 'E0712';%
data(num).PTname      = ['P1' ; 'P2' ; 'P3'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1213-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1437'; 
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF034_P1_20170309_091607_10.mat'} ... %P1
{'spmeeg_COF034_P2_20170309_091607_14.mat'} ...%P2
{'spmeeg_COF034_P3_20170309_091607_15.mat'} ...%P3
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF034_S1_TMSEEG_20170315_165742_8.mat'} ... %S1
    {'spmeeg_COF034_S2_TMSEEG_20170316_132050_2.mat'} ... %S2
    {'spmeeg_COF034_S3_TMSEEG_20170316_164556_3.mat'} ... %S3
    {'spmeeg_COF034_S4_TMSEEG_20170316_202706_2.mat'} ... %S4
    {'spmeeg_COF034_S5_TMSEEG_20170317_003357_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [6.25];
data(num).SleepTime = [22.5];
data(num).closestE = [];
data(num).dlmo = [20.56];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%25 - COF035
num = num + 1;
data(num).num         = num;
data(num).weight      = 70;
data(num).height      = 160;
data(num).id          = 'COF035';%
data(num).thkid       = 'E0733';
data(num).Dose       = 198;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1274-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1480'; % Not done yet
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';
data(num).PTfile     = {{'spmeeg_COF035_P1_20170425_165227_8.mat'} ... %P1
{'spmeeg_COF035_P2_20170425_165227_10.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF035_S1_TMSEEG_20170428_074759_7.mat'} ... %S1
    {'spmeeg_COF035_S2_TMSEEG_20170428_133440_2.mat'} ... %S2
    {'spmeeg_COF035_S3_TMSEEG_20170428_184956_3.mat'} ... %S3
    {'spmeeg_COF035_S4_TMSEEG_20170428_203227_2.mat'} ... %S4
    {'spmeeg_COF035_S5_TMSEEG_20170428_232602_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [6.5];
data(num).SleepTime = [23.5];
data(num).closestE = [];
data(num).dlmo = [22.58];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [8];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [1 2];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%19 - COF036
num = num + 1;
data(num).num         = num;
data(num).weight      = 53;
data(num).height      = 160;
data(num).id          = 'COF036';%
data(num).thkid       = 'E0708';%
data(num).Dose        = 186;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1044-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1465'; % Not done yet
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF036_P1_20161108_093501_3.mat'} ... %P1
{'spmeeg_COF036_P2_20161108_093501_6.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF036_S1_EEGTMS_20170307_101536_3.mat'} ... %S1
    {'spmeeg_COF036_S2_20170307_172807_2.mat'} ... %S2
    {'spmeeg_COF036_S3_TMSEEG_20170307_200004_2.mat'} ... %S3
    {'spmeeg_COF036_S4_20170307_222611_2.mat'} ... %S4
    {'spmeeg_COF036_S5_0170308_015944_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [8];
data(num).SleepTime = [23.5];
data(num).closestE = [];
data(num).dlmo = [20.15];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [6];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%20 - COF039
num = num + 1;
data(num).num         = num;
data(num).weight      = 58;
data(num).height      = 170;
data(num).id          = 'COF039';%
data(num).thkid       = 'E0574';
data(num).Dose        = 197;
data(num).PTname      = ['P1' ; 'P2' ; 'P3'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['1' ; '2' ; '3' ; '4' ; '5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1060-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1133';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF039_P1_20161118_103439_2.mat'} ... %P1
 {'spmeeg_COF039_P2_P220161118_103439_5.mat'} ...%P2
 {'spmeeg_COF039_P3_20161118_103439_10.mat'} ...%P3
 };
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF039_S1_TMSEEG_20161126_075844_4.mat'} ... %S1
    {'spmeeg_COF039_S2_TMSEEG_20161126_102721_2.mat'} ... %S2
    {'spmeeg_COF039_S3_TMSEEG_20161126_165945_2.mat'} ... %S3
    {'spmeeg_COF039_S4_TMSEEG_0161126_203328_2.mat'} ... %S4
    {'spmeeg_COF039_S5_TMSEEG_20161126_225339_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 6.5;
data(num).SleepTime = 22.5;
data(num).closestE = [];
data(num).dlmo = [21.36];
data(num).dlmosas = 23.8470;
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%21 - COF040
num = num + 1;
data(num).num         = num;
data(num).weight      = 62;
data(num).height      = 166;
data(num).id          = 'COF040';%
data(num).thkid       = 'E0752';%
data(num).Dose        = 201;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1214-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1472';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9';
data(num).B0phase     = '10';

%21 - COF043
num = num + 1;
data(num).num         = num;
data(num).weight      = 63;
data(num).height      = 151;
data(num).id          = 'COF043';%
data(num).thkid       = 'E0706';%
data(num).Dose        = 186;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1214-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1214';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15';
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF043_P1_20170309_125711_3.mat'} ... %P1
{'spmeeg_COF043_P2_20170309_125711_6.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF043_S1_TMSEEG_20170407_065740_5.mat'} ... %S1
    {'spmeeg_COF043_S2_TMSEEG_20170407_101814_2.mat'} ... %S2
    {'spmeeg_COF043_S3_TMSEEG_20170407_161938_2.mat'} ... %S3
    {'spmeeg_COF043_S4_TMSEEG-20170407_201719_2.mat'} ... %S4
    {'spmeeg_COF043_S5_TMSEEG_20170407_223027_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [6];
data(num).SleepTime = [23.5];
data(num).closestE = [];
data(num).dlmo = [20.38];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];


%21 - COF044
num = num + 1;
data(num).num         = num;
data(num).weight      = 63;
data(num).height      = 151;
data(num).id          = 'COF044';%
% data(num).thkid       = '';%
% data(num).Dose        = ;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1214-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1509';
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12';
data(num).B0phase     = '13';

%22 - COF045
num = num + 1;
data(num).num         = num;
data(num).weight      = 70;
data(num).height      = 168;
data(num).id          = 'COF045';%
data(num).thkid       = 'E0734';
data(num).Dose        = 196;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1252-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1542'; 
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF045_P1_20170327_092625_10.mat'} ... %P1
{'spmeeg_COF045_P2_20170327_092625_13.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF045_S1_TMSEEG_20170407_090318_6.mat'} ... %S1
    {'spmeeg_COF045_S2_TMSEEG_20170407_152650_5.mat'} ... %S2
    {'spmeeg_COF045_S3_TMSEEG_20170407_185938_2.mat'} ... %S3
    {'spmeeg_COF045_S4_TMSEEG_20170407_212026_2.mat'} ... %S4
    {'spmeeg_COF045_S5_TMSEEG_20170408_011648_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [7];
data(num).SleepTime = [23];
data(num).closestE = [];
data(num).dlmo = [20.24];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%23 - COF048
num = num + 1;
data(num).num         = num;
data(num).weight      = 70;
data(num).height      = 174;
data(num).id          = 'COF048';%
data(num).thkid       = 'E0768';%
data(num).Dose        = 193;
data(num).PTname      = ['P1' ; 'P2' ; 'P3'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1261-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1511';
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

%23 - COF049
num = num + 1;
data(num).num         = num;
data(num).weight      = 70;
data(num).height      = 168;
data(num).id          = 'COF049';%
data(num).thkid       = 'E0590';%
data(num).Dose        = 192;
data(num).PTname      = ['P1' ; 'P2' ; 'P3'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1261-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1357';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF049_P1_20170330_091620_4.mat'} ... %P1
{'spmeeg_COF049_P2_20170330_091620_7.mat'} ...%P2
{'spmeeg_COF049_P3_20170330_091620_11.mat'} ...%P3
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF049_S1_TMSEEG_20170411_092315_6.mat'} ... %S1
    {'spmeeg_COF049_S2_TMSEEG_20170411_160731_2.mat'} ... %S2
    {'spmeeg_COF049_S3_TMSEEG_20170411_193020_2.mat'} ... %S3
    {'spmeeg_COF049_S4_TMSEEG_20170411_215748_2.mat'} ... %S4
    {'spmeeg_COF049_S5_TMSEEG_20170412_013755_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [7.5];
data(num).SleepTime = [22.5];
data(num).closestE = [];
data(num).dlmo = [20.09];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%24 - COF050
num = num + 1;
data(num).num         = num;
data(num).weight      = 76;
data(num).height      = 162;
data(num).id          = 'COF050';%
data(num).thkid       = 'E0732';
data(num).Dose        = 189;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1262-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1262';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{'spmeeg_COF050_P1_20170330_113515_3.mat'} ... %P1
{'spmeeg_COF050_P2_20170330_144015_7.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF050_S1_TMSEEG_20170411_073613_4.mat'} ... %S1
    {'spmeeg_COF050_S2_TMSEEG_20170411_145452.mat'} ... %S2
    {'spmeeg_COF050_S3_TMSEEG_20170411_185441_2.mat'} ... %S3
    {'spmeeg_COF050_S4_TMSEEG_20170411_203320_3.mat'} ... %S4
    {'spmeeg_COF050_S5_TMSEEG_20170411_225344_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [6.5];
data(num).SleepTime = [23.5];
data(num).closestE = [];
data(num).dlmo = [20.93];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%27 - COF055
num = num + 1;
data(num).num         = num;
data(num).weight      = 81;
data(num).height      = 176;
data(num).id          = 'COF055';%
data(num).thkid       = 'E0721';%
data(num).Dose        = 194;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1307-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1307';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{''} ... %P1
{''} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF055_S1_TMSEEG_20170525_090642_4.mat'} ... %S1
    {'spmeeg_COF055_S2_TMSEEG_20170525_151510_2.mat'} ... %S2
    {'spmeeg_COF055_S3_TMSEEG_20170525_184249_2.mat'} ... %S3
    {'spmeeg_COF055_S4_TMSEEG_20170525_210427_3.mat'} ... %S4
    {'spmeeg_COF055_S5_TMSEEG_20170526_005521_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [6.75];
data(num).SleepTime = [23.75];
data(num).closestE = [];
data(num).dlmo = [19.49];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%28 - COF057
num = num + 1;
data(num).num         = num;
data(num).weight      = 96;
data(num).height      = 185;
data(num).id          = 'COF057';%
data(num).thkid       = 'E0705';%
data(num).Dose        = 188;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1298-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1338';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{''} ... %P1
{''} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF057_S1_TMSEEG_20170525_074437_3.mat'} ... %S1
    {'spmeeg_COF057_S2_TMSEEG_20170525_134900_2.mat'} ... %S2
    {'spmeeg_COF057_S3_TMSEEG_20170525_160503_2.mat'} ... %S3
    {'spmeeg_COF057_S4_TMSEEG_20170525_194739_2.mat'} ... %S4
    {'spmeeg_COF057_S5_TMSEEG_20170526_000043_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 5.75;
data(num).SleepTime = 22.5;
data(num).closestE = [];
data(num).dlmo = [21.6];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%29 - COF059
num = num + 1;
data(num).num         = num;
data(num).weight      = 70;
data(num).height      = 172;
data(num).id          = 'COF059';%
data(num).thkid       = 'E0726';%
data(num).Dose        = 185;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1316-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1316';
data(num).T1w         = '8';
data(num).PDw         = '10';
data(num).MTw         = '12';
data(num).B1          = '14';
data(num).B0magn      = '15'; 
data(num).B0phase     = '16';
data(num).PTfile     = {{''} ... %P1
{''} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF059_S1_TMSEEG_20170601_075520_3.mat'} ... %S1
    {'spmeeg_COF059_S2_TMSEEG_20170601_094849_2.mat'} ... %S2
    {'spmeeg_COF059_S3_TMSEEG_20170601_162022_2.mat'} ... %S3
    {'spmeeg_COF059_S4_TMSEEG_20170601_194712_2.mat'} ... %S4
    {'spmeeg_COF059_S5_TMSEEG_20170601_221107_3.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 7;
data(num).SleepTime = 23;
data(num).closestE = [];
data(num).dlmo = [20.84];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%26 - COF060
num = num + 1;
data(num).num         = num;
data(num).weight      = 77;
data(num).height      = 172;
data(num).id          = 'COF060';%
data(num).thkid       = 'E0717';
data(num).Dose        = 181;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1273-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1490'; % Not done yet
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{'spmeeg_COF060_P1_20170421_100614_3.mat'} ... %P1
{'spmeeg_COF060_P2_20170421_100614_6.mat'} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF060_S1_TMSEEG_20170428_094156_4.mat'} ... %S1
    {'spmeeg_COF060_S2_TMSEEG_20170428_160611_2.mat'} ... %S2
    {'spmeeg_COF060_S3_TMSEEG_20170428_192237_2.mat'} ... %S3
    {'spmeeg_COF060_S4_TMSEEG_20170428_214453_2.mat'} ... %S4
    {'spmeeg_COF060_S5_TMSEEG_20170429_014006_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = [7.5];
data(num).SleepTime = [23];
data(num).closestE = [];
data(num).dlmo = [20.91];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%30 - COF061
num = num + 1;
data(num).num         = num;
data(num).weight      = 75;
data(num).height      = 165;
data(num).id          = 'COF061';%
% data(num).thkid       = '';%
% data(num).Dose        = ;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1537'; % Not done yet
data(num).T1w         = '3';
data(num).PDw         = '5';
data(num).MTw         = '7';
data(num).B1          = '9';
data(num).B0magn      = '10'; 
data(num).B0phase     = '11';

%30 - COF062
num = num + 1;
data(num).num         = num;
data(num).weight      = 73;
data(num).height      = 170;
data(num).id          = 'COF062';%
data(num).thkid       = 'E0750';%
data(num).Dose        = 199;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1451'; % Not done yet
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

%30 - COF063
num = num + 1;
data(num).num         = num;
data(num).weight      = 75;
data(num).height      = 165;
data(num).id          = 'COF063';%
data(num).thkid       = 'E0725';%
data(num).Dose        = 190;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1507'; % Not done yet
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
data(num).PTfile     = {{''} ... %P1
{''} ...%P2
};
data(num).DCMfile     = {'merged_spmeeg_.mat'};
data(num).EEGfile     = {{'spmeeg_COF063_S1_TMSEEG_20170520_065515_5.mat'} ... %S1
    {'spmeeg_COF063_S2_TMSEEG-20170520_093205_2.mat'} ... %S2
    {'spmeeg_COF063_S3_TMSEEG_20170520_172301_3.mat'} ... %S3
    {'spmeeg_COF063_S4_TMSEEG_20170520_192821_2.mat'} ... %S4
    {'spmeeg_COF063_S5_TMSEEG_20170520_220508_2.mat'} ... %S5
    };
data(num).FPL_OPL = []; 
data(num).Sleep_cycles = {};
data(num).wkTime = 6.5;
data(num).SleepTime = 22;
data(num).closestE = [];
data(num).dlmo = [18.61];
data(num).peak = [];
data(num).ecd = [];
data(num).dcm = [];
data(num).twoback = [];
data(num).threeback = [];
data(num).sart = [];
data(num).pvt = [];
data(num).kss_alone = [];
data(num).kss_tasks = [];
data(num).kss_tms = [];
data(num).vas_alone = [];
data(num).vas_tasks = [];
data(num).vas_tms = [];

%30 - COF065
num = num + 1;
data(num).num         = num;
data(num).weight      = 75;
data(num).height      = 165;
data(num).id          = 'COF065';%
data(num).thkid       = 'E0742';%
data(num).Dose        = 190;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1461'; % Not done yet
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

%30 - COF068
num = num + 1;
data(num).num         = num;
data(num).weight      = 60;
data(num).height      = 176;
data(num).id          = 'COF068';%
data(num).thkid       = 'E0764';%
data(num).Dose        = 194;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1541'; % Not done yet
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

%30 - COF070
num = num + 1;
data(num).num         = num;
data(num).weight      = 60;
data(num).height      = 151;
data(num).id          = 'COF070';%
data(num).thkid       = 'E0743';%
data(num).Dose        = 193;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1527'; % Not done yet
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';

% 31 COF073	1524	5	7	9	11	12
num = num + 1;
data(num).num         = num;
data(num).weight      = 80;
data(num).height      = 172;
data(num).id          = 'COF073';%
data(num).thkid       = 'E0757';%
data(num).Dose        = 198;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1524'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 32 COF075	1464	5	7	9	11	12	
num = num + 1;
data(num).num         = num;
data(num).weight      = 63;
data(num).height      = 158;
data(num).id          = 'COF075';%
data(num).thkid       = 'E0753';%
data(num).Dose        = 188;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1464'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 33 COF080	1481	5	7	9	11	12	
num = num + 1;
data(num).num         = num;
data(num).weight      = 51;
data(num).height      = 160;
data(num).id          = 'COF080';%
data(num).thkid       = 'E0763';%
data(num).Dose        = 189;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1481'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 34 COF083	1525	5	7	9	11	12
num = num + 1;
data(num).num         = num;
data(num).weight      = 63;
data(num).height      = 158;
data(num).id          = 'COF083';%
data(num).thkid       = 'E0753';%
data(num).Dose        = 188;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1525';
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12';
data(num).B0phase     = '13';

% 35 COF085	1505	5	7	9	11	12
num = num + 1;
data(num).num         = num;
data(num).weight      = 63;
data(num).height      = 158;
data(num).id          = 'COF085';%
data(num).thkid       = 'E0753';%
data(num).Dose        = 188;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1505'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 36 COF086	1528	5	7	9	11	12	
num = num + 1;
data(num).num         = num;
data(num).weight      = 65;
data(num).height      = 153;
data(num).id          = 'COF086';%
data(num).thkid       = 'E0767';%
data(num).Dose        = 188;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1528'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 37 COF088	1557	5	7	9	11	12
num = num + 1;
data(num).num         = num;
% data(num).weight      = ;
% data(num).height      = ;
data(num).id          = 'COF088';%
data(num).thkid       = 'E0758';%
% data(num).Dose        = ;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1557'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 38 COF089	1556	5	7	9	11	12	
num = num + 1;
data(num).num         = num;
% data(num).weight      = ;
% data(num).height      = ;
data(num).id          = 'COF089';%
data(num).thkid       = 'E0758';%
% data(num).Dose        = ;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1556'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 39 COF091	1554	5	7	9	11	12	
num = num + 1;
data(num).num         = num;
data(num).weight      = 66;
data(num).height      = 172;
data(num).id          = 'COF091';%
data(num).thkid       = 'E0772';%
data(num).Dose        = 185;
data(num).PTname      = ['P1' ; 'P2'];
data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
data(num).dir         = fullfile(pathtodata,data(num).id);
data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
data(num).Sname       = {'LSMA'};
data(num).channel     = '';
data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
data(num).LongMRI     = '1554'; 
data(num).T1w         = '5';
data(num).PDw         = '7';
data(num).MTw         = '9';
data(num).B1          = '11';
data(num).B0magn      = '12'; 
data(num).B0phase     = '13';

% 40 COF092	1554	5	7	9	11	12	
% num = num + 1;
% data(num).num         = num;
% data(num).weight      = 57;
% data(num).height      = 155;
% data(num).id          = 'COF091';%
% data(num).thkid       = 'E0771';%
% data(num).Dose        = 179;
% data(num).PTname      = ['P1' ; 'P2'];
% data(num).sessname    = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5']; %nb of the run for session - from which f00x should start
% data(num).sspname     = ['S1' ; 'S2' ; 'S3' ; 'S4' ; 'S5'];
% data(num).dir         = fullfile(pathtodata,data(num).id);
% data(num).dev         = []; % origin coordinate of structural of subject (see information window in MRcron)
% data(num).EFcoord     = []; % EF based on median across % sessions CHECK!
% data(num).FIDmri      = [];% nas ; lpa ; rpa ; based on median across sessions
% data(num).Sname       = {'LSMA'};
% data(num).channel     = '';
% data(num).MRI         = {'s1311-0005-00001-000224-01.nii,1'};
% data(num).LongMRI     = '1554'; 
% data(num).T1w         = '5';
% data(num).PDw         = '7';
% data(num).MTw         = '9';
% data(num).B1          = '11';
% data(num).B0magn      = '12'; 
% data(num).B0phase     = '13';

%31 - COF9999
num = num + 1;
data(num).num         = num;
data(num).dir         = 'D:\thk\COF999'
data(num).weight      = 75;
data(num).height      = 165;
data(num).id          = 'COF999';
data(num).thkid       = 'E0599';
data(num).Dose        = 180;
data(num).MRI         = {'s1366-0017-00001-000224-01.nii,1'};
data(num).LongMRI     = '1366';
data(num).T1w         = '2';
data(num).PDw         = '4';
data(num).MTw         = '6';
data(num).B1          = '8';
data(num).B0magn      = '9'; 
data(num).B0phase     = '10';
return