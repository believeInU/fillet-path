function [x,y] = getPoints(Xpoints,Ypoints,r,step)
%GETPOINTS Summary of this function goes here
%   Detailed explanation goes here
x = (Xpoints(1));
y = (Ypoints(1));
for i = 2:length(Xpoints)-1
    b = getAngle(Xpoints(i),Ypoints(i),Xpoints(i-1),Ypoints(i-1));
    c = getAngle(Xpoints(i),Ypoints(i),Xpoints(i+1),Ypoints(i+1));
    a = getRelative(b,c);
    if (a == pi/2)
        continue;
    end
    isRight = a < pi/2;
    if(isRight)
        startAngle = pi/2 + a;
        endAngle = 3 *pi/2 - a;
    else
        startAngle = pi/2 - a;
        endAngle = -pi/2 + a;
    end
    for angle = startAngle:step:endAngle
        if (isRight)
            Xtmp = r / sin(a) + r * cos(angle);
        else
            Xtmp = - r / sin(a) + r * cos(angle);
        end
        Ytmp = r * sin(angle);
        [Xtmp,Ytmp] = rotate(Xtmp,Ytmp,-a-b);
        x(length(x)+1) = Xpoints(i) + Xtmp;
        y(length(y)+1) = Ypoints(i) + Ytmp;
    end
    if (isRight)
        Xtmp = r / sin(a) + r * cos(angle);
    else
        Xtmp = - r / sin(a) + r * cos(angle);
    end
        Ytmp = r * sin(angle);
    [Xtmp,Ytmp] = rotate(Xtmp,Ytmp,-a-b);
    if (x(length(x)) ~= Xpoints(i) + Xtmp && y(length(y)) ~= Ypoints(i) + Ytmp)
        x(length(x)+1) = Xpoints(i) + Xtmp;
        y(length(y)+1) = Ypoints(i) + Ytmp;
    end
end
x(length(x)+1) = Xpoints(length(Xpoints));
y(length(y)+1) = Ypoints(length(Ypoints));
end

