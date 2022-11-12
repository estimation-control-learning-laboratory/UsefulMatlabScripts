clc
clear all
close all
addpath 'J:\Google Drive\000 Work\36 2015 Oct 23 2D scramjet\RCAC_onestep\RCAC_functions'
addpath 'J:\Google Drive\000 Work\36 2015 Oct 23 2D scramjet\RCAC_onestep'

LoadFigurePrintingProperties
addpath '.'


psi = 45;
phi = 60;
theta = 30;

psi = 0;
phi = 110;
theta = 45;

ODA = O_mat(phi,1) * O_mat(theta,2) * O_mat(psi,3)

theta1 = asin(-ODA(1,3))*180/pi;
theta2 = 180-theta1;

psi1 = atan2(ODA(1,2)/cosd(theta1)  ,ODA(1,1)/cosd(theta1))*180/pi;
psi2 = atan2(ODA(1,2)/cosd(theta2)  ,ODA(1,1)/cosd(theta2))*180/pi;

phi1 = atan2(ODA(2,3)/cosd(theta1)  ,ODA(3,3)/cosd(theta1))*180/pi ;
phi2 = atan2(ODA(2,3)/cosd(theta2)  ,ODA(3,3)/cosd(theta2))*180/pi ;

[theta1 psi1 phi1]
[theta2 psi2 phi2]


ODA = O_mat(phi1,1) * O_mat(theta1,2) * O_mat(psi1,3)
ODA = O_mat(phi2,1) * O_mat(theta2,2) * O_mat(psi2,3)


%%
clc
n = rand(3,1);
% n = [1 0 0];
n = n/norm(n)
R = eye(3) + 2*(supercross(n))^2

a = 1+trace(R);
b = sqrt(0.5*(R(1,1)+1));
c = R(1,2)/2/b;
d = R(1,3)/2/b;
[b c d]

c = sqrt(0.5*(R(2,2)+1));
b = R(2,1)/2/c;
d = R(2,3)/2/c;
[b c d]

d = sqrt(0.5*(R(3,3)+1));
b = R(3,1)/2/d;
c = R(3,2)/2/d;
[b c d]







