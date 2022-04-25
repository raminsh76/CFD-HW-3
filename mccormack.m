close all
clear
clc
nu=0.5;
h=0.05;
                                              % 1st IC McCormack Method
Allvalues=zeros(21); 
un=zeros(21,1); 
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1;                        % 1st IC
for j=1:21                                    % Temporal Nodes
for i=1:20                                    % Spatial  Nodes   
un(i,1)= (1+nu)*u0(i,1)  -  nu*u0(i+1,1);
end
Allvalues(:,j)=un;
u0=un;
end
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1; 
for k=1:21
    un(:,1)=Allvalues(:,k);
    for w=1:21
        un(i,1)=(nu/2)*un(i-1,1) + 0.5*u0(i,1) + ((1-nu)/2)*un(i+1,1);
    end
end
x=linspace(0,1,21);
plot(x,un);
hold on
%%
                                              % 2nd IC McCormack Method
for s=1:21
 u0(s,1)=sin(4*pi*(s-1)*h);
end  
for j=1:21                                    % Temporal Nodes
for i=1:20                                    % Spatial  Nodes   
un(i,1)= (1+nu)*u0(i,1)  -  nu*u0(i+1,1);
end
Allvalues(:,j)=un;
u0=un;
end
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1; 
for k=1:21
    un(:,1)=Allvalues(:,k);
    for w=1:21
        un(i,1)=(nu/2)*un(i-1,1) + 0.5*u0(i,1) + ((1-nu)/2)*un(i+1,1);
    end
end
x=linspace(0,1,21);
plot(x,un);
hold on
%%
                                              % 3rd IC McCormack Method
u0=zeros(21,1);
u0([5],[1])=1;
u0([6],[1])=1;  
for j=1:21                                    % Temporal Nodes
for i=1:20                                    % Spatial  Nodes   
un(i,1)= (1+nu)*u0(i,1)  -  nu*u0(i+1,1);
end
Allvalues(:,j)=un;
u0=un;
end
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1; 
for k=1:21
    un(:,1)=Allvalues(:,k);
    for w=1:21
        un(i,1)=(nu/2)*un(i-1,1) + 0.5*u0(i,1) + ((1-nu)/2)*un(i+1,1);
    end
end
x=linspace(0,1,21);
plot(x,un);
ylabel(' t=1 @ x=0,1 in McCormack Method ');