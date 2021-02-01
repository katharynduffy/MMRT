%Example Code for MMRT
%Katharyn Duffy, August 2018

load('data.mat') %Example data from C4 photosynthesis site
% Make sure that you have downloaded the example data and it is in your working directory
%%
data=sortrows(data, 2) %Sort data by temperature
%data.T=data.T+273.15 %Convert to Kelvin for MMRT
figure, plot(data.T-273.15, data.GPP_anom, '.k','MarkerSize',14) %plot temperature versus rate to understand data
%%
%Feed data to MMRT with non-linear fit
[parameters]= nlinfit(data.T, data.GPP_anom,@d1MMRT,[20000 -50 -2000]);
%%
%Use parameters from non-linear fit to predict rate of response with MMRT
T=[20:30]
T=T+273.15
[rate]=d1MMRT(parameters, T)
%%
%Visualize MMRT fit with data
hold on
plot(T-273.15, rate, '-r', 'LineWidth', 2)
set(gcf, 'Color', 'w');
xlabel('^oC')
ylabel('temperature response of photosynthesis')
hold on
ax=gca;
ax.FontSize=14
ax.XAxisLocation='origin'
title('Example C4 Photosynthesis Temperature Curve')
