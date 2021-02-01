function [Vmax,Tmax,Tinf]= MMRT(para,T)
%The following function outputs a temperature response curve (rate), Tinf:
%the Temperature of the infelction point of the response curve, and Tmax:
%the temperature where metabolism is maximal, after which rate declines.
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
    C  = para(3);
    if length(para>3)
        T0=para(4);%K
    else

    T0 = 298.15; %Default constant for T0
    end
    %constant
    k  = 1.38064852e-23;% Boltzmann constant,J*K^-1
                        %k=R/Na, demonstrating the engergy of each particle have.
                        %Na is  Avogadro constant(6.022140857�10^23 mol?1)
    h  = 6.626070040e-34;% Planck�s constant,J/s

    R  = 8.314;% gas constant,J*mol^-1*K^-1

    A=k/h;
    dG=H+C.*(T-T0)-T.*(S+C.*(log(T)-log(T0)));
    RT=R.*T;
    Vmax=A.*T.*exp(-dG./RT);
    Tmax=(H-C*T0)/(-C-R);
    Tinf1=(H-C*T0)/(-C-sqrt(-C*R));
    Tinf2=(H-C*T0)/(-C+sqrt(-C*R));
    if Tinf1<Tmax
        Tinf=Tinf1;
    else
        Tinf=Tinf2;
    end

end
