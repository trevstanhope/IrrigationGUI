%% Calculate ETO using the Turc Method
% Author: Olanike Aladenola
% Organization: McGill University, Department of Hydrology
% Updated: February 28th, 2013

% ARGUMENTS:
% 1. Tmin; Array
% 2. Tmax, Array
% 3. Rs; Array
% 4. RHmean; Array; 

% OUTPUTS:
% 1. eto; Array

%% ETO_Turc()
function [eto] = ETO_Turc(Tmin,Tmax,Rs,RHmean)
% Initializations
aT = zeros(1,12);
Tmean = zeros(1,12);
eto = zeros(1,12);

% Find ETO for each month of the year
for i=1:12    
    if (RHmean(i) > 50.1) 
        aT(i)=1;
    elseif (RHmean(i) < 50)
        aT(i)=1+((50-RHmean(i))/70);
    end
    Tmean(i)=(Tmax(i)+Tmin(i))/2;
    eto(i)=(aT(i)*0.0133)*(Tmean(i)/(Tmean(i)+15))*(((23.8856*Rs(i))+50));
end
end

