clear
carregar_dados
dados = calcular_tratamento(dados, tempo_tratamento, tempo_aco);
dados = calcular_trafego(dados, tempo_trafego, tempo_aco);
status_bridge = zeros(1,3); % 0 desoculpada, 1 em uso
where_bridge = zeros(1,4); % posição 1 = CV
						  % posição 2 = FP
						  % posição 3 = RH
						  % posição 4 = LC
						  % posição 5 = CC
vector = zeros(1,10); 	% 1 CV-FP
				 		% 2 CV-RH
				 		% 3 CV-LC
				 		% 4 FP-RH
				 		% 5 RH-LC
				 		% 6 RH-CC
				 		% 7 FP-CC
				 		% 8 CV-CC
				 		% 9 FP-LC
				 		% tempo total	
vector = calcular_locais(dados, tempo_trafego, vector)