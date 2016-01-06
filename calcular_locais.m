function [vector] = calcular_locais(dados, tempo_trafego, vector)
[l c] = size(dados);
	for i = 1: l
		soma_trafego = 0;
		if dados(i, 4) ~= 0 && dados(i, 5) ~= 0								%Tempo de trafego CV to FP
			if dados(i, 5) <= 2												%Somente FPA 01 ou 02
				vector(i, 1) = randi(2,1);
			else
				vector(i, 2) = randi(2,1);									% Direto para o RH
			end
		end		
		if dados(i,5) == 0 && dados(i,6) == 0								% CV  to LC or CV to CC
			if dados(i,3) <= 3												% CV to LC
				vector(i, 3) = randi(2,1);									%	
			else
				vector(i, 8) = randi(2,1);									% CV to CC
			end 															%%%%%%%%%
		end																	%%%%%%%%%
		if dados(i,5) ~= 0 && dados(i,6) ~= 0								% FP to RH
			if dados(i,5) <= 2												%
				vector(i, 4) = randi(3,1);									% 
			end																%%%%%%%%%	
		end
		
		if dados(i,5) ~= 0 && dados(i,6) == 0								%%%%%%%%	
			if dados(i,3) <= 3												%%%%%%%%
				vector(i, 9) = randi(3,1);									% FP - LC
			else 															%%%%%%%
				vector(i, 7) = randi(3,1);									% FP - CC
			end
		end
		if dados(i,6) ~= 0 && dados(i,7) ~= 0 
			if dados(i,3) <= 3
				vector(i, 5) = randi(3,1);									% RH - LC
			else
				vector(i, 6) = randi(3,1);				% RH - CC
			end
		end
	end
	%dados(:, 10) = dados(:,8)+dados(:,9)
end