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
These are the results 

* In the first part of the code, we load one of the two "files". The first refers to the targeted, and the second to
non-target classes of neurological reactons. We check the field with the eeg_checkset (EEG) command
of EEG data sets. After that, we start the ICA decomposition with the pop_runica command
the algorithm we use is "runica". Then we create two for loops in which the command
pop_erpimage we show 16 components, of which the first eight are in the first loop, and the second eight
in the second for loop. Using the pop_topoplot command, we display those 16 components, i.e. theirs
topographic 2-D maps. In the last step, we create two for loops as for "erp image"
only that we use the command pop_newtimef with which we display the time/frequency
decomposition of the activity of independent components.
