oposto(e,d).
oposto(d,e).

% ME = mae esquerda, PE= pai esquerda, POLE= policia E, BANE = bandido
% esquerda, FME= filhas esquerda, FHE= filhos esquerda
%

permitido([ME,PE,POLE,BANE,FME,FHE,_,_,_,_,_,_,_]):-
    (PE=1,ME=1,POLE=0,BANE=0,FME>=0,FHE>=0);
    (PE=0,ME=0,POLE>=0,BANE=1,FME=0,FHE=0);
    (PE=1,ME=1,POLE>=0,BANE=0,FME=2,FHE=2);
    (PE=0,ME=0,POLE=0,BANE=0,FME>=0,FHE>=0);
    (PE=0,ME=0,POLE=1,BANE=1,FME>=0,FHE>=0);
    (PE=1,ME=1,POLE=1,BANE=1,FME>=0,FHE>=0);
    (PE=1,ME=0,POLE=0,BANE=0,FME=0,FHE=2);
    (PE=1,ME=0,POLE=1,BANE=1,FME=0,FHE=2);
    (PE=0,ME=1,POLE=0,BANE=0,FME=2,FHE=0);
    (PE=0,ME=1,POLE=1,BANE=1,FME=2,FHE=0).



% um policial e um bandido
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[ME,PE,NPOLE,NBANE,FME,FHE,MD,PD,NPOLD,NBAND,FMD,FHD,NB]):-
	oposto(B,NB),((B=e, POLE=1, BANE=1, NPOLD = POLE, NBAND = BANE, NPOLE is POLE-1, NBANE is BANE-1);
	(B=d, POLD=1, BAND=1, NPOLE = POLD, NBANE = BAND, NPOLD is POLD-1, NBAND is BAND-1)).




% um policial e uma mãe

pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[NME,PE,NPOLE,BANE,FME,FHE,NMD,PD,NPOLD,BAND,FMD,FHD,NB]):-
	oposto(B,NB),((B=e, POLE=1, ME=1, NPOLD = POLE, NMD = ME, NPOLE is POLE-1, NME is ME-1);
	(B=d, POLD=1, MD=1, NPOLE = POLD, NME = MD, NPOLD is POLD-1, NMD is MD-1)).

% uma mae e um pai

pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[NME,NPE,POLE,BANE,FME,FHE,NMD,NPD,POLD,BAND,FMD,FHD,NB]):-
	oposto(B,NB),((B=e, ME=1, PE=1, NMD = ME, NPD = PE, NME is ME-1, NPE is PE-1);
	(B=d, MD=1, PD=1, NME = MD, NPE = PD, NMD is MD-1, NPD is PD-1)).

% uma mae e uma filha
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[NME,PE,POLE,BANE,NFME,FHE,NMD,PD,POLD,BAND,NFMD,FHD,NB]):-
	( oposto(B,NB),(   (B=e, ME=1, FME>=1, NMD = ME, NFMD is FMD+1, NME is ME-1, NFME is FME-1);
	   (B=d, MD=1, FMD>=1, NME = MD, NFME is FME+1, NMD is MD-1, NFMD is FMD-1))).


% um pai e um filho
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[ME,NPE,POLE,BANE,FME,NFHE,MD,NPD,POLD,BAND,FMD,NFHD,NB]):-
	( oposto(B,NB),(   (B=e, PE=1, FHE>=1, NPD = PE, NFHD is FHD+1, NPE is PE-1, NFHE is FHE-1);
	   (B=d, PD=1, FHD>=1, NPE = PD, NFHE is FHE+1, NPD is PD-1, NFHD is FHD-1))
	).

% um policial e um filho
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[ME,PE,NPOLE,BANE,FME,NFHE,MD,PD,NPOLD,BAND,FMD,NFHD,NB]):-
	( oposto(B,NB),(   (B=e, POLE=1, FHE>=1, NPOLD = POLE, NFHD is FHD+1, NPOLE is POLE-1, NFHE is FHE-1);
	   (B=d, POLD=1, FHD>=1, NPOLE = POLD, NFHE is FHE+1, NPOLD is POLD-1, NFHD is FHD-1))
	).

%um policial e uma filha
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[ME,PE,NPOLE,BANE,NFME,FHE,MD,PD,NPOLD,BAND,NFMD,FHD,NB]):-
	( oposto(B,NB),(  (B=e, POLE=1, FME>=1, NPOLD = POLE, NFMD is FMD+1, NPOLE is POLE-1, NFME is FME-1);
	   (B=d, POLD=1, FMD>=1, NPOLE = POLD, NFME is FME+1, NPOLD is POLD-1, NFMD is FMD-1))).

%um policial
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[ME,PE,NPOLE,BANE,FME,FHE,MD,PD,NPOLD,BAND,FMD,FHD,NB]):-
    oposto(B,NB),((B=e, POLE=1, NPOLD = POLE, NPOLE is POLE-1);(B=d, POLD=1, NPOLE = POLD, NPOLD is POLD-1)).

%uma mae
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[NME,PE,POLE,BANE,FME,FHE,NMD,PD,POLD,BAND,FMD,FHD,NB]):-
    oposto(B,NB),((B=e, ME=1, NMD = ME, NME is ME-1);(B=d, MD=1, NME = MD, NMD is MD-1)).

%um pai
pode_ir([ME,PE,POLE,BANE,FME,FHE,MD,PD,POLD,BAND,FMD,FHD, B],[ME,NPE,POLE,BANE,FME,FHE,MD,NPD,POLD,BAND,FMD,FHD,NB]):-
    oposto(B,NB),((B=e, PE=1, NPD = PE, NPE is PE-1);(B=d, PD=1, NPE = PD, NPD is PD-1)).

imprime([]).
imprime([C|Cauda]):- imprime(Cauda), nl, write(C).

rota(Origem, Destino, Cam):-
	 rota(Origem, Destino, [Origem], Cam), imprime(Cam).

rota(Destino, Destino, Cam, Cam).

rota(Origem, Destino, CamAux, Cam):-
	 pode_ir(Origem, Vizinha),
	 permitido(Vizinha),
	 not(member(Vizinha,CamAux)),
	 rota(Vizinha, Destino, [Vizinha|CamAux], Cam).
