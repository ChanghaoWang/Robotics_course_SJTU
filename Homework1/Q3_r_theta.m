function [ r,theta ] = Q3_r_theta( R )
%��r��תtheta�Ƕ�
while abs(det(R)-1)>10^(-6)
    R=input('������������ת����R=');
end
theta=acos((R(1,1)+R(2,2)+R(3,3)-1)/2);
r=(1/(2*sin(theta)))*[R(3,2)-R(2,3);R(1,3)-R(3,1);R(2,1)-R(1,2)];
if theta==0
    r=[1;0;0];
end
end

