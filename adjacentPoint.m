function [ pointIndex ] = adjacentPoint(pointSet, cell, index )
% ���ܣ���wholeMatch��Ѱ���Ը�cellΪ���ĵ��ڽ�cell�ڵĵ�
% pointSet 1:2ά�ǵ��ά���꣬3:4ά�Ƕ�Ӧcell����
pointIndex = [];
set = pointSet;
set(index,:) = [];
for i=-1:1
    for j=-1:1       
        indexS = set(:,3:4)==[cell(1)+i cell(2)+j];
        pointIndex = [pointIndex;set(indexS(:,2),1:2)];
    end
end

end

