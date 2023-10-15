function res = ISLoadTable(file_name)
  res = [;;];
  file = fopen(file_name, 'rt');
  temp_N = fscanf(file, '%d', 1);
  N = ceil(temp_N/3);
  
  for i=1:N
    res(1,end+1) = fscanf(file,'%g',1);
    res(2,end) = fscanf(file,'%g',1);
    res(3,end) = fscanf(file,'%g',1);
  end
  fclose(file);
