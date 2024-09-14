clear all
close all

x=linspace(0,2*pi);
y=sin(x);
z=cos(x);
figure(1); plot_with_color(x,y)
figure(2); plot3_with_color(x,y,z)

function plot_with_color(x,y)

    x = x(:)';
    y = y(:)';
    
    y2=linspace(0,2,length(x)) ;
    
    xx=[x;x];
    yy=[y;y];
    y22=[y2;y2];
    zz=zeros(size(xx));
    
    hs=surf(xx,yy,zz,y22,'EdgeColor','interp'); %// color binded to "y" values
    colormap('hsv');
    view(2)

end

function plot3_with_color(x,y,z)

    x = x(:)';
    y = y(:)';
    z = z(:)';
    
    y2=linspace(0,2,length(x)) ;
    
    xx=[x;x];
    yy=[y;y];
    zz=[z;z];
    
    y22=[y2;y2];
    
    hs=surf(xx,yy,zz,y22,'EdgeColor','interp'); %// color binded to "y" values
    colormap('hsv');
    % view(2)

end