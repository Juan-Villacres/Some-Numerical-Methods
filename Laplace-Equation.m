b=[-1-3;-1;-1-4;-3;0;-4;-2-3;-2;-2-4];
D=[-4 1 0;1 -4 1;0 1 -4];
I=eye(3);
C=zeros(3,3);
A=[D I C;I D I;C I D];
V=A\b;
U(3,1)=V(1);
U(3,2)=V(2);
U(3,3)=V(3);
U(2,1)=V(4);
U(2,2)=V(5);
U(2,3)=V(6);
U(1,1)=V(7);
U(1,2)=V(8);
U(1,3)=V(9);
x=y=[0 0.25 0.5 0.75 1];
m=[3;3;3];
f=[4;4;4];
h=[1 1 1 1 1];
g=[2 2 2 2 2];
X=[m U f];
Y=[g;X;h];
[xx,yy]=meshgrid(x,y)
colormap(hot)
surf(xx,yy,Y)

