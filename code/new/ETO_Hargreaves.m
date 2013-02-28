%% Calculate ETO using the Hargreaves Method
% Author: Olanike Aladenola
% Organization: McGill University, Department of Hydrology
% Last Updated: February 26th, 2013

% ARGUMENTS:
% Tmin; Array
% Tmax; Array

% OUTPUTS:
% eto; Array

function [eto] = ETO_Hargreaves(Tmin,Tmax,Ra)
% Initializations
Tmean = zeros(1,12);
eto = zeros(1,12);

for i=1:12
    % Average temp
    Tmean(i)= (Tmax(i)+Tmin(i))/2;
    
    % Output ETO
    eto(i)=0.0023*(Tmean(i)+17.8)*((Tmax(i)-Tmin(i))^0.5)*Ra(i); 
end
end

