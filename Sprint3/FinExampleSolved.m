Diam = .0248;
D_body = .18;
D_cone = .04;
D_fins = .28;
SA_body = .038485;
SA_cone = .007507;
Stab = 2;
C_grav = .2;
Nfins = 6;
Fin_thicc = .003;

% S = (C_pres - C_grav)/Diam
% C_pres = C_grav + Stab * Diam

% C_pres = (SA_body*D_body + SA_fins*D_fins + SA_cone*D_cone) / (SA_body+SA_fins+SA_cone)
% C_pres*(SA_body+SA_fins+SA_cone) = (SA_body*D_body + SA_fins*D_fins + SA_cone*D_cone)
% C_pres*SA_fins - SA_fins*D_fins = (SA_body*D_body + SA_cone*D_cone - C_pres*SA_body - C_pres*SA_cone)
% SA_fins = (SA_body*D_body + SA_cone*D_cone - C_pres*SA_body - C_pres*SA_cone) / (C_pres - D_fins)

LenNew = .4;
WidNew = .05475;
CAfins = LenNew * WidNew;
SA_fins = CAfins * 12;
C_pres = (SA_body*D_body + SA_fins*D_fins + SA_cone*D_cone) / (SA_body+SA_fins+SA_cone)
S = (C_pres - C_grav)/Diam