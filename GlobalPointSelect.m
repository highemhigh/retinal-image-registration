function [ feaFinal ] = GlobalPointSelect( feaLocatMatrix, minDisPiexl )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
feaNum = size(feaLocatMatrix,2);
% finalLocat(:,1) = feaLocatMatrix(:,1);
neighborPoint = zeros(1,feaNum);
num = 1;
%% ��ȡȫ���ڽ��㼯
for i=1:feaNum
    distan = feaLocatMatrix(1:2,:) - repmat(feaLocatMatrix(1:2,i),[1 feaNum]);
    eudDistan = sum(distan.*distan);
    I = find(eudDistan<=minDisPiexl);
    index = find(neighborPoint(I));
    % ���ﻹ�����δ�������
    if ~isempty(index)
        kind = unique(neighborPoint(I(index)));
        if length(kind) ~= 1
            [~,Is] = sort(kind);
            nums = kind(Is(end));
            neighborPoint(find(neighborPoint == kind(Is(1:end-1)))) = nums;
            neighborPoint(I) = nums;
        else
            neighborPoint(I) = kind;
        end
    else
        if length(I) >= 2
            neighborPoint(I) = num;
            num = num+1;
        end
    end
end
num = num-1;

if num == 0
    feaFinal = feaLocatMatrix;
    return ;
end
%% �ڽ�ȫ�ֵ㼯�ڵ��ѡ��
for i=1:num
    index = find(neighborPoint == i);
    if ~isempty(index)
        closeNum = length(index);
        feaLocatMatrix(:,index);
        feaEntroy = feaLocatMatrix(3,index);
        feaContrast = feaLocatMatrix(4,index);
        layNum = feaLocatMatrix(6,index);
        cellNum = feaLocatMatrix(5,index);
        % ��һ��
        minfeaEntroy = min(feaEntroy(:));
        minfeaContrast = min(feaContrast(:));
        feaEntroy = (feaEntroy-minfeaEntroy)/(max(feaEntroy(:))-minfeaEntroy);
        feaContrast = (feaContrast-minfeaContrast)/(max(feaContrast(:))-minfeaContrast);
        %    layNum = transpose(mapminmax(layNum',ps));
        %    cellNum = transpose(mapminmax(cellNum',ps));
        % ѡ���׼ ϵ������A
        w1 = 0.2;
        w2 = 0.8;
        A = [w1;w2];
        param = [feaEntroy' feaContrast'];
        goal = param.*param*A;
        [~,ind] = sort(goal);
        feaChoose = index(ind(round(closeNum/2)));
        neighborPoint(index) = -1;
        neighborPoint(feaChoose) = 0;
    end
end
feaFinal = feaLocatMatrix(:,find(neighborPoint==0));
feaFinal = GlobalPointSelect(feaFinal,minDisPiexl);
end

