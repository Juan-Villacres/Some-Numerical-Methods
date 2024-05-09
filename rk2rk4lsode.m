g=@(T,t) (((5.6*10^(-8))*0.5*6)/(-100))*(T^4-200^4);
t0=0;
tfin=200; 
N1=10;
h1=(tfin-t0)/N1;
t1=[t0:h1:tfin];
N2=20;
h2=(tfin-t0)/N2;
t2=[t0:h2:tfin];
x0=180;
function x=rk2(f,x0,t,h,N)
x(1)=x0;
for i=1:N
 k1=h*f(x(i),t(i));
 k2=h*feval(f,x(i)+k1,t(i)+h);
 x(i+1)=x(i) + (1/2)*(k1+k2);
endfor 
endfunction

function x=rk4(f,t0,x0,tf,N)
h=(tf-t0)/N;
t=[t0:h:tf];
s=length(x0);
x=zeros(s,N+1);
x(:,1)=x0;
 for n=1:N
 k1=feval(f,x(:,n),t(n));
 k2=feval(f,x(:,n)+(0.5.*h.*k1),t(n)+0.5*h);
 k3=feval(f,x(:,n)+(0.5.*h.*k2),t(n)+0.5*h);
 k4=feval(f,x(:,n)+(h.*k3),t(n)+h);
 x(:,n+1)=x(:,n)+(h/6).*(k1'+2.*(k2'+k3')+k4');
 endfor
endfunction

Y1=rk2(g,x0,t1,0.02,N1);
Y2=rk2(f,x0,t2,h2,N2);
Y3=lsode(f,x0,t2);
Y4=rk4(f,t0,x0,tfin,N2);
plot(t1,Y1,"g",t2,Y2,"k",t2,Y3,"b",t2,Y4,"r")