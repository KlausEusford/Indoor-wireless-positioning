function [D] = distance(scr,dst)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
D = 0;
if length(scr)~=2
    return ;
end
if length(dst)~=2
    return ;
end
D=sqrt((scr(1)-dst(1))^2+(scr(2)-dst(2))^2);
end

