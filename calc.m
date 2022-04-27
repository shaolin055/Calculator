function ret=calc(num1,x,num2)
if strcmp(x,'--')
    if strcmp(num1,'exp')
        ret=exp(str2num(num2));
    elseif strcmp(num1,'log')
        ret=log10(str2num(num2));
    elseif strcmp(num1,'ln')
        ret=log(str2num(num2));
    elseif strcmp(num1,'sin')
        ret=sin(str2num(num2));
    elseif strcmp(num1,'sind')
        ret=sin(str2num(num2)/180*pi);
    elseif strcmp(num1,'cos')
        ret=cos(str2num(num2));
    elseif strcmp(num1,'cosd')
        ret=cos(str2num(num2)/180*pi);
    elseif strcmp(num1,'tan')
        ret=tan(str2num(num2));
    elseif strcmp(num1,'tand')
        ret=sin(str2num(num2)/180*pi);
    elseif strcmp(num1,'sec')
        ret=sec(str2num(num2));
    elseif strcmp(num1,'secd')
        ret=sin(str2num(num2)/180*pi);
        
    end
else
    a=str2num(num1);
    b=str2num(num2);
    if x=='/'
        c=a/b;        
    elseif x=='*'
        c=a*b;
    elseif x=='-'
        c=a-b;
    elseif x=='+'
        c=a+b;
    end
    ret=num2str(c);
end

