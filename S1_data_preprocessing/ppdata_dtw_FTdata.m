
subj_first = 7;
subj_last = 42;

for snum = subj_first:subj_last

    if (snum == 15)
        disp('Skipping S15');
        continue
    end
    
    fprintf('\n');
    fprintf('>>>>>>>>  Processing subject %d \n', snum);
    fprintf('\n');
    sfname = sprintf('S%.2d_ppdata_res_with_FT.mat', snum);
    load(sfname);
    
    disp(' =========================================================== ');
    disp(' ============   TOOL FT               ====================== ');
    disp(' =========================================================== ');
    
    disp('      >>>> Tool Force');
    ppdata_dtw_FT.RF_Tool.ToolFT.X = pp_DTW(ppdata_res.RF_Tool.ToolFT.FX);
    ppdata_dtw_FT.RF_Tool.ToolFT.Y = pp_DTW(ppdata_res.RF_Tool.ToolFT.FY);
    ppdata_dtw_FT.RF_Tool.ToolFT.Z = pp_DTW(ppdata_res.RF_Tool.ToolFT.FZ);
    close all;
    
    disp('      >>>> Tool Torque');
    ppdata_dtw_FT.RF_Tool.ToolFT.RX = pp_DTW(ppdata_res.RF_Tool.ToolFT.TX);
    ppdata_dtw_FT.RF_Tool.ToolFT.RY = pp_DTW(ppdata_res.RF_Tool.ToolFT.TY);
    ppdata_dtw_FT.RF_Tool.ToolFT.RZ = pp_DTW(ppdata_res.RF_Tool.ToolFT.TZ);
    close all;

    disp(' =========================================================== ');
    disp(' ============   Hand FT               ====================== ');
    disp(' =========================================================== ');
    
    disp('      >>>> Hand Force');
    ppdata_dtw_FT.RF_Robot.RobotFT.X = pp_DTW(ppdata_res.RF_Robot.RobotFT.FX);
    ppdata_dtw_FT.RF_Robot.RobotFT.Y = pp_DTW(ppdata_res.RF_Robot.RobotFT.FY);
    ppdata_dtw_FT.RF_Robot.RobotFT.Z = pp_DTW(ppdata_res.RF_Robot.RobotFT.FZ);
    close all;
    
    disp('      >>>> Hand Torque');
    ppdata_dtw_FT.RF_Robot.RobotFT.RX = pp_DTW(ppdata_res.RF_Robot.RobotFT.TX);
    ppdata_dtw_FT.RF_Robot.RobotFT.RY = pp_DTW(ppdata_res.RF_Robot.RobotFT.TY);
    ppdata_dtw_FT.RF_Robot.RobotFT.RZ = pp_DTW(ppdata_res.RF_Robot.RobotFT.TZ);
    close all;
    
    sfoutname = sprintf('S%.2d_ppdata_dtw_FT.mat', snum);
    save(sfoutname, 'ppdata_dtw_FT', '-mat');
    
    clear ppdata_dtw_FT ppdata_res

end
