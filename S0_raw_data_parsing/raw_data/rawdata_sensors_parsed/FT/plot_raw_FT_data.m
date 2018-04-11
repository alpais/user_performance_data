

for snum = 35
    
    fprintf('Subject %d \n', snum);
    sfname = sprintf('S%.2d_rawdata_FT.mat', snum);
    load(sfname);
    
    figure('Name', sfname);
    for i = 3:length(rawdata_FT)
        subplot(3,2,1); hold on; plot(rawdata_FT{i}.Tool_FT(1,:)); xlabel('F_x');
        subplot(3,2,3); hold on; plot(rawdata_FT{i}.Tool_FT(2,:)); xlabel('F_y');
        subplot(3,2,5); hold on; plot(rawdata_FT{i}.Tool_FT(3,:)); xlabel('F_z');

        subplot(3,2,2); hold on; plot(rawdata_FT{i}.Tool_FT(4,:)); xlabel('T_x');
        subplot(3,2,4); hold on; plot(rawdata_FT{i}.Tool_FT(5,:)); xlabel('T_y');
        subplot(3,2,6); hold on; plot(rawdata_FT{i}.Tool_FT(6,:)); xlabel('T_z');
    end
    
    sfigname = sprintf('S%.2d_Tool_FT.fig', snum);
    savefig(sfigname);
    
end