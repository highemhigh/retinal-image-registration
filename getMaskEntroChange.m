function [ mask ] = getMaskEntroChange( weigh, imSize )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
figure();
preMask =zeros(imSize);
entroPre = 0;
entroBefoPre = 0;

for j=0:20:255
    mask = zeros(imSize);
    num=0;
    % �����г����ص���ֵ���м��㣬����ֵ��������
    for i=1:BlockIndexNum
        ind = find(lab==i);
        if length(ind)>1
            num = num+1;
            if weigh(num)>j
                mask(ind) = weigh(num);
            end
        end
    end
    imshow(uint8(mask));
    inds = find(mask);
    entroNow = entropy(uint8(im(inds)));
    entroIm =  entropy(uint8(im));
    %% �̶���������
    %         if entroNow > entroIm
    %             num=num+1;
    %             if num==9
    %                 break;
    %             end
    %         else
    %             num=0;
    %         end
    %% ͻ���
    if sign(entroNow-entroPre)==sign(entroBefoPre-entroPre) && entroNow-entroPre~=0
        break;
    else
        preMask = mask;
    end
    figure();imshow(uint8(mask));
    entroBefoPre = entroPre;
    entroPre = entroNow;
end
h=figure('visible','off');
imshow(uint8(mask));

%
%  saveas(h,['E:\ѧϰ\ur-sift(1)\ur-sift\SlicMask\' num2str(imageNum) '.bmp']);
% %  close(h)

end

