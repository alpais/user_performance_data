

subj_start = 48;
subj_end = 52;

sf = 50;

% load('excepted_demos.mat');

for snum = subj_start:subj_end
    
    fprintf('\n');
    fprintf('>>>>>>>>  Processing subject %d \n', snum);
    fprintf('\n');
    strajname = sprintf('../../ppdata_res/res_traj/S%.2d_ppdata_res.mat', snum);
    load(strajname);
    
    sftname = sprintf('../../rawdata_sensors_parsed/FT/S%.2d_rawdata_FT.mat', snum);
    load(sftname);
    
    max_demo_len = size(ppdata_res.RF_World.RobotPos.X, 2);
    
    if (size(ppdata_res.RF_World.RobotPos.X,1)~= length(rawdata_FT))
        fprintf(2, 'Got %d trajectories  and %d FT recordings \n', size(ppdata_res.RF_World.RobotPos.X,1), length(rawdata_FT));
    end
    
    for i = 1:length(rawdata_FT)
%         if ((excepted_demos{snum}.Tool_FT(i) == 1) || (excepted_demos{snum}.Hand_FT(i) == 1) || (excepted_demos{snum}.traj(i) == 1))
%             fprintf(2, 'Skipping demo %d \n', i);
%             continue
%         else
%                         
            % Smoothing
            for jk = 1:6
                rawdata_FT{i}.Tool_FT(jk,:) = smooth(rawdata_FT{i}.Tool_FT(jk,:),sf);     % smoothing FT
                rawdata_FT{i}.Hand_FT(jk,:) = smooth(rawdata_FT{i}.Hand_FT(jk,:),sf);     % smoothing FT
            end
            
            % !!!!!! Trajectory data is on column, FT data is on rows !!!!
            
            % Tool FT - Resizing
            ppdata_res.RF_Tool.ToolFT.FX(i,:) = spline(1:length(rawdata_FT{i}.Tool_FT(1,:)), rawdata_FT{i}.Tool_FT(1,:), linspace(1, length(rawdata_FT{i}.Tool_FT(1,:)), max_demo_len));
            ppdata_res.RF_Tool.ToolFT.FY(i,:) = spline(1:length(rawdata_FT{i}.Tool_FT(2,:)), rawdata_FT{i}.Tool_FT(2,:), linspace(1, length(rawdata_FT{i}.Tool_FT(2,:)), max_demo_len));
            ppdata_res.RF_Tool.ToolFT.FZ(i,:) = spline(1:length(rawdata_FT{i}.Tool_FT(3,:)), rawdata_FT{i}.Tool_FT(3,:), linspace(1, length(rawdata_FT{i}.Tool_FT(3,:)), max_demo_len));
            
            ppdata_res.RF_Tool.ToolFT.TX(i,:) = spline(1:length(rawdata_FT{i}.Tool_FT(4,:)), rawdata_FT{i}.Tool_FT(4,:), linspace(1, length(rawdata_FT{i}.Tool_FT(4,:)), max_demo_len));
            ppdata_res.RF_Tool.ToolFT.TY(i,:) = spline(1:length(rawdata_FT{i}.Tool_FT(5,:)), rawdata_FT{i}.Tool_FT(5,:), linspace(1, length(rawdata_FT{i}.Tool_FT(5,:)), max_demo_len));
            ppdata_res.RF_Tool.ToolFT.TZ(i,:) = spline(1:length(rawdata_FT{i}.Tool_FT(6,:)), rawdata_FT{i}.Tool_FT(6,:), linspace(1, length(rawdata_FT{i}.Tool_FT(6,:)), max_demo_len));
            
            % Robot FT - Resizing
            ppdata_res.RF_Robot.RobotFT.FX(i,:) = spline(1:length(rawdata_FT{i}.Hand_FT(1,:)), rawdata_FT{i}.Hand_FT(1,:), linspace(1, length(rawdata_FT{i}.Hand_FT(1,:)), max_demo_len));
            ppdata_res.RF_Robot.RobotFT.FY(i,:) = spline(1:length(rawdata_FT{i}.Hand_FT(2,:)), rawdata_FT{i}.Hand_FT(2,:), linspace(1, length(rawdata_FT{i}.Hand_FT(2,:)), max_demo_len));
            ppdata_res.RF_Robot.RobotFT.FZ(i,:) = spline(1:length(rawdata_FT{i}.Hand_FT(3,:)), rawdata_FT{i}.Hand_FT(3,:), linspace(1, length(rawdata_FT{i}.Hand_FT(3,:)), max_demo_len));
            
            ppdata_res.RF_Robot.RobotFT.TX(i,:) = spline(1:length(rawdata_FT{i}.Hand_FT(4,:)), rawdata_FT{i}.Hand_FT(4,:), linspace(1, length(rawdata_FT{i}.Hand_FT(4,:)), max_demo_len));
            ppdata_res.RF_Robot.RobotFT.TY(i,:) = spline(1:length(rawdata_FT{i}.Hand_FT(5,:)), rawdata_FT{i}.Hand_FT(5,:), linspace(1, length(rawdata_FT{i}.Hand_FT(5,:)), max_demo_len));
            ppdata_res.RF_Robot.RobotFT.TZ(i,:) = spline(1:length(rawdata_FT{i}.Hand_FT(6,:)), rawdata_FT{i}.Hand_FT(6,:), linspace(1, length(rawdata_FT{i}.Hand_FT(6,:)), max_demo_len));
            
            % Biasing            
            ppdata_res.RF_Robot.RobotFT.FX = ppdata_res.RF_Robot.RobotFT.FX - mean(ppdata_res.RF_Robot.RobotFT.FX(:, 1:20), 2);
            ppdata_res.RF_Robot.RobotFT.FY = ppdata_res.RF_Robot.RobotFT.FY - mean(ppdata_res.RF_Robot.RobotFT.FY(:, 1:20), 2);
            ppdata_res.RF_Robot.RobotFT.FZ = ppdata_res.RF_Robot.RobotFT.FZ - mean(ppdata_res.RF_Robot.RobotFT.FZ(:, 1:20), 2);

            ppdata_res.RF_Robot.RobotFT.TX = ppdata_res.RF_Robot.RobotFT.TX - mean(ppdata_res.RF_Robot.RobotFT.TX(:, 1:20), 2);
            ppdata_res.RF_Robot.RobotFT.TY = ppdata_res.RF_Robot.RobotFT.TY - mean(ppdata_res.RF_Robot.RobotFT.TY(:, 1:20), 2);
            ppdata_res.RF_Robot.RobotFT.TZ = ppdata_res.RF_Robot.RobotFT.TZ - mean(ppdata_res.RF_Robot.RobotFT.TZ(:, 1:20), 2);
            
            ppdata_res.RF_Tool.ToolFT.FX = ppdata_res.RF_Tool.ToolFT.FX - mean(ppdata_res.RF_Tool.ToolFT.FX(:, 1:20), 2);
            ppdata_res.RF_Tool.ToolFT.FY = ppdata_res.RF_Tool.ToolFT.FY - mean(ppdata_res.RF_Tool.ToolFT.FY(:, 1:20), 2);
            ppdata_res.RF_Tool.ToolFT.FZ = ppdata_res.RF_Tool.ToolFT.FZ - mean(ppdata_res.RF_Tool.ToolFT.FZ(:, 1:20), 2);

            ppdata_res.RF_Tool.ToolFT.TX = ppdata_res.RF_Tool.ToolFT.TX - mean(ppdata_res.RF_Tool.ToolFT.TX(:, 1:20), 2);
            ppdata_res.RF_Tool.ToolFT.TY = ppdata_res.RF_Tool.ToolFT.TY - mean(ppdata_res.RF_Tool.ToolFT.TY(:, 1:20), 2);
            ppdata_res.RF_Tool.ToolFT.TZ = ppdata_res.RF_Tool.ToolFT.TZ - mean(ppdata_res.RF_Tool.ToolFT.TZ(:, 1:20), 2);
            

%         end
    end
    
    
    soutfname =  sprintf('S%.2d_ppdata_res_with_FT_n.mat', snum);
    save(soutfname, 'ppdata_res', '-mat');
    
    clear rawdata_FT ppdata_res
    
    
end