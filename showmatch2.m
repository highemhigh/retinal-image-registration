function [ output_args ] = showmatch2( I1,loc1,imageNum,top_folder,oct,lay)
% r �ǶԳƸ�˹����
h =  figure('visible','off');
imshow(I1,[])
hold on

for i=1:size(loc1,1)
    plot(loc1(i,1),loc1(i,2),'g.');
    plot(loc1(i,1),loc1(i,2),'go');
end
hold off
saveas(h,['E:\ѧϰ\ur-siftʵ��\ur-sift\paper\layer-wise_matching_fig\' num2str(imageNum)  ' oct_' num2str(oct) ' lay_' num2str(lay)  '.bmp']);

end