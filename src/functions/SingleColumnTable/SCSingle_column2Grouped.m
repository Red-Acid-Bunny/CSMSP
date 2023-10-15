function grouped = SCSingle_column2Grouped(single_column);
  grouped = [];
  sort_single_column = sort(single_column);
  N = size(single_column)(2);
  last = min(sort_single_column)-1;
  for i=1:N
    current = sort_single_column(i);
    if current == last
      continue;
    endif
    last = current;
    number_equal_current = sum(sort_single_column == current);
    grouped(1,end+1) = current;
    grouped(2,end) = number_equal_current;
  endfor
