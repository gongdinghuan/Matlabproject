a = rand(1,10);%随机生成一组数
fprintf('排序前')
a%未排序前原始数据

n = 10;%数组长度

for j = 1: n-1

    for i= 1:n-1

        if a(i)>a(i+1)

            c = a(i);

            a(i) = a(i+1);

            a(i+1) = c;

        end

    end

end
fprintf('排序后')
a %排序后数组显示