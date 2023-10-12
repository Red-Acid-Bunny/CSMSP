fileName = "ans"
file = fopen(fileName, 'rt')

N = fscanf(file,'%d',1)

DATA = []

for i=1:N
  DATA(i) = fscanf(file,'%g',1)
end
fclose(file)
%DATA = [1,2,3,4,5]

res = [;]

sortDATA = sort(DATA)
sizeDATA = size(sortDATA)(2)
currentColumn = 1
lastVar = -1 + sortDATA(1)
for i=1:sizeDATA
  currentVar=sortDATA(i)
  if currentVar == lastVar
    continue
  endif
  lastVar = currentVar
  temp = sortDATA == currentVar
  colCurrentVar = sum(temp)
  res(1, currentColumn) = currentVar
  res(2, currentColumn) = colCurrentVar
  currentColumn = currentColumn + 1
end

% Мат Ожидание X = SUM_i^k(res(1,i)*res(2,i))/sizeDATA, где k - кол столбцов в res
X = 0
colColumn = size(res)(2)
for i=1:colColumn
  X = X + res(1,i)*res(2,i)
end
X = X/sum(res(2,:))
save "X.txt" X
% Дисперсия
S = 0
colColumn = size(res)(2)
for i=1:colColumn
  S = S + ((res(1,i) - X)^2)*res(2,i)
end
S = S/sum(res(2,:))
save "S.txt" S
% Исправленная дисперсия
_S = 0
colColumn = size(res)(2)
for i=1:colColumn
  _S = _S + ((res(1,i) - X)^2)*res(2,i)
end
_S = _S/(sum(res(2,:))-1)
save "_S.txt" _S


% Графики
%-- Многоугольник распределения
%x = []
%y = []
%for i=1:size(res)(2)
%  x(i) = res(1,i)
%  y(i) = res(2,i)
%end

grf = []
grf(1,1) = min(res(1,:))
grf(2,1) = 0
for i=1:size(res)(2)
  grf(1,i+1) = res(1,i)
  grf(2,i+1) = res(2,i)
end
grf(1,size(grf)(2)+1) = max(res(1,:))
grf(2,size(grf)(2)) = 0
a1 = (int32(0) + max(res(1,:))-min(res(1,:)))/10
a2 = (int32(0) + max(res(2,:))-min(res(2,:)))/10


% Вывод данных
disp('Сортированный массив элементов');disp(res);
disp('Мат. Ожидание = ');disp(X);
disp('Дисперсия = ');disp(S);
disp('Исправленная дисперсия = ');disp(_S);
save "textfile.txt" interval

plot(grf(1,:),grf(2,:),'linewidth', 1,'o-r')
%title "Многоугольник распределения"
xlabel "Var"; ylabel "Col"

axis tight
grid('on')
print('MnogoUgolnik','-dpdflatex')


% Эмпирическая ф
% res((1,:)) - все значения
% Интервальная выборка
interval = [;;]
interval(1,1) = -inf
interval(2,1) = res(1,1)
interval(3,1) = 0
interval(4,end) = sizeDATA


for i=2:size(res)(2)
  interval(1,i) = res(1,i-1)
  interval(2,i) = res(1,i)
  interval(3,i) = (sum(res(2,1:i))-1)
  interval(4,i) = sizeDATA

end

interval(1,end+1) = res(1,size(res)(2))
interval(2,end) = inf
interval(3,end) = (sum(res(2,:)))
interval(4,end) = sizeDATA

save "foo.txt" interval
save "raspr.txt" res


size_grf = (interval(1,end) - interval(2,1))/3
interval(1,1) = interval(1,2) - size_grf
interval(2,end) = interval(1,end) + size_grf

for i=1:size(interval(1,:))(2)
  _grf = []
  a = [interval(1,i),interval(2,i)]
  b = interval(3,i)/interval(4,i)
  for j=1:size(a)(2)
    _grf(1,j) = a(j)
    _grf(2,j) = b
  endfor
  plot(_grf(1,:),_grf(2,:),'linewidth', 1,"-r")
  hold('on')
  if _grf(1,1) != interval(1,1)
    plot(_grf(1,1),_grf(2,1),'linewidth', 1,"or")
  endif
  if _grf(1,2) != interval(2,end)
    plot(_grf(1,2),_grf(2,2),'linewidth', 1,"|-r")
  endif

end
%title "График функции"
xlabel "Var"; ylabel "Col"

axis tight
grid('on')
print('fooGrf','-dpdflatex')

hold('off')

% гистограмма
_interval = [;;]
for i=1:size(res)(2)-1
  _interval(1,i) = res(1,i)
  _interval(2,i) = res(1,i+1)
  _interval(3,i) = res(2,i)
endfor
_grf = []
for i=1:size(_interval(1,:))(2)
  a = [_interval(1,i),_interval(2,i)]
  b = _interval(3,i)
  _grf(1,end+1) = a(1)
  _grf(2,end) = 0
  for j=1:size(a)(2)
    _grf(1,end+1) = a(j)
    _grf(2,end) = b
  endfor
  _grf(1,end+1) = a(2)
  _grf(2,end) = 0
end
plot(_grf(1,:),_grf(2,:),'linewidth', 1,"-r")
hold('on')
_grf = []
_grf(1,end+1) = (_interval(1,1)+_interval(2,1))/2
_grf(2,end) = 0
for i=1:size(_interval(1,:))(2)
  a = (_interval(1,i)+_interval(2,i))/2
  b = _interval(3,i)
  _grf(1,end+1) = a
  _grf(2,end) = b
end
_grf(1,end+1) = (_interval(1,end)+_interval(2,end))/2
_grf(2,end) = 0
plot(_grf(1,:),_grf(2,:),'linewidth', 1,"^-b")
h = legend("Гистограмма", "Полигон")

set(h,"fontsize", 20)
%title "Гистограмма"
xlabel "Var"; ylabel "Col"

axis tight
grid('on')
print('histogramm','-dpdflatex')

hold('off')

