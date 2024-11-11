%Henrique Amaral Onuki
%fourier de 1/2 + 2/pi + somatorio( (1/n) * sen(n * pi * t)) 
%+funcao do indutor e suas Harmonicas

%fourierEx1Indutor(out,ouths,harm)
%out = 1, tensao no indutor
%ouths = 1, harmonicas do indutor
%harm, numero de harmonicas

function fourierEx1Indutor(out,ouths,harm)
	%intervalo
	x = linspace(-2,2,1000);

	%harmonicas
	N = harm;

	%y
	y = (1/2)+(zeros(size(x))); %Vin
	%vo = zeros(size(x));
	voot = zeros(size(x)); %Vout
	vooh = zeros(length(x), N); %Harmonicas individuais


	%soma das harmonicas
	for t = 1:length(x)
		for n = 1:2:N
			y(t) = y(t) + (2/pi)*(sin(n * pi * x(t)))/n; %soma todas harmonicas de entrada
			%vo(t) = vo(t) + ( (4/(sqrt(25+(4*(n^2)*(pi^2))))) * (cos((n*pi*x(t)) - (atan2((2*n*pi),5)) )));

			voo = (4*pi*n*i)/(5*pi*n+2*pi^2*n^2*i);
			voom = abs(voo);
			vooa = angle(voo);

			voot(t) = voot(t) + ( voom * sin(n*pi*x(t) + vooa ) );

			vooh(t,n) = ( voom * sin(n*pi*x(t) + vooa) );
		end
	end

	%grafico
	figure;

	if ouths == 1
		plot(x, vooh, 'k-', 'LineWidth', 0.5);
	else
		plot(x, y, 'b-', 'LineWidth', 2);
	endif

        grid on;
        xlabel('t');
        ylabel('f(t)');
        title(sprintf('Gráfico da Série de Fourier no Indutor (%d Harmonicas)', N), 'FontSize', 18);
        axis([-2 2 -1.5 1.5]);

        %marcadores 
        x1 = 0.5;  
        x2 = 1.5; 
        
        %y em x1 e x2
        idx1 = find(abs(x - x1) == min(abs(x - x1)));
        idx2 = find(abs(x - x2) == min(abs(x - x2)));
        y1 = y(idx1);
        y2 = y(idx2);
        
        %plot marcadores
        hold on;

	if ouths == 1
		plot(x, y, 'b-', 'LineWidth', 2);
	endif

	if out == 1
		plot(x, voot, 'm-', 'LineWidth', 2);
	endif

        plot(x1, y1, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
        plot(x2, y2, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
        
        %texto dos marcadores
        text(x1, y1+0.1, sprintf('(%.2f, %.2f)', x1, y1), 'FontSize', 10);
        text(x2, y2+0.1, sprintf('(%.2f, %.2f)', x2, y2), 'FontSize', 10);
        
        hold off;
end
