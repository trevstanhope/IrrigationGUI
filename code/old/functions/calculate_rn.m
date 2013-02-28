
function Rn = calculate_rn(z,Tmin,Tmax,Rs,Ra)

% calculate Rn
for k=1:12;
    f(k)=Tmax(k)-Tmin(k);
    Rns(k)=0.77*Rs(k);
    Rso(k)=(0.75+2*z/100000)*Ra(k);
    eo_Tmin(k)=0.6108.*exp(17.27.*Tmin(k)./(Tmin(k)+237.3));
    ea(k)=eo_Tmin(k);
    alpha=(4.903e-09);
    q1(k)=((Tmax(k)+273.16)^4)*alpha;
    q2(k)=((Tmin(k)+273.16)^4)*alpha;
    r(k)=0.34-0.14*sqrt(ea(k));
    s(k)=1.35*(Rs(k)/Rso(k))-0.35;
    Rnl(k)=((q1(k)+q2(k))/2)*r(k)*s(k);
    Rn(k)=Rns(k)-Rnl(k);
end
