function empiricalFunction = BEmpiricalDistributionFunction(grouped)
  empiricalFunction = [];
  col = sum(grouped(2,:));
  N = size(grouped(1,:))(2);
  empiricalFunction(1,end+1) = -inf;
  empiricalFunction(2,end) = grouped(1,1);
  empiricalFunction(3,end) = 0;
  empiricalFunction(4,end) = col;
  for i=2:N
    empiricalFunction(1,end+1) = grouped(1,i-1);
    empiricalFunction(2,end) = grouped(1,i);
    empiricalFunction(3,end) = empiricalFunction(3,end-1)+grouped(2,i-1);
    empiricalFunction(4,end) = col;
  end
  empiricalFunction(1,end+1) = grouped(1,end);
  empiricalFunction(2,end) = inf;
  empiricalFunction(3,end) = sum(grouped(2,:));
  empiricalFunction(4,end) = col;
