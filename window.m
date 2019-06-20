clear all;
load('framed','n_f','frame');
disp(length(frame(1,:)))
%window the frame
for j = 1 : n_f
  disp(1)
  fr_wind(j,:) = frame(j,:)'.*hamming(length(frame(j,:)));
  a=1;
end
save('window')