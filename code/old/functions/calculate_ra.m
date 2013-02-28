
function Ra = calculate_ra(z,L)
% d, dr and ws are in radians
% calculate Ra
for k=1:12;
days=[15 46 76 107 137 167 198 228 259 289 319 350];
    dr(k)=1+0.033*cos(0.017214*days(k));
    p=101.3*(((293-(0.0065*z))/293)^5.26);
    j=(3.141593/180)*L;
    c(k)=(0.017214206*days(k))-1.39;
    d(k)=0.409*sin(c(k));
    m(k)=-tan(j)*tan(d(k));
    ws(k)=acos(m(k));
    a(k)=sin(j)*sin(d(k));
    b(k)=cos(j)*cos(d(k));
    Ra(k)=37.58603*(dr(k))*((ws(k)*a(k))+(b(k)*(sin(ws(k)))));
end
