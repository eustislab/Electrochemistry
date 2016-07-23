clear vars

%constants

F = 96485.3329;
n = 1;
A = 1; %cm^2
c = 1*10^-8  ; %mol/mL !!!
D = 1.67*10^-5 ; %urea in water

%Generate Pseudo Data???

pseudo = true;

if pseudo == true

%set number of points for simulated data

nPoints = 1000;

%generate random number array of that size

randArray = 0.5-rand(1,nPoints);

%set time length (sec)

tMax = 90;

%create time array

step=tMax/nPoints;
t(1,:)=[step:step:nPoints*step];
 
%generate i(t) curve (w/o noise)

i(1,:) = (n*F*A*c*sqrt(D))./(sqrt(pi*t(1,:)));

%set noise amplitude (0 = none, 1 = 100% of Y-signal)

noiseFactor = 0.5;

%scale random numbers accordingly

scaledRandArray = noiseFactor*randArray;

%add noise

iNoise = i(1,:)+scaledRandArray.*i(1,:);

end

%find slope (k)

t2 = t(1,:).^(-1./2);

lmModel = fitlm(t2,i);

k = lmModel.Coefficients.Estimate(2,1);

%extract D

D2 = (k/(n*F*A*c*(1/sqrt(pi))))^2;

figure
subplot(1,2,1)
plot(t,iNoise);

subplot(1,2,2)
plot(t.^(-1/2),iNoise);



