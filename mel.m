clear all;
f_low=300;
f_high=8000;

%%computing band in mel-scale
mel_low=1125*log(1+(f_low/700));
mel_high=1125*log(1+(f_high/700));

filt_num=26;

%%creating the mel-scaled vector
Mel = linspace(mel_low,mel_high,filt_num+2);

%%computing frequencies of the Mel vector
%FREQ=700*((10.^(Mel/2595))-1);
Freq = 700*((exp(Mel/1125))-1);

fs=16000;

nfft = 512;

%%convert frequencies to nearest bins
for i=1:filt_num+2
  f(i) = floor((nfft+1)*Freq(i)/fs);
end 



for m =2:length(Mel)-1
  for k=1:floor(nfft/2+1)
    h(m-1,k) = formula(k,f,m)
  end
end

    
save('mel_filter_bank')
    



  