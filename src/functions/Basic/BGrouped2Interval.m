function interval = SCSingle_column2Grouped(grouped);
  interval = [];
  N = size(grouped)(2);
  for i=1:N-1
    interval(1,end+1) = grouped(1,i);
    interval(2,end) = grouped(1,i+1);
    if(i == N-1)
      col = grouped(2,i)+grouped(2,i+1);
    else
      col = grouped(2,i);
    endif
    interval(3,end) = col;
  endfor
