close all
clear
clc
nu=0.5;
h=0.05;
                                              % 1st IC Upwind Method
Allvalues=zeros(21); 
un=zeros(21,1); 
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1;                        % 1st IC
for j=1:21                                    % Temporal Nodes
for i=2:21                                    % Spatial  Nodes   
un(i,1)=(1-nu)*u0(i,1)  + nu*u0(i-1,1);
end
Allvalues(:,j)=un;
u0=un;
end
disp('  Values at t=1 s  :  ');
disp(un);
x=linspace(0,1,21);
plot(x,un);
hold on
%%
                                              % 2nd IC Upwind Method
for s=1:21
 u0(s,1)=sin(4*pi*(s-1)*h);
end                                           % 2nd IC
for j=1:21                                    % Temporal Nodes
for i=2:21                                    % Spatial  Nodes   
un(i,1)=(1-nu)*u0(i,1)  + nu*u0(i-1,1);
end
Allvalues(:,j)=un;
u0=un;
end
disp('  Values at t=1 s  :  ');
disp(un);
plot(x,un);
hold on
%%
                                              % 3rd IC Upwind Method
u0=zeros(21,1);
u0([5],[1])=1;
u0([6],[1])=1;                                % 3rd IC
for j=1:21                                    % Temporal Nodes
for i=2:21                                    % Spatial  Nodes   
un(i,1)=(1-nu)*u0(i,1)  + nu*u0(i-1,1);
end
Allvalues(:,j)=un;
u0=un;
end
disp('  Values at t=1 s  :  ');
disp(un);
plot(x,un);
ylabel(' t=1 @ x=0,1 in Upwind Method ');