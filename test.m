
function [ output_args ] = test( input_args )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
clc;
close all;
addpath(genpath(pwd));
imread()
dt = DelaunayTri(x(:),y(:));
k = convexHull(dt);
abs(trapz(dt.X(k,1),dt.X(k,2)))

end
