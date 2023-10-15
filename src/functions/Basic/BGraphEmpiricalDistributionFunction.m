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
% size_grf = (interval(1,end) - interval(2,1))/3
% interval(1,1) = interval(1,2) - size_grf
% interval(2,end) = interval(1,end) + size_grf
%
% for i=1:size(interval(1,:))(2)
%   _grf = []
%   a = [interval(1,i),interval(2,i)]
%   b = interval(3,i)/interval(4,i)
%   for j=1:size(a)(2)
%     _grf(1,j) = a(j)
%     _grf(2,j) = b
%   endfor
%   plot(_grf(1,:),_grf(2,:),'linewidth', 1,"-r")
%   hold('on')
%   if _grf(1,1) != interval(1,1)
%     plot(_grf(1,1),_grf(2,1),'linewidth', 1,"or")
%   endif
%   if _grf(1,2) != interval(2,end)
%     plot(_grf(1,2),_grf(2,2),'linewidth', 1,"|-r")
%   endif
%
% end
