import numpy as np
import scipy.io as sio
import os

def load_spike_times(folder_name, channel_names):
    spike_times = list()
    
    for ch in channel_names:
        filename = os.path.join(folder_name, "ch_{}.mat".format(ch))

        cell = sio.loadmat(filename)
        # print(cell.keys())

        spike_times.append(cell["ch_"+ch].ravel())        
    
    return spike_times


def convert_time_to_index(spike_times, dt):
    return np.round(spike_times/dt).astype(int)


def convert_time_to_train(spike_times, max_time, dt):
    spike_index = convert_time_to_index(spike_times, dt)
    max_index = convert_time_to_index(max_time, dt) 

    # choose spike index < max_index
    spike_index = spike_index[spike_index < max_index]

    # generate spike train
    spike_train = np.zeros(max_index)
    for i in spike_index:
        spike_train[i] += 1
    
    return spike_train
