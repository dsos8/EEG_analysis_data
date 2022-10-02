# EEG analysis of target and non-target epochs 

## Short description
There are two types of data: target and non-target that are obtained by classifying the epochs into the specified classes. Independent component analysis (ICA) is applied to every dataset individually. With the help of EEGLAB, we will show data graphically using three functions.

## Loading first data set in EEGLAB
Before ICA decomposition, it can be read how many channels (components) there are in targeted data epochs:

![alt text](https://github.com/dsos8/EEG_analysis_data/blob/main/Capture1.JPG)

One of the algorithms used is "runica" shown below, command that is used for ICA decomposition is:
```Matlab
EEG = pop_runica(EEG, 'icatype', 'runica', 
'extended',1,'interrupt','on');
```
Command pop_erpimage is used for graphing 16 components.
```Matlab
pop_erpimage(EEG,0, [i],[[]],['Component ', int2str(i)],10,1,{},[],'' ,'yerplabel','','erp','on','cbar','on','topo', { mean(EEG.icawinv(:,[i]),2)EEG.chanlocs EEG.chaninfo } );
```
These are the results for the first eight components: 

![alt text](https://github.com/dsos8/EEG_analysis_data/blob/main/ERP%201-8.png)

Using the pop_topoplot command, we display those 16 components, i.e. their topographic 2-D maps:
```Matlab
pop_topoplot(EEG, 0, [1:16] ,'EEG target',[4 4] ,0,'electrodes','on');
```
In the last step, we use te command pop_newtimef which is used for graphing time/frequency decomposition of the activity of independent components:
```Matlab
pop_newtimef( EEG, 0, j, [0 1998], [3 0.8] , 'topovec', EEG.icawinv(:,j), 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption',['IC 1. - 8. komponenta '],'baseline',[0], 'plotphase', 'off', 'padratio', 1);
```

Same process can be used for other non-tagret dataset.
