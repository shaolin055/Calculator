function ret=sign_(a)
if a=='+'
    ret=1;
elseif a=='-'
    ret=2;
elseif a=='*'
    ret=3;
elseif a=='/'
    ret=4;
elseif a<='9'&&a>='0'
    ret=5;
else
    ret=0;
end