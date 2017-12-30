clear all
clc
R=input('������3*3��ת����R=');
[Z1,Y1,Z2]=Q3_ZYZ(R);
[Roll,Pitch,Yaw]=Q3_Roll_Pitch_Yaw(R);
[r,theta]=Q3_r_theta(R);
%��֤Q3_ZYZ����ȷ��
Rz1=[cos(Z1),-sin(Z1),0;sin(Z1),cos(Z1),0;0,0,1];
Ry1=[cos(Y1),0,sin(Y1);0,1,0;-sin(Y1),0,cos(Y1)];
Rz2=[cos(Z2),-sin(Z2),0;sin(Z2),cos(Z2),0;0,0,1];
R1=Rz1*Ry1*Rz2
error1=norm(R1-R);
D=['ZYZŷ���ǵ����Ϊ��',num2str(error1)];
disp(D);
%��֤Q3_Roll_Pitch_Yaw����ȷ��
Ryaw=[cos(Yaw),-sin(Yaw),0;sin(Yaw),cos(Yaw),0;0,0,1];
Rpitch=[cos(Pitch),0,sin(Pitch);0,1,0;-sin(Pitch),0,cos(Pitch)];
Rroll=[1,0,0;0,cos(Roll),-sin(Roll);0,sin(Roll),cos(Roll)];
R2=Ryaw*Rpitch*Rroll
error2=norm(R2-R);
E=['Roll-Pitch-Yawŷ���ǵ����Ϊ��',num2str(error2)];
disp(E);
%��֤Q3_r_theta����ȷ��
if r(1)==0&r(2)==0
    R3=[cos(theta),-sin(theta),0;sin(theta),cos(theta),0;0,0,1]
else
    alpha=asin(r(2)/(r(1)^2+r(2)^2)^0.5);
    beta=acos(r(3));
    X1=[cos(alpha),-sin(alpha),0;sin(alpha),cos(alpha),0;0,0,1];
    X2=[cos(beta),0,sin(beta);0,1,0;-sin(beta),0,cos(beta)];
    X3=[cos(theta),-sin(theta),0;sin(theta),cos(theta),0;0,0,1];
    X4=[cos(-beta),0,sin(-beta);0,1,0;-sin(-beta),0,cos(-beta)];
    X5=[cos(-alpha),-sin(-alpha),0;sin(-alpha),cos(-alpha),0;0,0,1];
    R3=X1*X2*X3*X4*X5
end
error3=norm(R3-R,2);
F=['�����ַ��������Ϊ��',num2str(error3)];
disp(F);
%��������
if error1<10^(-6)&error2<10^(-6)&error3<10^(-6)
    disp('������ȷ');
else
    disp('����������');
end

