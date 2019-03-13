% Auther: Jian Chen
% April 2008
% Department of Biomedical imaging, Columbia University, New York, USA
% Institute of Automation, Chinese Academy of Sciences, Beijing, China
% email: jc3129@columbia.edu,  jian.chen@ia.ac.cn
% All rights reserved


function [allmatches,desc1,desc2] = rr_match(des1, loc1,des2, loc2, distRatio)

% For each descriptor in the first image, select its match to second image.
% �ӵ㼯1����ƥ��
des2t = des2';                          % Precompute matrix transpose
for i = 1 : size(des1,1)
    dotprods = des1(i,:) * des2t;        % Computes vector of dot products
    [vals,indx] = sort(acos(dotprods));  % Take inverse cosine and sort results
    
    % Check if nearest neighbor has angle less than distRatio times 2nd.
    if (vals(1) < distRatio * vals(2))
        % ����СֵС�ڵڶ�Сֵ��disstRatio��ʱ ��Ϊ2��ƥ�䣬����¼��Ӧ�㼯2�иõ����������match��i)��
        match(i) = indx(1);
    else
        match(i) = 0;
    end
end

%%%%%%%%%%%%%%%%%%%%
% �ӵ㼯2����ƥ��
des1t = des1';
for i = 1 : size(des2,1)
    dotprods = des2(i,:) * des1t;
    [vals,indx] = sort(acos(dotprods));
    if (vals(1) < distRatio * vals(2))
        % ����СֵС�ڵڶ�Сֵ��disstRatio��ʱ ��Ϊ2��ƥ�䣬����¼��Ӧ�㼯1�иõ����������match1��i)��
        match1(i) = indx(1);
    else
        match1(i) = 0;
    end
end

for i = 1 : size(des1,1)
    if match(i)>0
        % ˫��ƥ���������Ӧ���Ӧ�ĵ�Ǹõ�ʱȥ��
        if match1(match(i))~=i
            match(i)=0;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%
allmatches = [];
desc1=[];
desc2=[];
j=0;
for i = 1 : size(des1,1)
    if match(i)>0
        j=j+1;
        allmatches = [allmatches; [loc1(i,:),loc2(match(i),:)]];
        desc1(j,:) = des1(i,:);
        desc2(j,:) = des2(match(i),:);
        
        
        %             disp(['des1 ' num2str(des1(i,:)) ]);
        %              disp([   'des2 ' num2str(des2(i,:)) ]);
    end
end
