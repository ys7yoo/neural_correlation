function spike_train = convert_spike_time_to_spike_train(spike_time, max_time, dt)

% convert time to bin index
spike_bin_index = round(spike_time/dt);
spike_bin_index = reshape(spike_bin_index, 1, []); % index should be a row vector

max_bin_index = round(max_time/dt);

% choose spike bin index < max bin index
spike_bin_index = spike_bin_index(spike_bin_index > 0 & spike_bin_index <= max_bin_index);
 
% generate spike train
spike_train = zeros(max_bin_index,1);
for i = spike_bin_index
    spike_train(i) = spike_train(i) + 1;
end
    