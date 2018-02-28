function [angle] = getAngle(x0,y0,x1,y1)
%GETANGLE Summary of this function goes here
%   Detailed explanation goes here
dy = y1 -y0;
dx = x1 -x0;
if (dx == 0)
    if (dy < 0)
        angle = -pi / 2;
    else
        angle = pi / 2;
    end
else
    angle = atan(dy/dx);
end
if (dx < 0) 
    angle = angle + pi;
end
if (angle < 0)
    angle = angle + 2 * pi;
end

end

