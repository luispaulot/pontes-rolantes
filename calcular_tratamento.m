%% calcular: calcula o tempo de cada OS
function [dados] = calcular_tratamento(dados, tempo_tratamento, tempo_aco, tempo_trafego)
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
end
