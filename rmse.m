function [ value ] = rmse( model,scene )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

t_fundus = cp2tform(model,scene,'polynomial',2);
    % t_fundus �õ����Ƿ���ƥ��ı任ģ�ͣ��Ǵ�loc2��loc1ת����ϵ��
    x1 = tforminv(t_fundus,scene(:,1:2));
if size(model,2)==size(scene,2)
    value = sqrt(sum(sum((model-x1).^2))/size(model,1));
end

end

