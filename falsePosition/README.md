# False Position Algorithm
## About falsePositon.m
faslePosition.m is an algorithm that was developed to find the root of a function using the numerical method of false position. 
## Inputs
* func - this the symbolic function whose root we wish to find
*xl - this is the lower guess for the root location
*xu - this is the upper guess for the root location
*es - this is the desired error for the root approximation
* maxiter - this is the number of iterations of false postion you wish to run
## Outputs
* root - this is the value of the root for the input function
* fx - this is the function evaluated at the root location
* ea - this is the approximate relative error (percent)
* iter - this is the number of iterations of false position that were ran
## Useful information about falsePosition.m
falsePosition.m has some built in defaults if certain inputs are left out. The first three inputs (func,xl,xu) are required while es and iter are optional. If left out, es will default to a value of 0.0001 and maxiter will default to 200.faslePosition.m has a flaw when it comes to functions whose root is the vertex of a parabola. falsePosition.m works based off of sign changes in the function who when it does not detect a sign change in the given bracket, it will throw an error.
