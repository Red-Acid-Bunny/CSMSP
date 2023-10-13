function res = SCLoadTable(file_name)
  res = [];
  file = fopen(file_name, 'rt');
  N = fscanf(file, '%d', 1);
  
  for i=1:N
    res(end+1) = fscanf(file,'%g',1);
  end
  fclose(file);
