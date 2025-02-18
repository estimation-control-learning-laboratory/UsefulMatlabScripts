close all
clear all
clc

tt = 0:0.001:1;
omega = (pi:pi:10*pi);
xx = zeros(length(omega),length(tt));
idx_vec = 1:length(omega);

for ii = 1:length(omega)
    xx(ii,:) = sin(omega(ii)*tt);
end

figure(1)
plot_w_color_gradient_3D(tt, idx_vec, xx)

figure(2)
plot_w_color_gradient_2D(tt, idx_vec, xx)

function plot_w_color_gradient_3D(xx, yy, zz)
    xx_array = kron(ones(length(yy),1), xx);
    yy_array = kron(ones(1,length(xx)), yy.');
    set(gcf,'color','w');
    s = surf(xx_array,yy_array,zz);
    s.LineStyle = 'none';
    grid on; box on; axis tight;
    set(gca,'TickLabelInterpreter','latex','FontSize',16)
    xlabel('$t$ (s)','Interpreter','latex','FontSize',16)
    ylabel('$\omega_i / \pi$','Interpreter','latex','FontSize',16)
    zlabel('$\sin(\omega_i t)$','Interpreter','latex','FontSize',16)
    cc = colorbar("eastoutside",...         
                    'Fontsize', 17, 'TickLabelInterpreter', 'latex');
    cc.Label.Interpreter = 'latex';
    cc.Label.String = "$\sin(\omega_i t)$";
end

function plot_w_color_gradient_2D(xx, yy, zz)
    xx_array = kron(ones(length(yy),1), xx);
    yy_array = kron(ones(1,length(xx)), yy.');
    set(gcf,'color','w');
    s = pcolor(xx_array,yy_array,zz);
    s.LineStyle = 'none';
    grid on; box on; axis tight;
    set(gca,'TickLabelInterpreter','latex','FontSize',16)
    xlabel('$t$ (s)','Interpreter','latex','FontSize',16)
    ylabel('$\omega_i / \pi$','Interpreter','latex','FontSize',16)
    cc = colorbar("eastoutside",...         
                    'Fontsize', 17, 'TickLabelInterpreter', 'latex');
    cc.Label.Interpreter = 'latex';
    cc.Label.String = "$\sin(\omega_i t)$";
end