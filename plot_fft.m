clc
clear all
close all
u = 1+sin(2*pi*1*t)+ 0*rand(size(t));
[u_fft, u_freq] = plot_fft(T_s,u);
function [data_fft, freq] = plot_fft(Ts, data)

n = length(data);
freq = (1:floor(n/2))*1/Ts/(n);

% Compute fft
yhat = 1/n*fft(data);
yhat = yhat(1:floor(n/2));          % Only plot the top circle
yhat(2:end) = 2*yhat(2:end);        % Fix the magnitude on the top circle

data_fft = yhat(:);
plot(freq,abs(yhat), 'LineWidth',2);
set(gca,'yscale','log')
set(gca,'xscale','log')
axis tight; grid on
xlabel(['\times 2 \pi/ ' num2str(1/Ts) ' steps per second'])
ylabel('Frequency Content')
end
