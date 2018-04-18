function [I] = Simpson(x,y)
%Simpson performs Simpson's 1/3 Rule on a given set of tabular data as well
%as performing Trapezoidal Rule for when there are an odd number of
%intervals
%Inputs:
%   x - matrix of independent variable data (should be evenly spaced)
%   y - matrix of dependent variable data 
%Outputs:
%   I - approximation of the integral of the input data

%% ERRORS

%Error for invalid number of inputs
if nargin ~= 2
    error('Must give 2 inputs')
end

%Error for invalid sizes of x and y
if length(x) ~= length(y)
    error('x and y must be the same size')
end

%Error for uneven spacing of x
dx = diff(x);
if max(dx) ~= min(dx)
    error('input x must be equally spaced')
end

%% SIMPSON'S RULE CALCULATION

% Parameters for calculation
lex = length(x);
eo = mod(lex,2); %Determines even/odd number of data points
yodd = y(3:2:end-2);%Odd referrences of y
yeven = y(2:2:end-1);%Even referrences of y
h = (x(end)-x(1))/(lex-1);%Step size

if eo == 1%Calculation of 1/3 rule with even # of intervals
    I = (h./3).*(y(1)+(4.*(sum(yodd)))+(2.*(sum(yeven)))+y(end));
    disp(I)
elseif eo == 0%Calculation of 1/3 rule iwth odd # of intervals and Trap Rule
    I = ((h./3).*(y(1)+(4.*(sum(yodd)))+(2.*(sum(yeven)))+y(end-1)))+((x(end)-x(end-1)).*((y(end-1)+y(end))./(2)));
    disp(I)
    disp('Warning: Because there were an odd amount of intervals, Trapezoidal Rule was used to approximate the last interval.')
end
end

