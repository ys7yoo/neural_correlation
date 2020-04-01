## calculate synchrony index 
according to Shlens, 2006, J Neurosci, The structure of multi-neuron firing patterns

## How to use (Matlab version)?
1. Load spike times of two cells
2. Decide max time 
3. Decide time bin (dt). For this, heck inter-spike intervals (ISI) and choose dt << ISI
4. Convert spike times to spike trains using [convert_spike_time_to_spike_train.m](convert_spike_time_to_spike_train.m).
5. Calculate synchrony index using [calc_synchrony_index.m](calc_synchrony_index.m).
