close all; clear; clc;




x = linspace(0, 1);




[Psi, kn, N] = ef_rod(x, 1, 5, 1);



%%
figure('units', 'pixels', 'position', [20, 20, 400, 400]);

ind = 4;

Psi = Psi ./ max(Psi);

for i = 1:60

    plot(x, Psi(:,ind) * cos(i / 60 * 2 * pi), 'k', 'LineWidth', 1.4);
    hold on
    plot(x, 0 * x, 'k:');
    hold off
    ylim([-8, 8]);
    axis off
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end


%%
filename = "../assets/img/animations/rod_demo.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end

%% Simply Supported

x = linspace(0, 1);


[Psi, kn, N] = ef_rod(x, 1, 6, 0);

figure('units', 'pixels', 'position', [20, 20, 3*400, 400]);

ind = 4;

Psi = Psi ./ max(Psi);

for i = 1:60

    for j = 1:6
    
        subplot(2, 3, j)
        plot(x, Psi(:,j) * cos(i / 60 * 2 * pi), 'k', 'LineWidth', 1.4);
        hold on
        plot(x, 0 * x, 'k:');
        hold off
        ylim([-8, 8]);
        axis off
    
    end
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end

filename = "../assets/img/animations/simply_supported_demo.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end


%% clamped

x = linspace(0, 1);


[Psi, kn, N] = ef_rod(x, 1, 6, 2);

figure('units', 'pixels', 'position', [20, 20, 3*400, 400]);

ind = 4;

Psi = Psi ./ max(Psi);

for i = 1:60

    for j = 1:6
    
        subplot(2, 3, j)
        plot(x, Psi(:,j) * cos(i / 60 * 2 * pi), 'k', 'LineWidth', 1.4);
        hold on
        plot(x, 0 * x, 'k:');
        hold off
        ylim([-8, 8]);
        axis off
    
    end
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end

filename = "../assets/img/animations/clamped_demo.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end



%% free-free

x = linspace(0, 1);


[Psi, kn, N] = ef_rod(x, 1, 6, 1);

figure('units', 'pixels', 'position', [20, 20, 3*400, 400]);

ind = 4;

Psi = Psi ./ max(Psi);

for i = 1:60

    for j = 1:6
    
        subplot(2, 3, j)
        plot(x, Psi(:,j) * cos(i / 60 * 2 * pi), 'k', 'LineWidth', 1.4);
        hold on
        plot(x, 0 * x, 'k:');
        hold off
        ylim([-8, 8]);
        axis off
    
    end
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end

filename = "../assets/img/animations/freefree_demo.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end


%% free-free

x = linspace(0, 1);


[Psi, kn, N] = ef_rod(x, 1, 6, 3);

figure('units', 'pixels', 'position', [20, 20, 3*400, 400]);

ind = 4;

Psi = Psi ./ max(Psi);

for i = 1:60

    for j = 1:6
    
        subplot(2, 3, j)
        plot(x, Psi(:,j) * cos(i / 60 * 2 * pi), 'k', 'LineWidth', 1.4);
        hold on
        plot(x, 0 * x, 'k:');
        hold off
        ylim([-8, 8]);
        axis off
    
    end
    
     set(gcf,'color','w');
    currFrame = getframe(gcf);
    im{i} = frame2im(currFrame);   
    pause(0.01);

end

filename = "../assets/img/animations/cantilever_demo.gif"; % Specify the output file name

fps = 20;

for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,"gif","LoopCount",Inf,"DelayTime",1/fps);
    else
        imwrite(A,map,filename,"gif","WriteMode","append","DelayTime",1/fps);
    end
end