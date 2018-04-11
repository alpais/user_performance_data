

for snum = 44:47
    
    sfname = sprintf('S%.2d_ppdata_res.mat',snum);
    load(sfname); disp(sfname);
    
    % Robot in World
    sfigname = sprintf('S%d Motion in RF_Bowl', snum);
    figure('Name', sfigname, 'NumberTitle', 'off', 'Color', 'w'); hold on;
    
    subplot(6,3, 1); hold on; plot(ppdata_res.RF_Bowl.RobotPos.X'); ylabel('X'); title('Robot in RF_Bowl');
    subplot(6,3, 4); hold on; plot(ppdata_res.RF_Bowl.RobotPos.Y'); ylabel('Y');
    subplot(6,3, 7); hold on; plot(ppdata_res.RF_Bowl.RobotPos.Z'); ylabel('Z');
    
    subplot(6,3,10); hold on; plot(ppdata_res.RF_Bowl.RobotPos.RX'); ylabel('RX');
    subplot(6,3,13); hold on; plot(ppdata_res.RF_Bowl.RobotPos.RY'); ylabel('RY');
    subplot(6,3,16); hold on; plot(ppdata_res.RF_Bowl.RobotPos.RZ'); ylabel('RZ');
  
    % Tool in World   
    subplot(6,3, 2); hold on; plot(ppdata_res.RF_Bowl.ToolPos.X'); ylabel('X'); title('Tool in RF_Bowl');
    subplot(6,3, 5); hold on; plot(ppdata_res.RF_Bowl.ToolPos.Y'); ylabel('Y');
    subplot(6,3, 8); hold on; plot(ppdata_res.RF_Bowl.ToolPos.Z'); ylabel('Z');
    
    subplot(6,3,11); hold on; plot(ppdata_res.RF_Bowl.ToolPos.RX'); ylabel('RX');
    subplot(6,3,14); hold on; plot(ppdata_res.RF_Bowl.ToolPos.RY'); ylabel('RY');
    subplot(6,3,17); hold on; plot(ppdata_res.RF_Bowl.ToolPos.RZ'); ylabel('RZ');
       
    % Wrist in World
    subplot(6,3, 3); hold on; plot(ppdata_res.RF_Bowl.HumanWristPos.X'); ylabel('X'); title('Wrist in RF_Bowl');
    subplot(6,3, 6); hold on; plot(ppdata_res.RF_Bowl.HumanWristPos.Y'); ylabel('Y');
    subplot(6,3, 9); hold on; plot(ppdata_res.RF_Bowl.HumanWristPos.Z'); ylabel('Z');
    
    subplot(6,3,12); hold on; plot(ppdata_res.RF_Bowl.HumanWristPos.RX'); ylabel('RX');
    subplot(6,3,15); hold on; plot(ppdata_res.RF_Bowl.HumanWristPos.RY'); ylabel('RY');
    subplot(6,3,18); hold on; plot(ppdata_res.RF_Bowl.HumanWristPos.RZ'); ylabel('RZ');
    
    sfigout = sprintf('S%.2d_RF_Bowl.fig',snum);
    savefig(sfigout);
    
%     pause();
%     close all; 
    clear all;
end