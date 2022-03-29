%from MATLAB doc mesh example

[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
C = X.*Y;
mesh(X,Y,Z,C)
colorbar