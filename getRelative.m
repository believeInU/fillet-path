function [angle] = getRelative(angle1,angle2)
%GETRELATIVE Summary of this function goes here
%   Detailed explanation goes here
angle = (angle2 - angle1) / 2;
if (angle < 0)
    angle = angle + pi;
end
end

