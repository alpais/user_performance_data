function [ DTW_Data ] = pp_DTW( data )
%PP_DTW Aligns data by performing DTW
tic
% DTW
ref = ref_select(data,1:size(data,2),[1 1]);
[optim_pars,OS,diagnos] = optim_cow(data,[5 30 1 10],[1 3 50 0.15],ref);
disp('[Finished]');
DTW_Data = diagnos.Xw;

% Plotting final results
clrmap = colormap('Jet');
clrmap = clrmap(round(linspace(1,64,size(data,1))),:);
figsm = figure();
for i =1:size(data, 1)
    set(0, 'CurrentFigure', figsm);
    set(gcf, 'Color', [1, 1, 1]);
    plot(DTW_Data(i,:), 'Color', clrmap(i,:));
    hold on;  
    title('DTW Result');
end
toc

end

