function imagePreTreat = local_phase( image,mask )
global IMAGEGAMMA;
IMAGEGAMMA = 0.5;

%% show image
if ndims(image)>2
    image = double(image(:,:,2));
else
    image = double(image);
end
figure, imshow(image, []);
[row,column] = size(image);
%% Load filters
load E:\ѧϰ\ur-sift(1)\ur-sift\local-phase\2D\Filtering\filters;

%% Filter across all scales
num_scales = 3;
q = cell(1,num_scales);
im = image;
offset = [0 0];
for scale = 1:num_scales
    F = filter_quadrature(im, filter_kernels);

    F = correct_phase(F, filter_directions);
    
    q{scale} = zeros(size(F{1}));
    for i=1:length(F), q{scale} = q{scale} + F{i}; end
    q{scale} = upsample(q{scale}, size(image), offset, 2^(scale-1));

    [im,offset_local] = downsample(im);
    offset = offset + 2^(scale-1) .* offset_local;
end
% axis image: Use the same length for the data units along each axis and fit the axes box tightly around the data.
% ÿ��������ĵ�λ�����һ���������᳤�Ƚ���ԭͼ
figure, for i=1:num_scales, subplot(1,num_scales,i); gopimage(q{i}), axis image, end
title('Filters across different scales')

%% Integrate all scales
q = integrate_scales(q, 1);
figure, gopimage(q), axis image, title('Integrated scales');

%% Remap the response for normalization
q_remapped = remap(q, 3);
%q_remapped ��ʵ�������߽ṹ ��Ѫ��
%q_remapped ���鲿����߽ṹ ����
figure;
[h,im] = gopimage(q_remapped);
% imshow(real(q_remapped), []);
% (real(q_remapped),[]) ��real(q_remapped��������
axis off, axis image;
imagePreTreat = zeros(row,column);

% figure;imshow(h);
figure;imshow(rgb2gray(im));

% 
% imageEdge = real(q_remapped);
% mins = min(imageEdge(:));
% maxs = max(imageEdge(:));
% imageEdge = (imageEdge-mins)./(maxs-mins).*255;

tempMap = rgb2gray(im);
index = find(mask);
imagePreTreat(index)=tempMap(index);
% find(isnan(imagePreTreat))
% imagePreTreat
figure;imshow(imagePreTreat);

end

