function [ output_args ] = lineChart( input_args )
%TEST2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


clc;
close all
addgen = '.\batchdata2\FIRE\Images\A�˵�����ĤͼƬ\';
[NUM] = xlsread([addgen 'rͨ���˻���ά0.93�Ħ����иı�\metric_ursift.xls'],1);
block = find(isnan(NUM(:,1)));
num = size(block,1)/4;
figure();hold on
a = 1:num+1;
% for i = 1:14
%    (0:num)*18+i
%    x=NUM((0:num)*18++i,:);
%    plot(a,x,'k-o'); 
% end
hold off
end

