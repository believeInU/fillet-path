function [Xnew,Ynew] = rotate(Xold,Yold,angle)
%ROTATE Summary of this function goes here
%   Detailed explanation goes here
Xnew = Xold * cos(angle) + Yold * sin(angle);
Ynew = -Xold * sin(angle) + Yold * cos(angle);
end

