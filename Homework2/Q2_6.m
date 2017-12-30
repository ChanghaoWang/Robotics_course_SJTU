clear all
clc
a1=0;% ��a1����Ϊ1
alpha1=pi/2;
d1=1;% ��d1����Ϊ1
theta1=pi/6; %��theta1����Ϊpi/6
a2=2;% ��a2����Ϊ1
alpha2=0;
d2=0;
theta2=pi/6;% ��ת���Ƕ�theta2����Ϊpi/6
a3=1;% ��a3����Ϊ1
alpha3=0;
d3=0;
theta3=pi/6;%��ת���Ƕ�theta3����Ϊpi/6
L(1)=Link([theta1,d1,a1,alpha1,0]);
L(2)=Link([theta2,d2,a2,alpha2,0]);
L(3)=Link([theta3,d3,a3,alpha2,0]);
three_link=SerialLink(L,'name','ThreeLink');
T=three_link.fkine([theta1 theta2 theta3]) %�����˶�ѧ���
q0=[theta1 theta2 theta3];
Mask=[1 1 0 0 0 0];
qi=three_link.ikine(T,q0, Mask)  %�����˶�ѧ���
three_link.plot([theta1 theta2 theta3])    %��ͼ
J0 = three_link.jacob0([theta1 theta2 theta3])% �����ſɱȾ������