global F kappa_0_L Delta
kappa_0 = 50e2;
L = 200e-6;
n = 3.266;
lambda_0 = 1550e-9;
BW = 3e-9;
kappa_0_L = kappa_0*L;
F = (BW*4*pi*n*L)/(lambda_0^2);

xmesh = linspace(-0.5, 0.5, 500);
solinit = bvpinit(xmesh, @guess);

Delta_scan = linspace(-15, 15, 500);
r = zeros(1, length(Delta_scan));

for i=1:length(Delta_scan)
    Delta = Delta_scan(i);
    sol = bvp4c(@bvpfcn, @bcfcn, solinit);
    r(i) = sol.y(1,1);
    
%    plot(sol.x, abs(sol.y(1,:)).^2, '-o')
%    xlim([-0.5, 0.5])
%    ylim([0, 1])
end
%%
subplot(1, 2, 1)
plot(Delta_scan, abs(r).^2)
xlim([-15, 15])
xlabel('Delta')
ylim([0, 1])
ylabel('R')

phase = unwrap(angle(r));
p = polyfit(Delta_scan, phase, 2);

subplot(1, 2, 2)
plot(Delta_scan, phase)
hold on
plot(Delta_scan, p(1)*Delta_scan.^2 + Delta_scan*p(2) + p(3))
xlim([-15, 15])
xlabel('Delta')
ylabel('Phase [rad.]')

function dydx = bvpfcn(x, y)
global F kappa_0_L Delta
dydx = zeros(2,1);
dydx = [y(2)
    1j*(2*Delta-F*x)*y(2)+((kappa_0_L)^2)*y(1)];
end

function res = bcfcn(ya, yb)
global F kappa_0_L Delta
res = [ya(2) - (kappa_0_L)*exp(1j*(-Delta-F/8))
    yb(1)];
end

function g = guess(x)
g = [0.1
     1];
end