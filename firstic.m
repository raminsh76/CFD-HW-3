close all
clear
clc
nu=0.5;
h=0.05;
                                              % 1st IC Upwind Method
un=zeros(21,1); 
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1;                        % 1st IC
for j=1:21                                    % Temporal Nodes
for i=2:21                                    % Spatial  Nodes   
un(i,1)=(1-nu)*u0(i,1)  + nu*u0(i-1,1);
end
u0=un;
end
disp('  Values at t=1 s  :  ');
disp(un);
x=linspace(0,1,21);
plot(x,un);
hold on
%%
un=zeros(21,1);                               % 1st IC Lax Method
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1;                        % 1st IC
for j=1:21                                    % Temporal Nodes
for i=2:20                                    % Spatial  Nodes   
un(i,1)=((1+nu)/2)*u0(i-1,1)  + ((1-nu)/2)*u0(i+1,1);
end
u0=un;
end
disp('  Values at t=1 s  :  ');
disp(un);
plot(x,un);
hold on
%%
un=zeros(21,1);                               % 1st IC Lax-Wendroff Method
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1;                        % 1st IC
for j=1:21                                    % Temporal Nodes
for i=2:20                                    % Spatial  Nodes   
un(i,1)=(((nu^2)+nu)/2)*u0(i-1,1)  + (1-(nu^2))*u0(i,1) + (((nu^2)-nu)/2)*u0(i+1,1);
end
u0=un;
end
disp('  Values at t=1 s  :  ');
disp(un);
plot(x,un);
hold on
ylabel(' t=1 @ x=0,1 in 1st IC ');
%%

                                              % 1st IC McCormack Method

un=zeros(21,1); 
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1;                        % 1st IC
for j=1:21                                    % Temporal Nodes
for i=1:20                                    % Spatial  Nodes   
un(i,1)= (1+nu)*u0(i,1)  -  nu*u0(i+1,1);
end
u0=un;
end
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1; 
for k=1:21
    for w=1:21
        un(i,1)=(nu/2)*un(i-1,1) + 0.5*u0(i,1) + ((1-nu)/2)*un(i+1,1);
    end
end
x=linspace(0,1,21);
un=un./100000;
plot(x,un);
