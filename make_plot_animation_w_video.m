close all; clear all; clc

vidWrite = 0; % Use 1 to write video
Ts = 0.1; % Sampling time

if vidWrite > 0.5
    vidObj = VideoWriter('plot.mp4');
    vidObj.FrameRate = 1/Ts;
    vidObj.Quality = 100;
    open(vidObj);
end

set(gca,'nextplot','replacechildren');


fontLatexLabels = 22;
fontTextNotes = 20;
fontTextLabels = 20;
fontLegendLabels = 20;
fontAxisLabels = 20;

tt = 0:Ts:10;
yy = 1 - exp(-tt);

figure(1)

set(gcf,'position',[400,100,600,400])

for ii = 1:length(yy)

set(gcf, 'color', [1 1 1])
plot(tt(1:ii),yy(1:ii),'color',[0 0.4470 0.7410],'linewidth',2)
xlim([tt(1) tt(end)])
ylim([0 1.1])

set(gca,'TickLabelInterpreter','latex')
ax = gca;
ax.FontSize = fontAxisLabels; 
ylabel('$y$' , 'interpreter', 'latex','fontsize', fontLatexLabels)  
xlabel('$t$ (s)' , 'interpreter', 'latex', 'fontsize', fontLatexLabels)
grid on
box on

set(gca,'position',[0.15,0.2,0.82,0.75])

if vidWrite > 0.5
    currFrame = getframe(gcf);
    writeVideo(vidObj,currFrame);
else
    drawnow
    pause(0.05)
end

end

% Uncomment instructions to record video
if vidWrite > 0.5
    close(vidObj);
end