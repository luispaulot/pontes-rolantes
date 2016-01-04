%% calcular: calcula o tempo de cada OS
function [dados] = calcular(dados, tempo_tratamento, tempo_aco, tempo_trafego)
	[l c] = size(dados);
	%calcula o tempo de tratamento de cada uma das ordens
	soma_tratamento = 0;
	for i = 1:l
		if dados(i, 4) ~= 0 											%Tempo de tratamento do convertedor
			soma_tratamento = tempo_tratamento(1); 						%%%%%%
		end																%%%%%%
		if dados(i, 5) ~= 0 											%Tempo de tratamento 1
			soma_tratamento = tempo_tratamento(2) + soma_tratamento;	%%%%%%
		end																%%%%%%
		if dados(i, 6) ~= 0 											%Tempo de tratamento 2
			soma_tratamento = tempo_tratamento(3) + soma_tratamento;	%%%%%%
		end																%%%%%%
		if dados(i, 7) ~= 0 											%Tempo de lingotamento
			%soma_tratamento = tempo_tratamento(4) + soma_tratamento;	%%%%%%
			soma_tratamento = tempo_aco(dados(i,3)) + soma_tratamento	%%%%%% calculado em funçaõ do tipo de aço em dados(i,3)
		end																%%%%%%
		dados(i, 8) = soma_tratamento;
	end
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%calcula o tempo de trafego de cada uma das ordens de serviço
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
