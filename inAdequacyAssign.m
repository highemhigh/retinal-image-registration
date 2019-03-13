function  outputMatrix  = inAdequacyAssign( assignMatrix, realMatrix )
% �Եڶ�����������Ϊ����
if ~isequal(assignMatrix, realMatrix)
    outputMatrix = zeros(size(realMatrix,1),size(realMatrix,2));
    i = 1;
    while i
        temp = realMatrix - assignMatrix;
        inadequacy = find(temp<0);
        adequacy = find(temp>=0);
        outputMatrix(inadequacy) = realMatrix(inadequacy);
        inadequacyNum = sum(abs(temp(inadequacy)));
        %ʣ���������λ�õĵ�������
        temp = temp(adequacy);
        temp = temp/sum(temp(:));
        outputMatrix(adequacy) = assignMatrix(adequacy) + temp * inadequacyNum;
        temp = realMatrix - outputMatrix;
        % ��ֹ��С����ֵ����
        temp(find(abs(temp)<0.0001)) = 0;
        if isempty(find(temp<0))
            i = 0;
        end
        assignMatrix = outputMatrix;
    end
else
    outputMatrix = realMatrix;
end
end

