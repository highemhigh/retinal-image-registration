function [ msk ] = get_msk( imageName, imageNum )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
image = imread(imageName);



if ndims(image)>2
    imageGreen = image(:,:,2);
    imageRed = image(:,:,1);
else
    imageGreen = image;
    imageRed = image;
end
%ͼ��Ԥ����
%         imageRed = double(imageRed);
        imagered = imageRed/max(imageRed(:))*255;
%         imEdge = edge(imagered,'Canny',0.03);
% %         figure;imshow(imEdge);
%         imEdge=double(imEdge);
%         imEdge(imEdge==1)=255;
            
            
%            [msk,~] = rr_msk(imagered,30);
%%
% if 1
%             h=figure;
%             imshow(msk);
%             title('mask');
%         end
%         keyIndex =1;
%         saveas(h,['E:\ѧϰ\ur-sift(1)\ur-sift\mskImage\' num2str(imageNum) '.bmp']);
end
% function roi = getROI(image,center)
% 
% end
