function ret=func(a)
%clc
%clear all
%a='60-+9e-3*2*5/82*log8'

num1='';
num2='';
a1='';
k=1;
l=1;
m=1;
pass=1;
len=length(a);
for i=1:len*2
    if k==len+1
        break;
    end
    r=sign_(a(k));
    if pass==1
        if r==0&&a(k)~='.'
            if a(k)=='e'&&sign_(a(k+1)==0)
                pass=2;
            else pass=2;
            end
        else 
            a1(l)=a(k);
            l=l+1;
        end        
    end
    if pass==2
        if r~=0
            if r~=5&&r>2
                sprintf('Error occured')
            end
            m=1;
            pass=3;
        else
            num1(m)=a(k);
            m=m+1;
        end        
    end
    if pass==3
        if r~=5&&~(isempty(num2)&&(r<3))
            res=num2str(calc(num1,'--',num2));
            a1=strcat(a1,res);
            leng=length(a1);
            l=leng+1;
            pass=1;
            num1='';
            num2='';
            m=1;
            k=k-1;
        else
            num2(m)=a(k);
            m=m+1;
        end        
        if k==len
            res=num2str(calc(num1,'--',num2));
            a1=strcat(a1,res);
        end
    end
    
    k=k+1;
end
ret=a1;