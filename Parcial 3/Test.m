clear all;close all;clc
rng(42);
% Descargamos los datos
cartera=xlsread('Test CRO24.xlsx','port','B2:G2171');

EAD=cartera(:,1);
PD=cartera(:,2);
LGD=cartera(:,3);

factoresdefault=cartera(:,[4:6]);
correlaciondefault=[1,.6;.6,1];  % Parámetro de correlación

cc = creditDefaultCopula(EAD,PD,LGD,factoresdefault,'FactorCorrelation',correlaciondefault);
cc.VaRLevel = 0.99;  % Nivel de confianza
cc = simulate(cc,10000);

[pr,pr_ci] = portfolioRisk(cc);
fprintf('Portfolio risk measures:\n');
disp(pr)
fprintf('\n\nConfidence intervals for the risk measures:\n');
disp(pr_ci)
histogram(cc.PortfolioLosses)
title('Portfolio Losses');
xlabel('Losses ($)')
ylabel('Frequency')
hold on
xlim([0 1.1 * pr.CVaR])
plotline = @(x,color) plot([x x],ylim,'LineWidth',2,'Color',color);
plotline(pr.EL,'b');
plotline(pr.VaR,'r');
cvarline = plotline(pr.CVaR,'m');
format bank