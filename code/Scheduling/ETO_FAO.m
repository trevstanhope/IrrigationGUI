%% Calculate ETO using FAO Method
% Author: Olanike Aladenola
% Organization: McGill University, Department of Hydrology
% Updated: February 28th, 2013

% ARGUMENTS:
% 1. Tmin; Array
% 2. Tmax, Array
% 3. u2; Array
% 4. Rs; Array
% 5. Ra; Array
% 6. z; Int

% OUTPUTS:
% 1. eto; Array

function [eto] = ETO_FAO_DAILY(Tmin,Tmax,u2,Rs,Ra,z)
% Initializatiaons
eo_Tmax = zeros(1,7);
eo_Tmin = zeros(1,7);
es = zeros(1,7);
ea = zeros(1,7);
G = zeros(1,7);
Tmean = zeros(1,7);
Tdew = zeros(1,7);
eto = zeros(1,7);
Rns = zeros(1,7);
Rso = zeros(1,7);
q1 = zeros(1,7);
q2 = zeros(1,7);
r = zeros(1,7);
s = zeros(1,7);
Rnl = zeros(1,7);
Rn = zeros(1,7);

% Global Constants
p=101.3*((293-(0.0065*z))/293)^5.26;
phi=(1.013e-3*p)/(0.622*2.45);

for i=1:12
    % Find Rn
    Rns(i)=0.77*Rs(i);
    Rso(i)=(0.75+2*z/100000)*Ra(i);
    eo_Tmin(i)=0.6108*exp(17.27*Tmin(i)/(Tmin(i)+237.3));
    ea(i)=eo_Tmin(i);
    alpha=(4.903e-09);
    q1(i)=((Tmax(i)+273.16)^4)*alpha;
    q2(i)=((Tmin(i)+273.16)^4)*alpha;
    r(i)=0.34-0.14*sqrt(ea(i));
    s(i)=1.35*(Rs(i)/Rso(i))-0.35;
    Rnl(i)=((q1(i)+q2(i))/2)*r(i)*s(i);
    Rn(i)=Rns(i)-Rnl(i);
    
    % If you are calculating for december
    if i>11
        Tmean(i-1)=(Tmax(i-1)+Tmin(i-1))/2;
        Tmean(i)=(Tmax(i)+Tmin(i))/2;
        Tdew(i)=(-0.036*Tmean(i))+(0.9679*Tmin(i))+(0.0072*(Tmax(i)-Tmin(i)))+1.0119;
        eo_Tmax(i)=0.6108.*exp(17.27.*Tmax(i)/(Tmax(i)+237.3));
        eo_Tmin(i)=0.6108.*exp(17.27.*Tmin(i)/(Tmin(i)+237.3));
        es(i)=(eo_Tmax(i)+eo_Tmin(i))/2;
        ea(i)=0.6108.*exp(17.27.*Tdew(i)/(Tdew(i)+237.3));
        delta=4098.*(0.6108.*exp(17.27.*Tmean(i)./(Tmean(i)+237.3)))./(Tmean(i)+237.3).^2;
        G(i)=0;
        eto(i)=((0.408*delta*(Rn(i)-G(i)))+(phi*(900/(Tmean(i)+273))*u2(i)*(es(i)-ea(i))))/(delta+(phi*(1+(0.34*u2(i)))));
    % if you are calculating for january to november
    elseif i<2
        Tmean(i+1)=(Tmax(i+1)+Tmin(i+1)/2);
        Tmean(i+11)=(Tmax(i+11)+Tmin(i+11))/2;
        Tmean(i)=(Tmax(i)+Tmin(i))/2;
        Tdew(i)=(-0.036*Tmean(i))+(0.9679*Tmin(i))+(0.0072*(Tmax(i)-Tmin(i)))+1.0119;
        eo_Tmax(i)=0.6108.*exp(17.27.*Tmax(i)./(Tmax(i)+237.3));
        eo_Tmin(i)=0.6108.*exp(17.27.*Tmin(i)./(Tmin(i)+237.3));
        es(i)=(eo_Tmax(i)+eo_Tmin(i))/2;
        ea(i)=0.6108.*exp(17.27.*Tdew(i)/(Tdew(i)+237.3));
        delta=4098.*(0.6108.*exp(17.27.*Tmean(i)./(Tmean(i)+237.3)))./(Tmean(i)+237.3).^2;
        G=0;
        eto(i)=((0.408*delta*(Rn(i)-G(i)))+(phi*(900/(Tmean(i)+273))*u2(i)*(es(i)-ea(i))))/(delta+(phi*(1+(0.34*u2(i)))));
    else
        Tmean(i+1)=(Tmax(i+1)+Tmin(i+1)/2);
        Tmean(i-1)=(Tmax(i-1)+Tmin(i-1)/2);
        Tmean(i)=(Tmax(i)+Tmin(i))/2;
        Tdew(i)=(-0.036*Tmean(i))+(0.9679*Tmin(i))+(0.0072*(Tmax(i)-Tmin(i)))+1.0119;
        eo_Tmax(i)=0.6108.*exp(17.27.*Tmax(i)./(Tmax(i)+237.3));
        eo_Tmin(i)=0.6108.*exp(17.27.*Tmin(i)./(Tmin(i)+237.3));
        es(i)=(eo_Tmax(i)+eo_Tmin(i))/2;
        ea(i)=0.6108.*exp(17.27.*Tdew(i)/(Tdew(i)+237.3));
        delta=4098.*(0.6108.*exp(17.27.*Tmean(i)./(Tmean(i)+237.3)))./(Tmean(i)+237.3).^2;
        G(i)=0;
        eto(i)=((0.408*delta*(Rn(i)-G(i)))+(phi*(900/(Tmean(i)+273))*u2(i)*(es(i)-ea(i))))/(delta+(phi*(1+(0.34*u2(i)))));
    end
end
end

