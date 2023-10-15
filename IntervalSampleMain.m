addpath("./src/functions/Basic/");
addpath("./src/functions/IntervalSampleTable/");

DATA_interval = ISLoadTable("./build_pdf/ans");
disp(DATA_interval);

DATA_grouped = ISInterval2Grouped(DATA_interval);
disp(DATA_grouped);
save "build_pdf/groupedSelection.txt" DATA_grouped

% Метематическое ожидание
expectedValue = BExpectedValue(DATA_grouped);
disp(expectedValue);
save "build_pdf/expectedValue.txt" expectedValue

% Дисперсия
biasedSampleVariance = BBiasedSampleVariance(DATA_grouped, expectedValue);
disp(biasedSampleVariance);
save "build_pdf/biasedSampleVariance.txt" biasedSampleVariance

% Несмещенная дисперсия
unbiasedSampleVariance = BUnbiasedSampleVariance(DATA_grouped, expectedValue);
disp(unbiasedSampleVariance);
save "build_pdf/unbiasedSampleVariance.txt" unbiasedSampleVariance


% График многоугольника распределения
graph = BPolygonProbabilityDistribution(DATA_grouped);
plot(graph(1,:),graph(2,:),'linewidth', 1,'o-r');
title "Polygon Probability Distribution";
xlabel "Var"; ylabel "Col";
axis tight;
grid('on');
print('build_pdf/polygonProbabilityDistribution','-dpdflatex');
hold('off')


% Функция (Эмпирическая функция) распределения
empiricalFunction = BEmpiricalDistributionFunction(DATA_grouped);
disp(empiricalFunction);
save "build_pdf/empiricalFunction.txt" empiricalFunction


% График функции распределения
graphs = BGraphEmpiricalDistributionFunction(empiricalFunction);
disp(graphs);
for i=1:size(graphs(1,:))(2)
  plot([graphs(1,i); graphs(2,i)], [graphs(3,i); graphs(4,i)], 'linewidth',1,'-r');
  plot([graphs(1,i)], [graphs(3,i)], 'linewidth',1,'o-r');
  if([graphs(2,i)] == [graphs(2,end)])
    plot([graphs(2,i)], [graphs(4,i)], 'linewidth',1,'o-r');
  else
    plot([graphs(2,i)], [graphs(4,i)], 'linewidth',1,'|-r');
  endif
  hold('on')
end
title "Graph Empirical Distribution Function";
xlabel "Var"; ylabel "Col";
axis tight;
grid('on');
print('build_pdf/graphEmpiricalDistributionFunction','-dpdflatex');
hold('off');
clf;

% гистограмма
%graph = BGraphHistogram(DATA_grouped);
graph = DATA_interval;
disp(graph);
hold('on')
for i=1:size(graph(1,:))(2)
  plot([graph(1,i); graph(1,i)], [0; graph(3,i)], 'linewidth',1,'-r');
  plot([graph(1,i); graph(2,i)], [graph(3,i); graph(3,i)], 'linewidth',1,'-r');
  plot([graph(2,i); graph(2,i)], [graph(3,i); 0], 'linewidth',1,'-r');
end

graph = BGraphPolygon(DATA_interval);
disp(graph);
plot(graph(1,:), graph(2,:), 'linewidth',1,'o-b');
title "Graph Histogram and Polygon";
xlabel "Var"; ylabel "Col";
axis tight;
grid('on');
print('build_pdf/graphHistogramAndPolygon','-dpdflatex');
hold('off');
clf;
