tic
clear;clc;close all;

I1=0.25*0.2^3/12;
E=30000000;

parameters=18;
measurements=4;
iterations=5;

[f_initial1,f_initial2,f_initial3,f_initial4]=bridge_function(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
[f_measured1,f_measured2,f_measured3,f_measured4]=bridge_function(0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2);

f_initial=[f_initial1 f_initial2 f_initial3 f_initial4];
w_initial=2*pi.*f_initial;
f_measured=[f_measured1 f_measured2 f_measured3 f_measured4];
w_measured=2*pi.*f_measured;

f_iterations(:,1)=f_initial;
w_iterations(:,1)=w_initial;

eigenvalues_initial=(2*pi.*f_initial).^2;
eigenvalues_measured=(2*pi.*f_measured).^2;
standard_deviation=0.5/100*eigenvalues_measured;
variation=standard_deviation.^2;
Wee=diag(1./variation);

standard_deviation_theta=0.5/100*E*I1*ones(parameters,1);
variation_theta=standard_deviation_theta.^2;
Wtt=diag(1./variation_theta);

r=0.1;
R=r*ones(parameters,1);
A=ones(parameters,parameters)+diag(R);
B=ones(parameters,parameters)-diag(R);

theta=zeros(parameters,iterations);
d=zeros(parameters,iterations);
d_difference=zeros(parameters,iterations);

theta(:,1)=E*I1*ones(parameters,1);
d(:,1)=theta(:,1)/(E*I1);

fplus=zeros(measurements,parameters);
fminus=zeros(measurements,parameters);
eigenvalues_plus=zeros(measurements,parameters);
eigenvalues_minus=zeros(measurements,parameters);
S=zeros(measurements,parameters);
J1=zeros(iterations+1,1);
J2=zeros(iterations+1,1);
tol=0.01;

for a=1:iterations+1
    for i=1:parameters
        [fplus1,fplus2,fplus3,fplus4]=bridge_function(A(i,1)*d(1,a),A(i,2)*d(2,a),A(i,3)*d(3,a),A(i,4)*d(4,a),A(i,5)*d(5,a),A(i,6)*d(6,a),A(i,7)*d(7,a),A(i,8)*d(8,a),A(i,9)*d(9,a),A(i,10)*d(10,a),A(i,11)*d(11,a),A(i,12)*d(12,a),A(i,13)*d(13,a),A(i,14)*d(14,a),A(i,15)*d(15,a),A(i,16)*d(16,a),A(i,17)*d(17,a),A(i,18)*d(18,a));
        fplus(:,i)=[fplus1 fplus2 fplus3 fplus4];
        [fminus1,fminus2,fminus3,fminus4]=bridge_function(B(i,1)*d(1,a),B(i,2)*d(2,a),B(i,3)*d(3,a),B(i,4)*d(4,a),B(i,5)*d(5,a),B(i,6)*d(6,a),B(i,7)*d(7,a),B(i,8)*d(8,a),B(i,9)*d(9,a),B(i,10)*d(10,a),B(i,11)*d(11,a),B(i,12)*d(12,a),B(i,13)*d(13,a),B(i,14)*d(14,a),B(i,15)*d(15,a),B(i,16)*d(16,a),B(i,17)*d(17,a),B(i,18)*d(18,a));
        fminus(:,i)=[fminus1 fminus2 fminus3 fminus4];
        eigenvalues_plus(:,i)=(2*pi.*fplus(:,i)).^2;
        eigenvalues_minus(:,i)=(2*pi.*fminus(:,i)).^2;
        S(:,i)=(eigenvalues_plus(:,i)-eigenvalues_minus(:,i))./(2*r*d(i,a)*E*I1);
    end
    theta(:,a+1)=theta(:,a)+S'/(S*S')*(w_measured'.^2-w_iterations(:,a).^2);  %8.13
    %theta(:,a+1)=theta(:,a)+Wtt\S'/(S/Wtt*S')*(w_measured'.^2-w_iterations(:,a).^2);  %8.16
    %theta(:,a+1)=theta(:,a)+(S'*Wee*S+Wtt)\S'*Wee*(w_measured'.^2-w_iterations(:,a).^2);   %8.20
    %theta(:,a+1)=theta(:,a)+(S'*Wee*S+Wtt)\(S'*Wee*(w_measured'.^2-w_iterations(:,a).^2)-Wtt*(theta(:,a)-theta(:,1)));  %8.24

    d(:,a+1)=theta(:,a+1)/(E*I1);
    d_difference(:,a+1)=d(:,a+1)-d(:,1);

    [fnew1,fnew2,fnew3,fnew4]=bridge_function(d(1,a+1),d(2,a+1),d(3,a+1),d(4,a+1),d(5,a+1),d(6,a+1),d(7,a+1),d(8,a+1),d(9,a+1),d(10,a+1),d(11,a+1),d(12,a+1),d(13,a+1),d(14,a+1),d(15,a+1),d(16,a+1),d(17,a+1),d(18,a+1));
    f_iterations(:,a+1)=[fnew1 fnew2 fnew3 fnew4];
    w_iterations(:,a+1)=2*pi.*f_iterations(:,a+1);
    dz=w_measured'.^2-w_iterations(:,a+1).^2;
    dth=theta(:,a+1)-theta(:,a);
    dth1=theta(:,a+1)-theta(:,1);

    J1(a,:)=dz'*Wee*dz-2*dth'*S'*Wee*dz+dth'*(S'*Wee*S+Wtt)*dth; %8.18
    J2(a,:)=dz'*Wee*dz+dth1'*Wtt*dth1-2*dth'*(S'*Wee*dz-Wtt*dth1)+dth'*(S'*Wee*S+Wtt)*dth;  %8.22
  
    %{if J1(a)==0
      %break
    %end
    
end
d_difference;
J=[J1 J2];
bar(d_difference(:,end))
title('final relative parameter changes')
xlabel('elements')
ylabel('parameter differences')

    figure()
    hold on;
    plot(1:iterations+2,theta(1,:))
    hold on;
    plot(1:iterations+2,theta(2,:))
    hold on;
    plot(1:iterations+2,theta(3,:))
    hold on;
    plot(1:iterations+2,theta(4,:))
    hold on;
    plot(1:iterations+2,theta(5,:))
    hold on;
    plot(1:iterations+2,theta(6,:))
    hold on;
    plot(1:iterations+2,theta(7,:))
    hold on;
    plot(1:iterations+2,theta(8,:))
    hold on;
    plot(1:iterations+2,theta(9,:))
    hold on;
    plot(1:iterations+2,theta(10,:))
    hold on;
    plot(1:iterations+2,theta(11,:))
    hold on;
    plot(1:iterations+2,theta(12,:))
    hold on;
    plot(1:iterations+2,theta(13,:))
    hold on;
    plot(1:iterations+2,theta(14,:))
    hold on;
    plot(1:iterations+2,theta(15,:))
    hold on;
    plot(1:iterations+2,theta(16,:))
    hold on;
    plot(1:iterations+2,theta(17,:))
    hold on;
    plot(1:iterations+2,theta(18,:))
    title('parameter changes')
    xlabel('iterations')
    ylabel('parameters')
    legend('element1','element2','element3','element4','element5','element6','element7','element8','element9','element10','element11','element12','element13','element14','element15','element16','element17','element18','location','east')
    grid on;
toc