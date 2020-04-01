function synchrony_index = calc_synchrony_index(spike_train1, spike_train2)
% calc synchrony index according to Shlens 2006

prob_A = mean(spike_train1>0)              % frequency of spike
prob_B = mean(spike_train2>0)              % frequency of spike

spike_train_both = (spike_train1>0) & (spike_train2>0);
prob_A_and_B = mean(spike_train_both>0)    % frequency of simultaneous spokes

synchrony_index = log2(prob_A_and_B / prob_A / prob_B)
