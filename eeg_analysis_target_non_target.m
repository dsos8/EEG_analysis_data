clc;
clear all;
eeglab;

load('C:\Users\diana\Documents\MATLAB\eeglab_current\eeglab2022.0/epoch/subject_1_eeg_separated_epochs_1s.mat')
%load('C:\Users\diana\Documents\MATLAB\eeglab_current\eeglab2022.0/epoch/subject_1_eeg_separated_epochs_2s.mat')

EEG = eeg_checkset(EEG);
eeglab redraw


EEG = eeg_checkset( EEG );
EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');
eeglab redraw


%Erp image - FOR loop
figure(); 
for i = 1:8

    subplot(2,4,i)
    pop_erpimage(EEG,0, [i],[[]],['Component ', int2str(i)],10,1,{},[],'' ,'yerplabel','','erp','on','cbar','on','topo', { mean(EEG.icawinv(:,[i]),2) EEG.chanlocs EEG.chaninfo } );
end

figure(); 
for i = 9:16

    subplot(2,4,i-8)
    pop_erpimage(EEG,0, [i],[[]],['Component ', int2str(i)],10,1,{},[],'' ,'yerplabel','','erp','on','cbar','on','topo', { mean(EEG.icawinv(:,[i]),2) EEG.chanlocs EEG.chaninfo } );
end


%Topplot 16 components
EEG = eeg_checkset( EEG );
pop_topoplot(EEG, 0, [1:16] ,'EEG target',[4 4] ,0,'electrodes','on');

%Newtime function loop
figure(); 
for j = 1:8
    subplot(2,4,j)
    pop_newtimef( EEG, 0, j, [0  1998], [3         0.8] , 'topovec', EEG.icawinv(:,j), 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption',['IC 1. - 8. component '], 'baseline',[0], 'plotphase', 'off', 'padratio', 1);

end

figure(); 
for j = 9:16
    subplot(2,4,j-8)
    pop_newtimef( EEG, 0, j, [0  1998], [3         0.8] , 'topovec', EEG.icawinv(:,j), 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption',['IC 9. - 16. component '], 'baseline',[0], 'plotphase', 'off', 'padratio', 1);

end