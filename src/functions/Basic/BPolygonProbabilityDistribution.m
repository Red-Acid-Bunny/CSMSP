function graph = BPolygonProbabilityDistribution(grouped)
  graph = [];
  N = size(grouped(1,:))(2);
  graph(1,end+1) = min(grouped(1,:));
  graph(2,end) = 0;
  for i=1:N
    graph(1,end+1) = grouped(1,i);
    graph(2,end) = grouped(2,i);
  end
  graph(1,end+1) = max(grouped(1,:));
  graph(2,end) = 0;
