function eto = calculate_eto(z,Tmin,Tmax,Tmin_A,Tmax_A,Tmin_Pr,Tmax_Pr,u2,Rn)
    p=101.3*((293-(0.0065*z))/293)^5.26;
    phi=(1.013e-3*p)/(0.622*2.45);
    Tmean_A=(Tmax_A+Tmin_A)/2;
    Tmean_Pr=(Tmax_Pr+Tmin_Pr)/2;
    Tmean=(Tmax+Tmin)/2;
    eo_Tmax=0.6108.*exp(17.27.*Tmax./(Tmax+237.3));
    eo_Tmin=0.6108.*exp(17.27.*Tmin./(Tmin+237.3));
    es=(eo_Tmax+eo_Tmin)/2;
    ea=eo_Tmin;
   delta=4098.*(0.6108.*exp(17.27.*Tmean./(Tmean+237.3)))./(Tmean+237.3).^2;
    G=0.07*(Tmean_A-Tmean_Pr);
    
eto=((0.408*delta*(Rn-G))+(phi*(900/(Tmean+273))*u2*(es-ea)))/...
     (delta+(phi*(1+(0.34*u2))));
end
disp(eto)