close all
clear
clc

nu=0.5;
h=0.05;
                                              % 2nd IC Upwind Method
un=zeros(21,1); 
u0=zeros(21,1);
for s=1:21
 u0(s,1)=sin(4*pi*(s-1)*h);
end                                           % 2nd IC
for j=1:21                                    % Temporal Nodes
for i=2:21                                    % Spatial  Nodes   
un(i,1)=(1-nu)*u0(i,1)  + nu*u0(i-1,1);
end
u0=un;
end
x=linspace(0,1,21);
plot(x,un);
hold on
%%
for s=1:21
 u0(s,1)=sin(4*pi*(s-1)*h);                   % 2nd IC Lax Method
end                                           % 2nd IC
for j=1:21                                    % Temporal Nodes
for i=2:20                                    % Spatial  Nodes   
un(i,1)=((1+nu)/2)*u0(i-1,1)  + ((1-nu)/2)*u0(i+1,1);
end
u0=un;
end
plot(x,un);
hold on
%%
for s=1:21                                    % 2nd IC Lax-Wendroff Method
 u0(s,1)=sin(4*pi*(s-1)*h);
end                                           % 2nd IC
for j=1:21                                    % Temporal Nodes
for i=2:20                                    % Spatial  Nodes   
un(i,1)=(((nu^2)+nu)/2)*u0(i-1,1)  + (1-(nu^2))*u0(i,1) + (((nu^2)-nu)/2)*u0(i+1,1);
end
u0=un;
end
plot(x,un);
ylabel(' t=1 @ x=0,1 in 2nd IC ');
%%
                                              % 2nd IC McCormack Method
for s=1:21
 u0(s,1)=sin(4*pi*(s-1)*h);
end                                           % 2nd IC
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
