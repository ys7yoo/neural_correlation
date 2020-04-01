%% load data set

clear

%% load spike times (mouse)
load data/mouse.mat
max_time = 60
dt = 0.1


%% load spike times (monkey)
load data/monkey.mat
max_time = 180
dt = 0.01


%% calc & plot inter-spike intervals for deciding dt (dt should be << isi)
isi1 = diff(spike_time1);
isi2 = diff(spike_time2);

mean(isi1)
mean(isi2)

clf
subplot(211)
hist(isi1)
subplot(212)
hold on
hist(isi2)


%% convert spike time to spike train
spike_train1 = convert_spike_time_to_spike_train(spike_time1, max_time, dt);
spike_train2 = convert_spike_time_to_spike_train(spike_time2, max_time, dt);

clf
bar([spike_train1, spike_train2])
% values should be mostly 1 and occasionally more than 1


%% calc synchrony index (Shlens 2006)
calc_synchrony_index(spike_train1, spike_train2)



