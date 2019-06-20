%make frames
clear all;
[signal,fs] = wavread('sample.wav');
f_d = 0.025;
f_size = f_d*fs;
n = length(signal);
n_f = floor(n/f_size);
temp = 0;
for i = 1 : n_f
  frame(i,:) = signal(temp + 1 : temp + f_size);
  temp = temp + f_size;
end
if mod(n_f,2) == 1
  frame(n_f+1,:) =  zeros(size(frame(1,:)));
  n_f=n_f+1;
end

save('framed');




