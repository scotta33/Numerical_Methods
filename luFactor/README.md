# LU Factorization Algorithm
## About luFactor.m
luFactor.m is an aglorithm developed to perform the LU factorization of a square matrix with partial pivoting. luFactor keeps track of the pivoting that is done to the original matrix. 
## Inputs
* A - This is a matrix of size nxn that will have LU factorization performed on it.
## Outputs
* L - This is the lower triangular matrix that keeps track of the elimination elements used to calculate the U matrix
* U - This is the upper triangluar matrix that contains the Gauss elimination with partial pivoting of rows.
* P - This is the identity matrix used to keep track of the row pivoting done during the Gauss Elimination.
## Other Information on luFactor.m
luFactor.m will only accpet the input of one matrix at a time and the matrix must be square meaning that it has the same number of rows and columns.
