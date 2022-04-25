close all
clear
clc
nu=0.5;
h=0.05;
                                              % 1st IC Lax Method
Allvalues=zeros(21); 
un=zeros(21,1); 
u0=zeros(21,1);
u0(1:5,1)=u0(1:5,1)+1;                        % 1st IC
for j=1:21                                    % Temporal Nodes
for i=2:20                                    % Spatial  Nodes   
un(i,1)=((1+nu)/2)*u0(i-1,1)  + ((1-nu)/2)*u0(i+1,1);
end
Allvalues(:,j)=un;
u0=un;
end
x=linspace(0,1,21);
F=fft(Allvalues);
g=zeros(21,21);
for s=1:21
    for k=1:20
g(s,k)=F(s,k+1)/F(s,k);
    end
end
G=zeros(21,21);
teta=zeros(21,21);
for t=1:21
    for w=1:21
G(t,w)=sqrt((real(g(t,w))^2)+(imag(g(t,w))^2));
teta(t,w)=atan((imag(g(t,w)))/real(g(t,w)));
    end
end
GG=G.^2;
tetaa=-(teta./pi);
for l=1:21
plot(tetaa(l,:),GG(l,:));
hold on
end