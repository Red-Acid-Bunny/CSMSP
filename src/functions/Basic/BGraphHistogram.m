function graph = BGraphHistogram(grouped)
  graph = [];
  N = size(grouped(1,:))(2)-1;
  for i=1:N
    graph(1,end+1) = grouped(1,i);
    graph(2,end) = grouped(1,i+1);
    graph(3,end) = grouped(2,i);
  end
