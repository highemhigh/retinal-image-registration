function [ ] = drawMantiVec( match )
%DRAWMANTIVEC �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

Ymax = max(max([match(:,1) match(:,5)]));
Xmax = max(max([match(:,2) match(:,6)]));
im = ones(Xmax,Ymax)*255;
figure('visible',visible);imshow(im);
hold on;
for i=1:size(match,1)
drawArrow(match(i,1:2),match(i,5:6),'r');
end

end

