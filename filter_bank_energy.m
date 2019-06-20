clear all;
load('periodogram','psdy');
load('mel_filter_bank','h','filt_num');
load('framed','n_f');


for j = 1 : n_f
  for i = 1 : filt_num
    num(i,:) = psdy(j,:).*h(i,:);
  end
  energy_log(j,i) = log(sum(num(i,:)));
  dct_energy(j,:) = dct(energy_log(j,:));
end