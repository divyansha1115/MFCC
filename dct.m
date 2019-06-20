function y = dct(x, n)

  if (nargin < 1 || nargin > 2)
    print_usage;
  endif

  realx = isreal(x);
  transpose = (rows (x) == 1);

  if transpose, x = x (:); endif
  [nr, nc] = size (x);
  if nargin == 1
    n = nr;
  elseif n > nr
    x = [ x ; zeros(n-nr,nc) ];
  elseif n < nr
    x (nr-n+1 : n, :) = [];
  endif

  if n == 1
    w = 1/2;
  else
    w = [ sqrt(1/4/n); sqrt(1/2/n)*exp((-1i*pi/2/n)*[1:n-1]') ] * ones (1, nc);
  endif
  if ( realx && rem (n, 2) == 0 )
    y = fft ([ x(1:2:n,:) ; x(n:-2:1,:) ]);
    y = 2 * real( w .* y );
  else
    y = fft ([ x ; flipud(x) ]);
    y = w .* y (1:n, :);
    if (realx) y = real (y); endif
  endif
  if transpose, y = y.'; endif

endfunction
