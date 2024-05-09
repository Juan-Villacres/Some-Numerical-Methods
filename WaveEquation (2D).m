s = 64; %array size (spacial resolution of the simulation)

%create arrays
p = zeros(s,s);  %past
c = zeros(s,s);  %current
f = zeros(s,s);  %future

speed = 10;  			%propagation speed
dt = 0.0001; 			%timestep (small!!) (time resolution of the simulation)
dx = 0.01; 				%distance between elements
r = speed * dt / dx; 
stopTime = 10;        	%stop time


%condiciones iniciales (este es un ejemplo de una condición inicial) 
for i = s/2 - s/16 : s/2 + s/16
	c(i, s/2 - s/16 : s/2 + s/16) = - 2 * cos(0.5 * 2 * pi / (s/8) * [s/2 - s/16 : s/2 + s/16]) * cos(0.5 * 2 * pi / (s/8) * i);
	p(i,1:s) = c(i,1:s);
endfor

%loop principal
for t = 0 : 0.01 : stopTime
	
  %expresión numérica obtenida en clase
	f(2 : s-1,2:s-1) = 2 * c(2 : s-1,2:s-1) - p(2 : s-1,2:s-1) + r ^ 2 * ( c(1 : s-2,2:s-1) + c(3 : s,2:s-1) + c(2 : s-1,1:s-2) + c(2 : s-1,3:s) - 4 * c(2 : s-1,2:s-1) );
	
	
  %Borde reflejante (condiciones de frontera de Dirichlet)
  f(2:s-1,1) = zeros(s-2,1);
  f(2:s-1,s) = zeros(s-2,1);
  f(1,2:s-1) = zeros(1,s-2); 
  f(s,2:s-1) = zeros(1,s-2);
	
	%update values
	p(1 : s,1:s) = c(1 : s,1:s);
	c(1 : s,1:s) = f(1 : s,1:s);
	
	%plot
		b = surf(c); 				%surface plot
		%set(b, 'edgecolor','none') %si quitan '%' el gráfico de la superficie vibrante no se verá cuadrículada 
		axis([0 s 0 s -2 2])  		%axis scale
		caxis([-1 1])         		%color axis scale
		pause ( .001 )

	
endfor