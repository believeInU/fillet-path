function [v,r,b] = velocits(l,a,D,acc,dec,g,u,Vmax,Vstart,Vend)
%VELOCITS find the top velocits in a path
%   Detailed explanation goes here
v(length(l)+1) = Vend;
v(1) = Vstart;
v(2:length(l)) = Vmax;
r(1:length(a)) = 0;
b(1:length(l)+1) = 0;
for i = 2:length(l)
    if (v(i) > sqrt(g * u * D * sin(a(i-1))))
        v(i) = sqrt(g * u * D * sin(a(i-1)));
        b(i) = 1;
    end
    if (v(length(l)+2-i) > sqrt(g * u * D * sin(a(length(l)+2-i-1))))
        v(length(l)+2-i) = sqrt(g * u * D * sin(a(length(l)+2-i-1)));
        b(length(l)+2-i) = 1;
    end
    
    if (i == 2)
        top = v(i-1)^2 + 2 * acc * l(i-1);
    else
        top = v(i-1)^2 + 2 * acc * (l(i-1) - (v(i-1)^2) / (g * u * tan(a(i-2))));
    end
    bottom = 1 + (2 * acc) / (g * u * tan(a(i-1)));
   
    max1 = sqrt(top / bottom);
    if (v(i) > max1)
        v(i) = max1;
        b(i) = 2;
    end
    
    if (length(l)+2-i == length(l))
        top = v(length(l)+3-i)^2 + 2 * dec * l(length(l)+2-i);
    else
        top = v(length(l)+3-i)^2 + 2 * dec * (l(length(l)+2-i) - (v(length(l)+3-i)^2) / (g * u * tan(a(length(l)+2-i))));
    end
    bottom = 1 + (2 * dec) / (g * u * tan(a(length(l)+2-i-1)));

    max2 = sqrt(top / bottom);
    if (v(length(l)+2-i) > max2)
        v(length(l)+2-i) = max2;
        b(length(l)+2-i) = 3;
    end
    disp([max1,max2])
end
for i = 1:(length(v)-2)
    r(i) = v(i+1)^2 / (g * u);
end
end

