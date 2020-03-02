clc;

x = [7, 2 ,3; 
    1, 3, 5; 
    5, 6 ,7];


[m, n] = size(x);
minData = x(1,1);
minX = 1;
minY = 1;

for i = 1:m
    for j = 1:n
        %ÕÒ×îÐ¡Öµ
        if x(i,j) < minData
            minData = x(i,j);
            minX = i;
            minY = j;
        end
    end
end

x_r = reshape(x, 1, m*n);
x_r = sort(x_r);
mid = 0;

if mod(m*n, 2) == 0
    mid = x_r(m*n/2);
else
    mid = x_r(floor(m*n/2) + 1)
end
x(minX, minY) = mid;
disp(x)