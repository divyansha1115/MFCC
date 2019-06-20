



function H=formula(k,f,m)
  if k<f(m-1)
      H = 0;
  elseif k>=f(m-1)&&k<=f(m)
      H = (k-f(m-1))/(f(m)-f(m-1));
  elseif k<=f(m+1)&&k>=f(m)
      H = (f(m+1)-k)/(f(m+1)-f(m));
  elseif k>f(m+1)
      H = 0;    
end