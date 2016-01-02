dados = load('p1.csv');		% CArrega os dados das OS
tempo_tratamento = [38      % CV
					45		% FP
					25		% RH
					34		% LC
					20];	% BO

tempo_trafego = [15 	% CV-FP
				 10 	% CV-RH
				 15 	% CV-LC
				 10 	% FP-RH
				 15		% RH-LC
				 15 	% RH-CC
				 10		% FP-CC
				 10 	% CV-CC
				 6];	% EB-CC

tempo_aco = [34	% A
			34	% B
			32	% C
			75	% D
			75	% E
			70	% F
			80	% G
			65	% H
			75	% I
			70	% J
			80	% K
			30	% L
			30	% M
			30	% N
			30];% O
