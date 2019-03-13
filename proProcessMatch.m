function [ tempMatch, finalMatch ] = proProcessMatch( wholeMatch )
%��ƥ��ĺ���
%��׼��Ľ����ԣ������ڵĵ�����Ӧ��ҲӦ������һ��ͼ������cell����
num = size(wholeMatch,1);
finalIndex = [];
tempIndex = [];
% adjacent cell invariance(ACI)���� (ѡȡ�������������)
for i=1:num
    centerCell1 = wholeMatch(i,3:4);
    centerCell2 = wholeMatch(i,7:8);
    adjPoiInd = adjacentPoint(wholeMatch(:,1:4),centerCell1,i);
    adjIndex = ismember(table([wholeMatch(:,1)],[wholeMatch(:,2)]),table([adjPoiInd(:,1)],[adjPoiInd(:,2)]));% �õ������ڵĵ�����
    totleNum = length(find(adjIndex));
    % ������������
    corrIndex = find(sum((wholeMatch(adjIndex,7:8)-repmat(centerCell2,totleNum,1)).^2,2)<2); 
    
%     % Բ����������
%     sum((wholeMatch(adjIndex,1:2)-repmat(wholeMatch(i,1:2),totleNum,1)).^2,2)
%     corrIndex = find(sum((wholeMatch(adjIndex,5:6)-repmat(wholeMatch(i,1:2),totleNum,1)).^2,2)<100);

    
    
    corrNum = length(corrIndex);
    por = corrNum/totleNum;
    if corrNum > 5  
        tempIndex = [tempIndex;i];
    end
end
for i=1:num
    centerCell1 = wholeMatch(i,3:4);
    centerCell2 = wholeMatch(i,7:8);
    adjPoiInd = adjacentPoint(wholeMatch(:,1:4),centerCell1,i);
    adjIndex = ismember(table([wholeMatch(:,1)],[wholeMatch(:,2)]),table([adjPoiInd(:,1)],[adjPoiInd(:,2)]));% �õ������ڵĵ�����
    totleNum = length(find(adjIndex));
    (centerCell1)/(wholeMatch(adjIndex,3:4)-centerCell1)
    
end
tempMatch = wholeMatch(tempIndex,:);
proNum = size(tempMatch,1);
tempIndex= [];
for i=1:proNum
    centerCell1 = tempMatch(i,3:4);
    centerCell2 = tempMatch(i,7:8);
    adjPoiInd = adjacentPoint(tempMatch(:,1:4),centerCell1,i);
    adjIndex = ismember(table([tempMatch(:,1)],[tempMatch(:,2)]),table([adjPoiInd(:,1)],[adjPoiInd(:,2)]));% �õ������ڵĵ�����
    totleNum = length(find(adjIndex));
    % ������������
    corrIndex = find(sum((tempMatch(adjIndex,7:8)-repmat(centerCell2,totleNum,1)).^2,2)<2); 
%     % Բ����������
%     corrIndex = find(sum((tempMatch(adjIndex,1:2)-repmat(tempMatch(i,1:2),totleNum,1)).^2,2)<100);
    corrNum = length(corrIndex);
    por = corrNum/totleNum;
    if corrNum > 5  
        tempIndex = [tempIndex;i];
    end
end
% tempMatch = tempMatch(tempIndex,:);
% proNum = size(tempMatch,1);
% tempIndex= [];
% for i=1:proNum
%     centerCell1 = tempMatch(i,7:8);
%     centerCell2 = tempMatch(i,3:4);
%     adjPoiInd = adjacentPoint(tempMatch(:,5:8),centerCell1,i);
%     adjIndex = ismember(table([tempMatch(:,5)],[tempMatch(:,6)]),table([adjPoiInd(:,1)],[adjPoiInd(:,2)]));% �õ������ڵĵ�����
%     totleNum = length(find(adjIndex));
%     corrIndex = find(sum((tempMatch(adjIndex,3:4)-repmat(centerCell2,totleNum,1)).^2,2)<2); % ������������
% %     corrIndex = find(sum((tempMatch(adjIndex,5:6)-repmat(tempMatch(i,5:6),totleNum,1)).^2,2)<100); %Բ����������
%     corrNum = length(corrIndex);
%     por = corrNum/totleNum;
%     if corrNum > 5  
%         tempIndex = [tempIndex;i];
%     end
% end
for i=1:proNum
    centerCell1 = tempMatch(i,7:8);
    centerCell2 = tempMatch(i,3:4);
    adjPoiInd = adjacentPoint(tempMatch(:,5:8),centerCell1,i);
    adjIndex = ismember(table([tempMatch(:,5)],[tempMatch(:,6)]),table([adjPoiInd(:,1)],[adjPoiInd(:,2)]));% �õ������ڵĵ�����
    totleNum = length(find(adjIndex));
    corrIndex = find(sum((tempMatch(adjIndex,3:4)-repmat(centerCell2,totleNum,1)).^2,2)<2); % ������������
%     corrIndex = find(sum((tempMatch(adjIndex,5:6)-repmat(tempMatch(i,5:6),totleNum,1)).^2,2)<100); %Բ����������
    corrNum = length(corrIndex);
    por = corrNum/totleNum;
    if corrNum > 5  
        finalIndex = [finalIndex;i];
    end
end
finalMatch = tempMatch(finalIndex,:);

end

