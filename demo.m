function [ output_args ] = demo( input_args )
%DEMO �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
clc
close all
addpath(genpath(pwd));
addgen = '.\batchdata2\internet_multi-model_retinal_dataset\'; % ͼ��Դλ��
imageNum = 35;  % ͼ�������
imageScale = 1;  % ���ųߴ�
removeOption = 'MoAG';
str2num
%
% STARE���ݼ� ��5��ͼ���е�rֵʱ����
% inrternet���ݼ� ��10��16
% initialCorr(addgen,imageNum,imageScale,removeOption);
% misMatchRemove(addgen,imageNum,imageScale,removeOption);
% metricCal(addgen,imageNum,removeOption);
% % overlapCalculate(addgen,imageNum);
TP_TN_FP_FN(addgen,imageNum,removeOption);
% ReCall_Precision_Accuracy(addgen,imageNum,dist);
%% �ҳ���rֵ��Ӧ�㼯�Ե�����ֵ
% r=0.1;
% preconte = 0;
% [NUM] = xlsread([addgen 'metric_ursift_contSca.xls'],1);
% block = find(isnan(NUM(:,1)));
% num = size(block,1)/4;
% nums = 1;
% for i=1:imageNum
%     x = NUM((0:num)*18+i,:);
%     [B,I] = sort(x(:,2));
%     value(i,1) = x(I(1),1);
%     value(i,2) = B(1);
%     value(i,3) = x(I(1),3);
%     value(i,4) = I(1);
%     xlswrite([addgen 'finalmetric_contSca.xls'],[value(i,:) i],['A' num2str(i),':E' num2str(i)]);
% end

end

