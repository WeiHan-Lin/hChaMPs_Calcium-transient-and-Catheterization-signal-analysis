Calcium_normalized = (Calcium_raw - Calcium_background)/min(Calcium_raw - Calcium_background);
[peaks_Calcium_normalized,locations_Calcium_normalized] = findpeaks(Calcium_normalized,time_sequence,'MinPeakHeight',peak_amplitude_threshold,'MinPeakDistance',peak_distance_threshold);
Average_peak_amplitude = mean(peaks_Calcium_normalized);
Interspike_intervals = diff(locations_Calcium_normalized);
Average_interspike_intervals = mean(Interspike_intervals);
Average_beating_frequency = 1/Average_interspike_intervals;
