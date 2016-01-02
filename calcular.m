%% calcular: calcula o tempo de cada OS
function [dados] = calcular(dados, tempo_tratamento, tempo_trafego, tempo_aco)
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
		if (dados(i, 4) ~= 0) && (dados(i, 5) ~= 0)							%Tempo de trafego CV to FP
			soma_trafego = tempo_trafego(1) + soma_trafego;					%
		end																	%
		if (dados(i, 5) ~= 0) && (dados(i, 6) ~= 0)							%Tempo de trafego FP to RH
			soma_trafego = tempo_trafego(4) + soma_trafego;					%
		end																	%
		if (dados(i, 6) ~= 0) && (dados(i, 7) ~= 0)							%Tempo de trafego 
			soma_trafego = tempo_trafego(5) + soma_trafego;					% 
		end																	%
		if (dados(i, 4) ~= 0) && (dados(i, 6) ~= 0) && (dados(i, 5) == 0)	%Tempo de trafego CV to RH 
			soma_trafego = tempo_trafego(5) + soma_trafego;					% 
		end																	%	
		if (dados(i, 4) ~= 0) && (dados(i, 7) ~= 0) && (dados(i, 5) == 0) && (dados(i, 6) == 0)	%Tempo de trafego CV to LC 
			soma_trafego = tempo_trafego(5) + soma_trafego;					% 
		end																	%		
		dados(i,9) = soma_trafego;											%
	end
end