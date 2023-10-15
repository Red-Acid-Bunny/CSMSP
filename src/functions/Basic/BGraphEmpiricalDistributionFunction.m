function graphs = BGraphEmpiricalDistributionFunction(empiricalFunction)
  graphs = [];
  N = size(empiricalFunction(1,:))(2);  
  sizeGraphX = (max(empiricalFunction(1,:)) - min(empiricalFunction(2,:)))/10;
  for i=1:N
    if(empiricalFunction(1,i) == -inf)
      graphs(1, i) = empiricalFunction(2,i)-sizeGraphX;
      graphs(2, i) = empiricalFunction(2,i);
      temp = empiricalFunction(3,i)/empiricalFunction(4,i);
      graphs(3, i) = temp;
      graphs(4, i) = temp;
    elseif(empiricalFunction(2,i) == inf)
      graphs(1, i) = empiricalFunction(1,i);
      graphs(2, i) = empiricalFunction(1,i)+sizeGraphX;
      temp = empiricalFunction(3,i)/empiricalFunction(4,i);
      graphs(3, i) = temp;
      graphs(4, i) = temp;
    else
      graphs(1, i) = empiricalFunction(1,i);
      graphs(2, i) = empiricalFunction(2,i);
      temp = empiricalFunction(3,i)/empiricalFunction(4,i);
      graphs(3, i) = temp;
      graphs(4, i) = temp;
    endif
  end
