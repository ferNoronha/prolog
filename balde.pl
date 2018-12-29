%tamanho do balde um e dois
baldeum(4).
baldedois(3).

%BUM= balde um, BDOIS = Balde dois, NUM= balde um pra voltar, NDOIS= balde dois pra voltar
%baldeum
pode_ir([BUM,BDOIS],[NUM,BDOIS]):- baldeum(X), BUM \= X, NUM is X.
%baldedois
pode_ir([BUM,BDOIS],[BUM,NDOIS]):- baldedois(X),BDOIS \= X, NDOIS is X.
%baldeum esvaziar
pode_ir([BUM,_],[NUM,_]):- BUM \= 0, NUM is 0.
%baldedois esvaziar
pode_ir([BUM,BDOIS],[BUM,NDOIS]):- BDOIS \= 0, NDOIS is 0.
%balde um - balde dois
pode_ir([BUM,BDOIS],[NUM,NDOIS]):- baldedois(X),BDOIS \= X, ((BUM + BDOIS >= X, NDOIS is X, NUM is BUM - (X-BDOIS));
                                BUM + BDOIS < X, NDOIS is BUM+BDOIS, NUM is 0).
%balde dois - balde um
pode_ir([BUM,BDOIS],[NUM,NDOIS]):- baldeum(X), BUM \= X,((BUM + BDOIS >= X, NUM is X, NDOIS is BDOIS - (X-BUM));
                                BUM + BDOIS < X, NUM is BUM+BDOIS, NDOIS is 0).

rota(Origem,Destino,Cam) :- busca_largura([[Origem]],Cam,Destino), imprime(Cam).

imprime([]).
imprime([C1|Cauda]):- imprime(Cauda), nl,write(C1).

busca_largura([ [N|Caminho] | _], [N|Caminho], Destino):- N=Destino.
busca_largura([[N|Caminho]| Caminhos ], Solucao, Destino) :-
		findall([M,N| Caminho],(pode_ir(N,M),not(member(M,[N|Caminho]))),NovosCaminhos),

                concatena(Caminhos,NovosCaminhos,Caminhos1),!,
		busca_largura(Caminhos1, Solucao, Destino);
		busca_largura(Caminhos, Solucao, Destino).

concatena([],L,L).
concatena([C|Cauda],Li,L):- concatena(Cauda,Li,Lx), L = [C|Lx].
