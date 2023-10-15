function grouped = ISInterval2Grouped(interval)
  grouped = [;];
  N = size(interval(1,:))(2);
  
  for i=1:N
    grouped(1,end+1) = (interval(1,i)+interval(2,i))/2;
    grouped(2,end) = interval(3,i);
  end
