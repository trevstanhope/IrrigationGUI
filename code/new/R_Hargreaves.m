%% Calculate Radiation using the Hargreaves Method
% Author: Olanike Aladenola
% Organization: McGill University, Department of Hydrology
% Last Updated: February 26th, 2013

% ARGUMENTS:
% Tmin; Array
% Tmax; Array
% Krs; Int
% L; Int

% OUTPUTS:
% Rs; Array

function [Rs] = R_Hargreaves(Tmin,Tmax,Krs,L)
% Initializations
dr = zeros(1,12);
c = zeros(1,12);
d = zeros(1,12);
m = zeros(1,12);
ws = zeros(1,12);
a = zeros(1,12);
b = zeros(1,12);
Ra = zeros(1,12);
Rs = zeros(1,12);

% Global Constants
days = [15 46 76 107 137 167 198 228 259 289 319 350];

for i = 1:12
    j=(3.141593/180)*L;
    dr(i)=1+0.033*cos(0.017214*days(i));
    c(i)=(0.017214206*days(i))-1.39;
    d(i)=0.409*sin(c(i));
    m(i)=-tan(j)*tan(d(i));
    ws(i)=acos(m(i));
    a(i)=sin(j)*sin(d(i));
    b(i)=cos(j)*cos(d(i));
    Ra(i)=37.58603*(dr(i))*((ws(i)*a(i))+(b(i)*(sin(ws(i)))));
    Rs(i)= Krs*((Tmax(i)-Tmin(i))^0.5)*Ra(i);
end
end
