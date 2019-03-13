function [ x1,x2,ind ] = outlierRejectRmse( im1,im2, model,scene, addgen,imageNum )
%OUTLIERREJECTRMSE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
r = rmse(model,scene);
x1 = model;
x2 = scene;
dim = size(model,2);
%% ������������Ĳ���ƥ��ȥ��ֱ����С��6
while r > 6
    t_fundus = cp2tform(x1,x2,'polynomial',2);
    % t_fundus �õ����Ƿ���ƥ��ı任ģ�ͣ��Ǵ�loc2��loc1ת����ϵ��
    x1l = tforminv(t_fundus,x2(:,1:2));
    dist = sum((x1l-x1).^2,2);
    [~,I] = sort((sum(dist,2)),'descend');
    removeIndex = I(1:3,1);
    x1(removeIndex,:) = -ones(3,dim);
    x2(removeIndex,:) = -ones(3,dim);
    chooseIndex = find(x1(:,1)~=-1);
    x1 = x1(chooseIndex,:);
    x2 = x2(chooseIndex,:);
    %     showmatch(im1,im2,x1,x2,0);
    r = rmse(x1,x2);
end
% showmatch(im1,im2,x1,x2,0);
%% ĳ���뱾ͼ�б����������벻�����ڵڶ���ͼ����2����Ķ�Ӧ��ľ���õ�����
num = size(x1,1);
remove = zeros(num,1);
[NUM1] = xlsread([addgen 'groundTruthPoint.xls'],1);
chooseIndex2 = zeros(0,1);
for j=1:15
    xl1(j) =  NUM1((imageNum-1)*17+1+j-1,1);
    yl1(j) =  NUM1((imageNum-1)*17+1+j-1,2);
    xl2(j) =  NUM1((imageNum-1)*17+1+j-1,3);
    yl2(j) =  NUM1((imageNum-1)*17+1+j-1,4);
end
t_fundus = cp2tform([xl1' yl1'],[xl2' yl2'],'polynomial',2);
% t_fundus �õ����Ƿ���ƥ��ı任ģ�ͣ��Ǵ�loc2��loc1ת����ϵ��
transformedIm = tforminv(t_fundus,x2(:,1:2));
for i=1:num
%     abs(sum((repmat(x1(i,:),num,1)-x1).^2,2)...
%         -sum((repmat(transformedIm(i,:),num,1)-transformedIm).^2,2))./sum((repmat(x1(i,:),num,1)-x1).^2,2)
    index =  find(abs(sum((repmat(x1(i,:),num,1)-x1).^2,2)...
        -sum((repmat(transformedIm(i,:),num,1)-transformedIm).^2,2))./sum((repmat(x1(i,:),num,1)-x1).^2,2)>0.3);
    if size(index,1)/num<0.2
        chooseIndex2 = [chooseIndex2 ;i];
    end
end
x1 = x1(chooseIndex2,:);
x2 = x2(chooseIndex2,:);
ind = find(ismember(table([model(:,1)],[model(:,2)],[scene(:,1)],[scene(:,2)]),table([x1(:,1)],[x1(:,2)],[x2(:,1)],[x2(:,2)])));

% showmatch(im1,im2,x1,x2,0);
end

