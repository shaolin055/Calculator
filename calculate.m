function ret=calculate(a)
%clc
%clear all
%a='+160';
%a
s=[0 0 0 0];
jud=1;
num1='';
num2='';
a1='';

k=1;
l=1;
m=1;
n=1;
pass=1;
str=0; % for writting  /+-
str1=1; % for operate one sign per itteration

len=length(a);
for i=1:len
    if a(i)=='+'
        s(1)=s(1)+1;
    elseif a(i)=='-'
        s(2)=s(2)+1;
    elseif a(i)=='*'
        s(3)=s(3)+1;
    elseif a(i)=='/'
        s(4)=s(4)+1;
    end    
end
%%          function
a=func(a);
%%          divition
a;
len=length(a);
for i=1:s(4)
    for j=1:len
        if k==len+1
            break;
        end
        
        if a(k)=='/'
            if isempty(num1)
                sprintf('Error occured')
            end
            if str1==0
            else
                str1=0;
                pass=2;
                k=k+1;
            end
        end
        
        r=sign_(a(k));
        
        if pass==1
            if r~=0&&r~=5&&k==1
                num1(l)=a(k);
                sprintf('%s',num1);
                l=l+1;
                k=k+1;
                continue;
            end
            if r~=0&&r~=5&&a(k-1)~='e'
                if a(k-1)=='e'
                    if r==3||r==4
                        sprintf('Error occured')
                    end
                end
                a1=strcat(a1,num1);
                leng=length(a1);
                a1(leng+1)=a(k);
                num1='';
                l=1;
                %k=k+1;
            else
                num1(l)=a(k);
                sprintf('%s',num1);
                l=l+1;
            end
        end
        
        if pass==2
            if r<5&&r>0
                if a(k-1)=='e'
                    str=1;
                end
                if (isempty(num2)||str==1)&&(r==1||r==2)
                    num2(m)=a(k);
                    sprintf('%s',num2);
                    m=m+1;
                    str=1;
                elseif (isempty(num2)||str==1)&&(r~=1||r~=2)
                    sprintf('Error ocoured. Type: sign displaced')
                    jud=0;
                elseif str==1&&(r~=1||r~=2)
                    sprintf('Error ocoured')
                    jud=0;
                else
                r=calc(num1,'/',num2);
                a1=strcat(a1,r);
                leng=length(a1);
                n=leng+1;
                pass=3;
                m=1;
                end
            else
                num2(m)=a(k);
                sprintf('%s',num2);
                m=m+1;
                str=0;
            end
        end
        if pass==3
            a1(n)=a(k);
            n=n+1;
        end
        if pass==2&&k==len
            r=calc(num1,'/',num2);
            a1=strcat(a1,r);
        end
        k=k+1;
    end
    a=a1;
    a1='';
    num1='';
    num2='';
    k=1;
    l=1;
    m=1;
    n=1;
    pass=1;
    str1=1;
    len=length(a);
end
%%                          Multiplication
a;
for i=1:s(3)
    for j=1:len
        if k==len+1
            break;
        end
        
        if a(k)=='*'
            if isempty(num1)
                sprintf('Error occured')
            end
            if str1==0
            else
                str=0;
                str1=0;
                pass=2;
                k=k+1;
            end
        end
        
        r=sign_(a(k));
        
        if pass==1
            if r~=0&&r~=5&&k==1
                num1(l)=a(k);
                sprintf('%s',num1);
                l=l+1;
                k=k+1;
                continue;
            end
            if r~=0&&r~=5&&a(k-1)~='e'
                if a(k-1)=='e'
                    if r==3||r==4
                        sprintf('Error occured')
                    end
                end
                a1=strcat(a1,num1);
                leng=length(a1);
                a1(leng+1)=a(k);
                num1='';
                l=1;
                %k=k+1;
            else
                num1(l)=a(k);
                sprintf('%s',num1);
                l=l+1;
            end
        end
        
        if pass==2
            if r<5&&r>0
                if a(k-1)=='e'
                    str=1;
                end
                if (isempty(num2)||str==1)&&(r==1||r==2)
                    num2(m)=a(k);
                    sprintf('%s',num2);
                    m=m+1;
                    str=1;
                elseif (isempty(num2)||str==1)&&(r~=1||r~=2)
                    sprintf('Error ocoured. Type: sign displaced')
                    jud=0;
                elseif str==1&&(r~=1||r~=2)
                    sprintf('Error ocoured')
                    jud=0;
                else
                r=calc(num1,'*',num2);
                a1=strcat(a1,r);
                leng=length(a1);
                n=leng+1;
                pass=3;
                m=1;
                end
            else
                num2(m)=a(k);
                sprintf('%s',num2);
                m=m+1;
                str=0;
            end
        end
        if pass==3
            a1(n)=a(k);
            n=n+1;
        end
        if pass==2&&k==len
            r=calc(num1,'*',num2);
            a1=strcat(a1,r);
        end
        k=k+1;
    end
    a=a1;
    a1='';
    num1='';
    num2='';
    k=1;
    l=1;
    m=1;
    n=1;
    pass=1;
    str1=1;
    len=length(a);
end
%%                      Substraction & Addition
a;
s(1)=0;
s(2)=0;
for i=1:len
    if a(i)=='+'
        s(1)=s(1)+1;
    elseif a(i)=='-'
        s(2)=s(2)+1;
    end    
end
str=0;
if s(1)>0||s(2)>0
    for i=1:len
        if k==len+1
            break;
        end
        r=sign_(a(k));
        if str==1&&(r==1||r==2)        
            if r==1
                a1(n-1)=a(k-1);
            end
            if r==2
                if a(k-1)=='-';
                    a1(n-1)='+';
                else
                    a1(n-1)='-';
                end
            end
            str=2;
            k=k+1;
            continue;
        end
        if str==2&&(r==1||r==2)
            if r==1
                a1(n-1)=a1(n-1);
            end
            if r==2
                if a1(n-1)=='-';
                    a1(n-1)='+';
                else
                    a1(n-1)='-';
                end
            end
            k=k+1;
            continue;
        end
        if r==1||r==2
            str=1;
        else
            str=0;
        end
        a1(n)=a(k);
        n=n+1;
        k=k+1;
    end
    a=a1;
    n=1;
    k=1;
    pass=1;
    len=length(a);
    for j=1:len
        if k==len+1
            break;
        end
        r=sign_(a(k));
        if r==1||r==2
            if k==1
            elseif a(k-1)=='e'
            elseif pass==2
                num1=calc(num1,x,num2);
                l=1;
                num2='';
                x=a(k);
                pass=2;
                k=k+1;
            elseif pass==1
                pass=2;
                l=1;
                x=a(k);
                k=k+1;
            end
        end
        if pass==1
            num1(l)=a(k);
            l=l+1;
        end
        if pass==2
            num2(l)=a(k);
            l=l+1;
        end
        if k==len&&~isempty(num2)
            num1=calc(num1,x,num2);
        end
        k=k+1;
    end
    a=num1;
end
num=str2num(a);
if sign(num)==1
    ret=[1 num 1];
elseif sign(num)==-1
    ret=[2 abs(num) 1];
end