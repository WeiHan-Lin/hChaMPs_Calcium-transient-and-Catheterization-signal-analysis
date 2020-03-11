Sampling_period = 1/Sampling_frequency;
Length_of_signal = length(Signal_raw)-30000;           % first 6 seconds of all the data were removed for consistency
Time_vector = (0:Length_of_signal-1)*Sampling_period;
Signal_filtered = filtfilt(Highpass_coefficient_of_secondorder_sections,Highpass_coefficient_of_gain,filtfilt(Lowpass_coefficient_of_secondorder_section,Lowpass_coefficient_of_gain,Signal_raw));
%The filterDesigner toolbox was used for getting these coefficients with 0.1 Hz stop frequency for Highpass coefficients and 20 Hz stop frequency for Lowpass coefficients.

Y = fft(Signal_filtered(30001:end));                   % Fast fourier transform of the filtered data
P2 = abs(Y/Length_of_signal);                
P1 = P2(1:Length_of_signal/2+1);
P1(2:end-1) = 2*P1(2:end-1);                           % One-side amplitude
f = Sampling_frequency*(0:(Length_of_signal/2))/Length_of_signal;

[pks_Signal,locs_Signal,widths_Signal,proms_Signal]=findpeaks(Signal_filtered(30001:end),Time_vector,'MinPeakProminence',peak_prominence_threshold);
Average_signal_amplitude = mean (proms_Signal);
Signal_frequency_domain = [f;P1'];
[maxvalue, index] = max(Signal_frequency_domain,[],2);
Beating_frequency = Signal_frequency_domain(1,index(2));
