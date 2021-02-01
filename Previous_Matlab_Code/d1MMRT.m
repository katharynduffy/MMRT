function [dkdt]=d1MMRT(para,T)
%The following function outputs the first derivative of temperature response (rate)
%For additional information please see Arcus, Vickery L., et al.
%"On the temperature dependence of enzyme-catalyzed rates." Biochemistry 55.12 (2016): 1681-1688.
%https://pubs.acs.org/doi/full/10.1021/acs.biochem.5b01094


%Inputs:
    % T- temperature in K or C
    % parameters
    % T0- optimal temperature
    % S-entropy
    % H-enthalpy in transition state
    % C- heat capacity
    H  = para(1);
    S  = para(2);
    Cp  = para(3);
    if length(para)>3
        T0=para(4);%K
    else

    T0 = 298.15; %Default constant for T0
    end
%Constants
    k  = 1.38064852e-23;% Boltzmann constant,J*K^-1
                        %k=R/Na, demonstrating the engergy of each particle have.
                        %Na is  Avogadro constant(6.022140857�10^23 mol?1)
    h  = 6.626070040e-34/3600;% Planck's constant,J/s
    R  = 8.314;% gas constant,J*mol^-1*K^-1

    A=k/h;
    dH=H+Cp.*(T-T0);
    dS=S+Cp.*(log(T)-log(T0));
    dG=dH-T.*dS;
    RT=R.*T;

    dkdt=A.*exp(-dG./RT).*(1+dH./RT);

end
