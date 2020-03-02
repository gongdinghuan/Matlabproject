function  [output]=NLmeansfilter(input,t,f,h)                
[m n]=size(input); 
%f:������뾶��t:���ƿ�뾶��h:�˲�Ƶ�ʰٷֱ�
Output=zeros(m,n);
input2 = padarray(input,[f f],'symmetric');              
 %����Ե�Գ��۵���ȥ  
 % f :�ӿ�Ŀ��ֵ
 kernel = make_kernel(f);                              %����õ�һ����˹�ˣ����ں����ļ���
 kernel = kernel / sum(sum(kernel));             %sum���Ծ���k��ÿһ����ͣ�k��ʾ����k���ܺ�
 h=h*h;
 for i=1:m
 for j=1:n
         i1 = i+ f;
         j1 = j+ f;      
         W1= input2(i1-f:i1+f , j1-f:j1+f);     
         wmax=0; 
         average=0;
         sweight=0;
         rmin = max(i1-t,f+1);      %ȷ�����ƿ�ı߳�����ʵ�����ڴ������ݵ�ʱ�������������ͱ߽��߳��Ĵ�С��ϵ���Ͳ����������Сֵ��
         rmax = min(i1+t,m+f);      %�����Ҫ�ǿ��Ʋ���������ֵ
         smin = max(j1-t,f+1);
         smax = min(j1+t,n+f);
         for r=rmin:1:rmax
         for s=smin:1:smax                 
                if(r==i1 && s==j1) continue; end;      
                W2= input2(r-f:r+f , s-f:s+f);                
                d = sum(sum(kernel.*(W1-W2).*(W1-W2)));
                w=exp(-d/h);                 
                if w>wmax      
                   wmax=w;                   
                end
                sweight = sweight + w;
                average = average + w*input2(r,s);                                  
         end 
         end
        average = average + wmax*input2(i1,j1);
        sweight = sweight + wmax;       
        if sweight > 0
            output(i,j) = average / sweight;
        else
            output(i,j) = input(i,j);
        end                
 end
 end    
 
 
 
 function [kernel] = make_kernel(f)            %����һ����˹��   
kernel=zeros(2*f+1,2*f+1);   
for d=1:f    
  value= 1 / (2*d+1)^2 ;    
  for i=-d:d
  for j=-d:d
    kernel(f+1-i,f+1-j)= kernel(f+1-i,f+1-j) + value ;
  end
  end
end
kernel = kernel ./ f;    


