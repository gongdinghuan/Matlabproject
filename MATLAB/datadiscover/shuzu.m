a = rand(1,10);%�������һ����
fprintf('����ǰ')
a%δ����ǰԭʼ����

n = 10;%���鳤��

for j = 1: n-1

    for i= 1:n-1

        if a(i)>a(i+1)

            c = a(i);

            a(i) = a(i+1);

            a(i+1) = c;

        end

    end

end
fprintf('�����')
a %�����������ʾ