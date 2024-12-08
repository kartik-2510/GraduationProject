% SELECTIVE HARMONIC ELIMINATION PWM
clc;

m1=0:0.01:1;               % Modulation Index

for ii=1:101               %  
a1=20*pi/180;          % Initial angles
a2=40*pi/180;
a3=60*pi/180; 


for i=1:100                %
    
    
T=[m1(ii)*pi/4 0 0]'; 

F=[cos(a1)-cos(a2)+cos(a3);             
    cos(3*a1)-cos(3*a2)+cos(3*a3);
    cos(5*a1)-cos(5*a2)+cos(5*a3)];

dF=[-sin(a1) +sin(a2) -sin(a3);      
    -3*sin(3*a1) +3*sin(3*a2) -3*sin(3*a3);
    -5*sin(5*a1) +5*sin(5*a2) -5*sin(5*a3)];

% -------------------------------------------------------------------------
%                                   Solution
% -------------------------------------------------------------------------


deriv_a=(inv(dF))*(T-F);                                                     

alpha=[a1;a2;a3]*180/pi;

deriv_a*180/pi;
a1=a1+deriv_a(1);
a2=a2+deriv_a(2);
a3=a3+deriv_a(3);

if deriv_a>-1e-15 & deriv_a<1e-15
    break;
end
end

a11(ii)=a1*180/pi;
a22(ii)=a2*180/pi;
a33(ii)=a3*180/pi;

end

clc
% To choose  the modulation Index---> do ii = (m)*10 - 1
ii = 91; % m = 0.9;

a1 = a11(ii);
a2 = a22(ii);
a3 = a33(ii);

ang = [ a1 a2 a3];
Ts=50e-6;

