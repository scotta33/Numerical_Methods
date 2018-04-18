function [L,U,P] = luFactor(A)
%luFactor performs Lu Facotrization of the input matrix A
%Inputs:
%   A - the matrix A must be an nxn square matrix that will be broken down
%   into 2 separate matricies L and U
%Outputs:
%   L - L is a lower triangular matrix consisting of the factorizations of
%   the A matrix
%   U - U is a upper triangular matrix which contains the Gauss Elimination
%   of matrix A
%   P - P is a pivot matrix which keeps track of the row switches performed
%   when doing Gauss Elimination. Starts out as an identity matrix

%Errors for incorrect amount of inputs
if nargin < 1
    error('Must input 1 matrix to be factorized')
elseif nargin > 1
    error('Must input 1 matrix to be factorized')
end

%Error for inputting a non square matrix
Asize = size(A);
if Asize(1,1) ~= Asize(1,2)
    error('Matrix A must be a square matrix of size nxn')
end

P = eye(Asize); %Creating P as an identity matrix
L = eye(Asize); %Creating L as an identity matrix
U = A; %Assigning matrix U as the original matrix

%Loops for pivoting and elimination
for j = 1:Asize
    [~, k] = max(abs(U(j:Asize, j))); %Determining pivot element
    k = k+j-1;
    if k ~= j 
        U([k,j],:) = U([j,k],:); %Pivoting rows k and j in U
        P([k,j],:) = P([j,k],:); %Pivoting rows k and j in P
        if j >= 2 %Ensuring that only ceratin elements are being swapped
            L([k,j],1:j-1) = L([j,k],1:j-1); %Pivoting rows k and j in L
        end
    end
    for i = j+1:Asize %Loop to perform elimination in matrix U
        L(i,j) = U(i,j) / U(j,j);
        U(i,:) = U(i,:) - L(i,j)*U(j,:);
    end
end

disp(L)
disp(U)
disp(P)

end

