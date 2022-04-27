function ret=compress(a)
a1='';
k=1;
n=1;
str=0;
len=length(a);
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
ret=a1;