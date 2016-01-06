function [dados] = calcular_trafego(dados, tempo_trafego, tempo_aco)
%calcula o tempo de trafego de cada uma das ordens de serviço
	[l c] = size(dados);
	for i = 1: l
		soma_trafego = 0;
		if dados(i, 4) ~= 0 && dados(i, 5) ~= 0								%Tempo de trafego CV to FP
			if dados(i, 5) <= 2												%Somente FPA 01 ou 02
				soma_trafego = tempo_trafego(1) + soma_trafego;
			else
				soma_trafego = tempo_trafego(2) + soma_trafego;				% Direto para o RH
			end
		end		
		if dados(i,5) == 0 && dados(i,6) == 0								% CV  to LC or CV to CC
			if dados(i,3) <= 3												% CV to LC
				soma_trafego = tempo_trafego(3) + soma_trafego;				%	
			else
				soma_trafego = tempo_trafego(8) + soma_trafego;				% CV to CC
			end 															%%%%%%%%%
		end																	%%%%%%%%%
		if dados(i,5) ~= 0 && dados(i,6) ~= 0								% FP to RH
			if dados(i,5) <= 2												%
				soma_trafego = tempo_trafego(4) + soma_trafego;				% 
			end																%%%%%%%%%	
		end
		
		if dados(i,5) ~= 0 && dados(i,6) == 0								%%%%%%%%	
			if dados(i,3) <= 3												%%%%%%%%
				soma_trafego = tempo_trafego(9) + soma_trafego;				% FP - LC
			else 															%%%%%%%
				soma_trafego = tempo_trafego(7) + soma_trafego;				% FP - CC
			end
		end
		if dados(i,6) ~= 0 && dados(i,7) ~= 0 
			if dados(i,3) <= 3
				soma_trafego = tempo_trafego(5) + soma_trafego;				% RH - LC
			else
				soma_trafego = tempo_trafego(6) + soma_trafego;				% RH - CC
			end
		end
		dados(i, 9) = soma_trafego;
	end
	%dados(:, 10) = dados(:,8)+dados(:,9)
end
