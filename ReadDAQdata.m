clc
clear
filename1 = 'Re=50';
filename2 = 'Re=500';
filename3 = 'Re=2000';
filename4 = 'Re=4000';
filename5 = 'noise_7';

measurmentData1 = lvm_import(filename1);
time1 = measurmentData1.Segment1.data(:,1);
data1 = measurmentData1.Segment1.data(:,2);

measurmentData2 = lvm_import(filename2);
time2 = measurmentData2.Segment1.data(:,1);
data2 = measurmentData2.Segment1.data(:,2);

measurmentData3 = lvm_import(filename3);
time3= measurmentData3.Segment1.data(:,1);
data3 = measurmentData3.Segment1.data(:,2);

measurmentData4 = lvm_import(filename4);
time4 = measurmentData4.Segment1.data(:,1);
data4 = measurmentData4.Segment1.data(:,2);

measurmentData5 = lvm_import(filename5);
time5 = measurmentData5.Segment1.data(:,1);
data5 = measurmentData5.Segment1.data(:,2);

dataNorm1 = (data1-min(data1))/(max(data1)-min(data1));
dataNorm2 = (data2-min(data2))/(max(data2)-min(data2));
dataNorm3 = (data3-min(data3))/(max(data3)-min(data3));
dataNorm4 = (data4-min(data4))/(max(data4)-min(data4));
dataNorm5 = (data5-min(data5))/(max(data5)-min(data5));

% figure
% plot(time, data)
% set(gca,'FontSize', 16)
% xlabel('Time [s]')
% ylabel('Amplitude [V]')
% title('Signal Amplitude')
% 
% figure
% plot(time, dataNorm)
% set(gca,'FontSize', 16)
% xlabel('Time [s]')
% ylabel('Amplitude [V]')
% title('Normalized Signal Amplitude')

samplingFrequency = 20000;
[PSD1, measuredFrequency1] = pwelch(data1,10000,[],[], samplingFrequency); %Default settings
[PSD2, measuredFrequency2] = pwelch(data2,10000,[],[], samplingFrequency); %Default settings
[PSD3, measuredFrequency3] = pwelch(data3,10000,[],[], samplingFrequency); %Default settings
[PSD4, measuredFrequency4] = pwelch(data4,10000,[],[], samplingFrequency); %Default settings
[PSD5, measuredFrequency5] = pwelch(data5,10000,[],[], samplingFrequency); %Default settings

[PSDNorm1, measuredFrequencyNorm1] = pwelch(dataNorm1,[],[],[], samplingFrequency); %Default settings
[PSDNorm2, measuredFrequencyNorm2] = pwelch(dataNorm2,[],[],[], samplingFrequency); %Default settings
[PSDNorm3, measuredFrequencyNorm3] = pwelch(dataNorm3,[],[],[], samplingFrequency); %Default settings
[PSDNorm4, measuredFrequencyNorm4] = pwelch(dataNorm4,[],[],[], samplingFrequency); %Default settings
[PSDNorm5, measuredFrequencyNorm5] = pwelch(dataNorm5,[],[],[], samplingFrequency); %Default settings

figure
loglog(measuredFrequencyNorm1, PSDNorm1)
hold on
loglog(measuredFrequencyNorm2, PSDNorm2)
hold on
loglog(measuredFrequencyNorm3, PSDNorm3)
hold on
loglog(measuredFrequencyNorm4, PSDNorm4)
hold on
loglog(measuredFrequencyNorm5, PSDNorm5)
set(gca,'FontSize', 20)
xlabel('Measured Frequency [Hz]')
ylabel('PSD')
title('Normalized Frequency Spectra')
legend(filename1, filename2, filename3, filename4, 'Noise')

figure
loglog(measuredFrequency1, PSD1, 'LineWidth', 1.5)
hold on
loglog(measuredFrequency2, PSD2, 'LineWidth', 1.5)
hold on
loglog(measuredFrequency3, PSD3, 'LineWidth', 1.5)
hold on
loglog(measuredFrequency4, PSD4, 'LineWidth', 1.5)
hold on
loglog(measuredFrequency5, PSD5, 'LineWidth', 1.5)
set(gca,'FontSize', 20)
xlabel('Measured Frequency [Hz]')
ylabel('PSD')
title('Frequency Spectra')
legend(filename1, filename2, filename3, filename4, 'Noise')

ReynoldsNumber = [52.0075, 512.0324, 1940.3614, 3728.9897];
Height = [0.632, 0.844, 1.49, 3.14];
figure
plot(Height, ReynoldsNumber, 'LineWidth', 3.5)
set(gca,'FontSize', 20)
xlabel('Height [m]')
ylabel('Reynolds Number')
title('Reynolds number as a function of water height')