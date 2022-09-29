# EEG analysis of target and non-target epochs 
* In the first part of the code, we load one of the two "files". The first refers to the targeted, and the second to
non-target classes of neurological reactions. We check the field with the eeg_checkset (EEG) command
of EEG data sets. After that, we start the ICA decomposition with the pop_runica command
the algorithm we use is "runica". Then we create two for loops in which the command
pop_erpimage we show 16 components, of which the first eight are in the first loop, and the second eight
in the second for loop. Using the pop_topoplot command, we display those 16 components, i.e. theirs
topographic 2-D maps. In the last step, we create two for loops as for "erp image"
only that we use the command pop_newtimef with which we display the time/frequency
decomposition of the activity of independent components.
