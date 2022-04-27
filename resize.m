function ret=resize()
clc
clear all
format long
a='-1(6+cos(5)(3+4+89(2))sin(6)*exp(7))';
sprintf('%s',a)
len=length(a);
jud=1;
n1=1;
j=0;
k=0;
l=0;
%p=1;
a1='';
a2='';
for i=1:len
    if a(i)=='('
        j=j+1;
    end
    if a(i)==')'
        k=k+1;
    end
end

if j~=k
    if abs(j-k)==1
        sprintf('Math error: 1 parenthesis is missing')
    else
        sprintf('Math error: At least %d parenthesis are missing',abs(j-k))
    end
    jud=0;
end



a1(1)=a(1);
p=2;
for i=2:len-1
    if a(i)=='('
        if sign_(a(i-1))==5&&a(i-1)~='('&&i~=1
            a1(p)='*';            
            p=p+1;            
        end
    elseif a(i)==')'
        if (sign_(a(i+1))==5||sign_(a(i+1))==0)&&a(i+1)~=')'
            a1(p)=a(i);
            a1(p+1)='*';
            p=p+2;
        else
            a1(p)=a(i);
            p=p+1;
        end
        continue;       
    end
    a1(p)=a(i);
    p=p+1;
end
a1(p)=a(len);



a=a1;
sprintf('Extended form: %s',a)
len=length(a);
a1='';
p=1;
for i=1:j
    if jud==0
        break;
    end
    
    for n=1:len
        if n1==len+1
            break;
        end       
        if a(n1)=='('
            
            %n1=n1+1;
            l=l+1;
        end
        if l==k
            k=k-1;
            n1=n1+1;
            for m=1:len                     
                if a(n1)==')'
                    %a2;
                    r=calculate(a2);
                    if r(3)==0
                        sprintf('MATH error')
                        jud=0;
                    end
                    %a1(p+1)=ret(1);
                    if r(1)==1
                        a1(p)='+';
                    else
                        a1(p)='-';
                    end
                    hlp=num2str(r(2));                   
                    a1=strcat(a1,hlp);
                    p=length(a1);
                    p=p+1;
                    n1=n1+1;
                    
                    %a2='';
                    break;
                end
                a2(m)=a(n1);
                n1=n1+1;
            end
        end
        
        if n1==len+1
            break;
        end       
        
        a1(p)=a(n1);
        p=p+1;
        n1=n1+1;
    end
    a=a1;
    a1='';
    a2='';
    n1=1;
    l=0;
    p=1;
    len=length(a);
end
r=calculate(a);
if r(3)==0||jud==0
    sprintf('MATH error')
    ret=[];
elseif r(1)==1
    ret=r(2);
else
    ret=-r(2);
end