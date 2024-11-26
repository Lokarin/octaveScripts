%Henrique Amaral Onuki
%fourier de -5/2 + 15/pi + somatorio( (sen(n * wo * t))/n ) 

%fourierAtv(out,harm)
%out = 1, tensao no indutor
%harm, numero de harmonicas

function fourierAtv(out,harm)
	%intervalo
	x = linspace(-6,6,1000);

	%harmonicas
	N = harm;
	
	%wo
	wo = (2*pi)/3;

	%y
	y = -(5/2)+(zeros(size(x))); %Vin
	%vo = zeros(size(x));
	voot = -5/3 + zeros(size(x)); %Vout


	%soma das harmonicas
	for t = 1:length(x)
		for n = 1:N
			y(t) = y(t) - (15/pi)*((sin(n * wo * x(t)))/n); %soma todas harmonicas de entrada

			voo = ((((wo*i*n+4)*(1/(wo*i*0.1*n)))/((wo*i*n+4)+(1/(wo*i*0.1*n))))/((((wo*i*n+4)*(1/(wo*i*0.1*n)))/((wo*i*n+4)+(1/(wo*i*0.1*n))))+2)) * (-(15/(pi*n)));
			voom = abs(voo);
			vooa = angle(voo);

			voot(t) = voot(t) + ( voom * sin(n*wo*x(t) + vooa ) );

		end
	end

	%grafico
	figure;

	plot(x, y, 'b-', 'LineWidth', 2);

        grid on;
        xlabel('t');
        ylabel('f(t)');
        title(sprintf('Gráfico da Série de Fourier no Capacitor (%d Harmonicas)', N), 'FontSize', 18);
        axis([-6 6 -12 7]);

        %marcadores 
        x1 = -2.63;  
        x2 = 2.98; 
        
        %y em x1 e x2
        idx1 = find(abs(x - x1) == min(abs(x - x1)));
        idx2 = find(abs(x - x2) == min(abs(x - x2)));
        y1 = voot(idx1);
        y2 = voot(idx2);
        
        %plot marcadores
        hold on;

	plot(x, voot, 'm-', 'LineWidth', 2);

        plot(x1, y1, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
        plot(x2, y2, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
        
        %texto dos marcadores
        text(x1, y1+0.1, sprintf('(%.2f, %.2f)', x1, y1), 'FontSize', 10);
        text(x2, y2+0.1, sprintf('(%.2f, %.2f)', x2, y2), 'FontSize', 10);
        
        hold off;
end
