  
%   As described in Enno Kätelhön, R. G. C. Testing and validating 
%   electroanalytical simulations. Analyst 2015, 140, 2592?2598 
%   DOI: 10.1039/c4an02276a. 

%Butler-Volmer kinetics (Equation 4)

kab  =   5*10^6 ;  % reaction rate constant
alpha =   0.5 ;  % transfer coefficient (alpha anodic)
beta  =    0.5;  % transfer coefficient (alpha cathodic)
F = 96485;    %Faraday Constant
R = 8.3145;   % Molar gas constant
T = 298.15;   % Temperature in Kelvins
Ca = .9 ;     % Mole fraction A at t = 0
Cb = .1 ;     % Mole fraction B at t = 0
Ef = 1;    % E_ox in eV vs. SHE

E = linspace(0.1,2,500);

j = (kab*exp(((-alpha*F*(E-Ef))/(R*T))*Ca))+(kab*exp(((-beta*F*(E-Ef))/(R*T))*Cb));

