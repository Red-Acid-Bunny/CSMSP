function graph = BGraphPolygon(interval)
  graph = [];
  N = size(interval(1,:))(2);
  for i=1:N
    if(interval(1,i)==interval(1,1))
      graph(1,end+1) = (interval(1,i)+interval(2,i))/2;
      graph(2,end) = 0;
    endif
    graph(1,end+1) = (interval(1,i)+interval(2,i))/2;
    graph(2,end) = interval(3,i);
    if(interval(1,i)==interval(1,end))
      graph(1,end+1) = (interval(1,i)+interval(2,i))/2;
      graph(2,end) = 0;
    endif
  end
