function  image  = removeOutImage( img, msk, showImage)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
image = img;
    ind = find(msk==0);
    if showImage
        image(ind)=0;
        figure;
        imshow(image);
        title('Ԥ�����ͨ��mask��ȡ��ͼ')
    end
end

