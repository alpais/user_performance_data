
subj_first = 7;
subj_last = 42;

for snum = subj_first:subj_last

    fprintf('\n');
    fprintf('>>>>>>>>  Processing subject %d \n', snum);
    fprintf('\n');
    sfname = sprintf('S%.2d_ppdata_res.mat', snum);
    load(sfname);
    
    disp(' =========================================================== ');
    disp(' ============         RF Bowl         ====================== ');
    disp(' =========================================================== ');
    
    disp('      >>>> Robot Position');
    ppdata_dtw.RF_Bowl.RobotPos.X = pp_DTW(ppdata_res.RF_Bowl.RobotPos.X);
    ppdata_dtw.RF_Bowl.RobotPos.Y = pp_DTW(ppdata_res.RF_Bowl.RobotPos.Y);
    ppdata_dtw.RF_Bowl.RobotPos.Z = pp_DTW(ppdata_res.RF_Bowl.RobotPos.Z);
    close all;
    
    disp('      >>>> Robot Orientation');
    ppdata_dtw.RF_Bowl.RobotPos.RX = pp_DTW(ppdata_res.RF_Bowl.RobotPos.RX);
    ppdata_dtw.RF_Bowl.RobotPos.RY = pp_DTW(ppdata_res.RF_Bowl.RobotPos.RY);
    ppdata_dtw.RF_Bowl.RobotPos.RZ = pp_DTW(ppdata_res.RF_Bowl.RobotPos.RZ);
    ppdata_dtw.RF_Bowl.RobotPos.RW = pp_DTW(ppdata_res.RF_Bowl.RobotPos.RW);
    close all;
    
    disp('      >>>> Tool Position');
    ppdata_dtw.RF_Bowl.ToolPos.X = pp_DTW(ppdata_res.RF_Bowl.ToolPos.X);
    ppdata_dtw.RF_Bowl.ToolPos.Y = pp_DTW(ppdata_res.RF_Bowl.ToolPos.Y);
    ppdata_dtw.RF_Bowl.ToolPos.Z = pp_DTW(ppdata_res.RF_Bowl.ToolPos.Z);
    close all;
    
    disp('      >>>> Tool Orientation');
    ppdata_dtw.RF_Bowl.ToolPos.RX = pp_DTW(ppdata_res.RF_Bowl.ToolPos.RX);
    ppdata_dtw.RF_Bowl.ToolPos.RY = pp_DTW(ppdata_res.RF_Bowl.ToolPos.RY);
    ppdata_dtw.RF_Bowl.ToolPos.RZ = pp_DTW(ppdata_res.RF_Bowl.ToolPos.RZ);
    ppdata_dtw.RF_Bowl.ToolPos.RW = pp_DTW(ppdata_res.RF_Bowl.ToolPos.RW);
    close all;
    
    disp('      >>>> Wrist Position');
    ppdata_dtw.RF_Bowl.HumanWristPos.X = pp_DTW(ppdata_res.RF_Bowl.HumanWristPos.X);
    ppdata_dtw.RF_Bowl.HumanWristPos.Y = pp_DTW(ppdata_res.RF_Bowl.HumanWristPos.Y);
    ppdata_dtw.RF_Bowl.HumanWristPos.Z = pp_DTW(ppdata_res.RF_Bowl.HumanWristPos.Z);
    close all;
    
    disp('      >>>> Wrist Orientation');
    ppdata_dtw.RF_Bowl.HumanWristPos.RX = pp_DTW(ppdata_res.RF_Bowl.HumanWristPos.RX);
    ppdata_dtw.RF_Bowl.HumanWristPos.RY = pp_DTW(ppdata_res.RF_Bowl.HumanWristPos.RY);
    ppdata_dtw.RF_Bowl.HumanWristPos.RZ = pp_DTW(ppdata_res.RF_Bowl.HumanWristPos.RZ);
    ppdata_dtw.RF_Bowl.HumanWristPos.RW = pp_DTW(ppdata_res.RF_Bowl.HumanWristPos.RW);
    close all;
    
    disp(' =========================================================== ');
    disp(' ============         RF Robot        ====================== ');
    disp(' =========================================================== ');
    
    disp('      >>>> Tool Position');
    ppdata_dtw.RF_Robot.ToolPos.X = pp_DTW(ppdata_res.RF_Robot.ToolPos.X);
    ppdata_dtw.RF_Robot.ToolPos.Y = pp_DTW(ppdata_res.RF_Robot.ToolPos.Y);
    ppdata_dtw.RF_Robot.ToolPos.Z = pp_DTW(ppdata_res.RF_Robot.ToolPos.Z);
    close all;
    
    disp('      >>>> Tool Orientation');
    ppdata_dtw.RF_Robot.ToolPos.RX = pp_DTW(ppdata_res.RF_Robot.ToolPos.RX);
    ppdata_dtw.RF_Robot.ToolPos.RY = pp_DTW(ppdata_res.RF_Robot.ToolPos.RY);
    ppdata_dtw.RF_Robot.ToolPos.RZ = pp_DTW(ppdata_res.RF_Robot.ToolPos.RZ);
    ppdata_dtw.RF_Robot.ToolPos.RW = pp_DTW(ppdata_res.RF_Robot.ToolPos.RW);
    close all;
    
    disp('      >>>> Wrist Position');
    ppdata_dtw.RF_Robot.HumanWristPos.X = pp_DTW(ppdata_res.RF_Robot.HumanWristPos.X);
    ppdata_dtw.RF_Robot.HumanWristPos.Y = pp_DTW(ppdata_res.RF_Robot.HumanWristPos.Y);
    ppdata_dtw.RF_Robot.HumanWristPos.Z = pp_DTW(ppdata_res.RF_Robot.HumanWristPos.Z);
    close all;
    
    disp('      >>>> Wrist Orientation');
    ppdata_dtw.RF_Robot.HumanWristPos.RX = pp_DTW(ppdata_res.RF_Robot.HumanWristPos.RX);
    ppdata_dtw.RF_Robot.HumanWristPos.RY = pp_DTW(ppdata_res.RF_Robot.HumanWristPos.RY);
    ppdata_dtw.RF_Robot.HumanWristPos.RZ = pp_DTW(ppdata_res.RF_Robot.HumanWristPos.RZ);
    ppdata_dtw.RF_Robot.HumanWristPos.RW = pp_DTW(ppdata_res.RF_Robot.HumanWristPos.RW);
    close all;
    
    disp(' =========================================================== ');
    disp(' ============         RF Tool         ====================== ');
    disp(' =========================================================== ');
    
    disp('      >>>> Robot Position');
    ppdata_dtw.RF_Tool.RobotPos.X = pp_DTW(ppdata_res.RF_Tool.RobotPos.X);
    ppdata_dtw.RF_Tool.RobotPos.Y = pp_DTW(ppdata_res.RF_Tool.RobotPos.Y);
    ppdata_dtw.RF_Tool.RobotPos.Z = pp_DTW(ppdata_res.RF_Tool.RobotPos.Z);
    close all;
    
    disp('      >>>> Robot Orientation');
    ppdata_dtw.RF_Tool.RobotPos.RX = pp_DTW(ppdata_res.RF_Tool.RobotPos.RX);
    ppdata_dtw.RF_Tool.RobotPos.RY = pp_DTW(ppdata_res.RF_Tool.RobotPos.RY);
    ppdata_dtw.RF_Tool.RobotPos.RZ = pp_DTW(ppdata_res.RF_Tool.RobotPos.RZ);
    ppdata_dtw.RF_Tool.RobotPos.RW = pp_DTW(ppdata_res.RF_Tool.RobotPos.RW);
    close all;
    
    disp('      >>>> Wrist Position');
    ppdata_dtw.RF_Tool.HumanWristPos.X = pp_DTW(ppdata_res.RF_Tool.HumanWristPos.X);
    ppdata_dtw.RF_Tool.HumanWristPos.Y = pp_DTW(ppdata_res.RF_Tool.HumanWristPos.Y);
    ppdata_dtw.RF_Tool.HumanWristPos.Z = pp_DTW(ppdata_res.RF_Tool.HumanWristPos.Z);
    close all;
    
    disp('      >>>> Wrist Orientation');
    ppdata_dtw.RF_Tool.HumanWristPos.RX = pp_DTW(ppdata_res.RF_Tool.HumanWristPos.RX);
    ppdata_dtw.RF_Tool.HumanWristPos.RY = pp_DTW(ppdata_res.RF_Tool.HumanWristPos.RY);
    ppdata_dtw.RF_Tool.HumanWristPos.RZ = pp_DTW(ppdata_res.RF_Tool.HumanWristPos.RZ);
    ppdata_dtw.RF_Tool.HumanWristPos.RW = pp_DTW(ppdata_res.RF_Tool.HumanWristPos.RW);
    close all;
    
    disp(' =========================================================== ');
    disp(' ============         RF Wrist        ====================== ');
    disp(' =========================================================== ');
    
    disp('      >>>> Robot Position');
    ppdata_dtw.RF_HumanWrist.RobotPos.X = pp_DTW(ppdata_res.RF_HumanWrist.RobotPos.X);
    ppdata_dtw.RF_HumanWrist.RobotPos.Y = pp_DTW(ppdata_res.RF_HumanWrist.RobotPos.Y);
    ppdata_dtw.RF_HumanWrist.RobotPos.Z = pp_DTW(ppdata_res.RF_HumanWrist.RobotPos.Z);
    close all;
    
    disp('      >>>> Robot Orientation');
    ppdata_dtw.RF_HumanWrist.RobotPos.RX = pp_DTW(ppdata_res.RF_HumanWrist.RobotPos.RX);
    ppdata_dtw.RF_HumanWrist.RobotPos.RY = pp_DTW(ppdata_res.RF_HumanWrist.RobotPos.RY);
    ppdata_dtw.RF_HumanWrist.RobotPos.RZ = pp_DTW(ppdata_res.RF_HumanWrist.RobotPos.RZ);
    ppdata_dtw.RF_HumanWrist.RobotPos.RW = pp_DTW(ppdata_res.RF_HumanWrist.RobotPos.RW);
    close all;
    
    disp('      >>>> Tool Position');
    ppdata_dtw.RF_HumanWrist.ToolPos.X = pp_DTW(ppdata_res.RF_HumanWrist.ToolPos.X);
    ppdata_dtw.RF_HumanWrist.ToolPos.Y = pp_DTW(ppdata_res.RF_HumanWrist.ToolPos.Y);
    ppdata_dtw.RF_HumanWrist.ToolPos.Z = pp_DTW(ppdata_res.RF_HumanWrist.ToolPos.Z);
    close all;
    
    disp('      >>>> Tool Orientation');
    ppdata_dtw.RF_HumanWrist.ToolPos.RX = pp_DTW(ppdata_res.RF_HumanWrist.ToolPos.RX);
    ppdata_dtw.RF_HumanWrist.ToolPos.RY = pp_DTW(ppdata_res.RF_HumanWrist.ToolPos.RY);
    ppdata_dtw.RF_HumanWrist.ToolPos.RZ = pp_DTW(ppdata_res.RF_HumanWrist.ToolPos.RZ);
    ppdata_dtw.RF_HumanWrist.ToolPos.RW = pp_DTW(ppdata_res.RF_HumanWrist.ToolPos.RW);
    close all;
    
    sfoutname = sprintf('S%.2d_ppdata_dtw.mat', snum);
    save(sfoutname, 'ppdata_dtw', '-mat');
    
    clear ppdata_dtw ppdata_res
    
end