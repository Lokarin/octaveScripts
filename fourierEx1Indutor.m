%Henrique Amaral Onuki
%fourier de 1/2 + 2/pi + somatorio( (1/n) * sen(n * pi * t)) 

function fourierEx1Indutor(harm)
	%intervalo
	x = linspace(-2,2,1000);

	%harmonicas
	N = harm;

	%y
	y = (1/2)+(2/pi)*(zeros(size(x)));
	vo = zeros(size(x));

	%soma das harmonicas
	for t = 1:length(x)
		for n = 1:2:N
			y(t) = y(t) + (sin(n * pi * x(t)))/n;
			vo(t) = vo(t) + ( (4/(sqrt(25+(4*(n^2)*(pi^2))))) * (cos((n*pi*x(t)) - (atan2((2*n*pi),5)) )));
		end
	end


	%grafico
	figure;
        plot(x, y, 'b-', 'LineWidth', 2);
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
        plot(x, vo, 'm-', 'LineWidth', 2);
        plot(x1, y1, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
        plot(x2, y2, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
        
        %texto dos marcadores
        text(x1, y1+0.1, sprintf('(%.2f, %.2f)', x1, y1), 'FontSize', 10);
        text(x2, y2+0.1, sprintf('(%.2f, %.2f)', x2, y2), 'FontSize', 10);
        
        hold off;
end
