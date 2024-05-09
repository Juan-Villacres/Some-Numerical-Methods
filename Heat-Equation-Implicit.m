%m es el numero de intervalos de espacio
%n es el numero de intervalo de tiempo
n=200;
m=300;
h1=3/m;
h2=2000/n;
x=[0:h1:3];
t=[0:h2:n*h2];
a=9.786*(10^(-5))*h2/(h1^2);
%condiciones iniciales
for i=2:m
    if (1<x(i)&&x(i)<2)
    y(i-1)=500;
    else
    
    y(i-1)=250; 
    endif
endfor 
%condicione de frontera
b1=@(t) 250*(t-t+1);
b2=@(t) 250*(t-t+1);
fr1=feval(b1,t);
fr2=feval(b2,t);
%armo la matriz
D=zeros(m-1,m-1);
for i=1:m-2
  D(i,i)=D(m-1,m-1)=1+2*a;
  D(i+1,i)=D(i,i+1)=-a;
endfor
%establezco la primera respuesta de la ecuacioón matricial es decir Uo  
U(:,1)=y';
y(1)=y(1)+a*fr1(1);
y(m-1)=y(m-1)+a*fr2(1);
Uo=y';
for i=2:n+1
 U(:,i)=W=D\Uo;
 W(1)=W(1)+a*fr1(i);
 W(m-1)=W(m-1)+a*fr2(i);
 Uo=W;
endfor 
U;
T=[fr1;U;fr2];
%hold on; 
for i=1:n+1
plot(x,T(:,i))
title(t(i))
pause(0.001)
endfor
hold off;
[tt,xx]=meshgrid(t,x);
surf(tt,xx,T)

