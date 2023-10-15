function res = BBiasedSampleVariance(grouped, expectedValue)
  res = 0;
  N = size(grouped(1,:))(2);
  
  for i=1:N
    res = res + ((grouped(1,i) - expectedValue)^2)*grouped(2,i);
  end
  res = res/sum(grouped(2,:));
