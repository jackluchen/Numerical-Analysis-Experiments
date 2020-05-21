function [Q,R] = qrgivens(A)
% Givens QR Factorization
% Input  - A  a symmetric matrix can be factorized as Q*R
% Output - Q  the orthogonal matrix
%        - R  the upper triangle matrix

[m,n] = size(A);
Q = eye(m);
R = A;

for j = 1:n
   for i = m:-1:(j+1)
     G = eye(m);
     [c,s] = givensrotation( R(i-1,j),R(i,j) );
     G([i-1, i],[i-1, i]) = [c -s; s c];
     R = G'*R;
     Q = Q*G;
   end
end

end
