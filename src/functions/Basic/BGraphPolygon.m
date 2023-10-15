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

  % % гистограмма
% _interval = [;;]
% for i=1:size(res)(2)-1
%   _interval(1,i) = res(1,i)
%   _interval(2,i) = res(1,i+1)
%   _interval(3,i) = res(2,i)
% endfor
% _grf = []
% for i=1:size(_interval(1,:))(2)
%   a = [_interval(1,i),_interval(2,i)]
%   b = _interval(3,i)
%   _grf(1,end+1) = a(1)
%   _grf(2,end) = 0
%   for j=1:size(a)(2)
%     _grf(1,end+1) = a(j)
%     _grf(2,end) = b
%   endfor
%   _grf(1,end+1) = a(2)
%   _grf(2,end) = 0
% end
% plot(_grf(1,:),_grf(2,:),'linewidth', 1,"-r")
% hold('on')
% _grf = []
% _grf(1,end+1) = (_interval(1,1)+_interval(2,1))/2
% _grf(2,end) = 0
% for i=1:size(_interval(1,:))(2)
%   a = (_interval(1,i)+_interval(2,i))/2
%   b = _interval(3,i)
%   _grf(1,end+1) = a
%   _grf(2,end) = b
% end
% _grf(1,end+1) = (_interval(1,end)+_interval(2,end))/2
% _grf(2,end) = 0
% plot(_grf(1,:),_grf(2,:),'linewidth', 1,"^-b")
% h = legend("Histogram", "Polygon")
%
% set(h,"fontsize", 20)
% %title "Гистограмма"
% xlabel "Var"; ylabel "Col"
%
% axis tight
% grid('on')
% print('build_pdf/histogramm','-dpdflatex')
%
% hold('off')