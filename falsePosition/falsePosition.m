function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% falsePosition is a function that uses the closed method of false position
% to calculate the roots of a given symbolic fucntion
% Inputs:
%   func - symbolic function whose roots are desired
%   xl - lower guess of the root
%   xu - upper guess of the root
%   es - desired relative error of root approximation
%   maxiter - maximum number of iterations desired to find the root
%Outputs:
%   root - value of the root of the input function
%   fx - fucntion evaluated at root location
%   ea - approximate relative error (percent)
%   iter - number of iterations of false position run

if nargin <3 %requiring a minimum of 3 input args
    error('Invalid number of arguments made')
end
if nargin < 4 %setting values of es and maxiter for lack of inputs
    es = (0.0001);
    maxiter = 200;
end
if nargin < 5 %setting value of maxiter for lack of input
    maxiter = 200;
end

if func(xl) == 0 %miraculous case of guessing root
    disp('Your lower limit guess was the root!')
end
if func(xu) == 0 %miraculous case of guessing root
    disp('Your upper limit guess was the root!')
end

if (func(xl) > 0) && (func(xu) > 0)%error if no root exists in the bracket
    error('Your guesses did not bracket a root')
end
if (func(xl) < 0) && (func(xu) < 0)%error if no root exists in the bracket
    error('Your guesses did not bracket a root')
end

ea = 1; %initial error assesment of 100%
i = 1; %creating counter for error assesment
%root evaluation while error or maxiter conditions not met
while (es < ea) && (i < maxiter)
    xl = xl; %lower limit 
    xu = xu; % upper limit
    fxl = func(xl);
    fxu = func(xu);
    root = xu - ((fxu*(xl-xu))/(fxl-fxu)); %false postion formula
    rootv(i+1) = root; %storing roots in vector for error evaluation
    ea = abs((rootv(i+1) - rootv(i))./rootv(i+1))*100; %approx error
    fx = func(root); %function evaluated at root
    %sign evlauation for new brackets
    if fxl*fx < 0
        xu = root;
    elseif fxu*fx < 0 
        xl = root;
    end
    i = i + 1; %increase iteration counter
end
iter = i; %true iteration count
disp('Location of root:'); disp(double(root))
disp('Function evaluated at root:'); disp(double(fx))
disp('Approximate Percent Error:'); disp(double(ea))
disp('Number of iterations:'); disp(double(iter))

end

