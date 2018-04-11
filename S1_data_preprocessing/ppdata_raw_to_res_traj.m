%%

% TODO: 
% >> Add forces
% >> Remove excepted demos
% >> Append hand data - tactile and JA
% >> dtw

%%
bDisplayBasicPlotting = true;

sf = 150;

for snum  = 49:52
    sfigname = sprintf('S%d Robot Motion in World RF', snum); disp(sfigname);
    figure('Name', sfigname, 'NumberTitle', 'off', 'Color', 'w'); hold on;
    sfname = sprintf('../../rawdata_sensors_parsed/traj/S%.2d_rawdata',snum);
    load(sfname);
    
    %ndem = 10;
     ndem  = length(rawdata);
    
    for i = 1:ndem
        if ismember(i, excepted_demos{snum})
            continue
        else
            % get max length
            task_demo_len(i) = size(rawdata{i}.RF_World.RobotPos,1);
        end
        
        if bDisplayBasicPlotting
            % Plot Robot Pos X Y Z - in World RF
            % Bowl
            subplot(3,3,1); hold on; plot(smooth(rawdata{i}.RF_World.RobotPos(:,1),sf)); ylabel('X'); title('Robot');
            subplot(3,3,4); hold on; plot(smooth(rawdata{i}.RF_World.RobotPos(:,2),sf)); ylabel('Y');
            subplot(3,3,7); hold on; plot(smooth(rawdata{i}.RF_World.RobotPos(:,3),sf)); ylabel('Z');
            
            % Wrist
            subplot(3,3,2); hold on; plot(smooth(rawdata{i}.RF_World.HumanWristPos(:,1),sf)); ylabel('X'); title('Human Wrist');
            subplot(3,3,5); hold on; plot(smooth(rawdata{i}.RF_World.HumanWristPos(:,2),sf)); ylabel('Y');
            subplot(3,3,8); hold on; plot(smooth(rawdata{i}.RF_World.HumanWristPos(:,3),sf)); ylabel('Z');
            
            % Tool
            subplot(3,3,3); hold on; plot(smooth(rawdata{i}.RF_World.ToolPos(:,1),sf)); ylabel('X'); title('Tool');
            subplot(3,3,6); hold on; plot(smooth(rawdata{i}.RF_World.ToolPos(:,2),sf)); ylabel('Y');
            subplot(3,3,9); hold on; plot(smooth(rawdata{i}.RF_World.ToolPos(:,3),sf)); ylabel('Z');
        end
    end
    
    max_demo_len = max(task_demo_len);
    
%%    
    for i = 1:ndem

        % ============== Smoothing Positions ====================
        for jk = 1:3
            % RF World
            rawdata{i}.RF_World.RobotPos(:,jk)      = smooth(rawdata{i}.RF_World.RobotPos(:,jk),sf);
            rawdata{i}.RF_World.HumanWristPos(:,jk) = smooth(rawdata{i}.RF_World.HumanWristPos(:,jk),sf);
            rawdata{i}.RF_World.ToolPos(:,jk)       = smooth(rawdata{i}.RF_World.ToolPos(:,jk),sf);
            rawdata{i}.RF_World.BowlPos(:,jk)       = smooth(rawdata{i}.RF_World.BowlPos(:,jk),sf);
            
            % RF Bowl
            rawdata{i}.RF_Bowl.RobotPos(:,jk)       = smooth(rawdata{i}.RF_Bowl.RobotPos(:,jk),sf);
            rawdata{i}.RF_Bowl.HumanWristPos(:,jk)  = smooth(rawdata{i}.RF_Bowl.HumanWristPos(:,jk),sf);
            rawdata{i}.RF_Bowl.ToolPos(:,jk)        = smooth(rawdata{i}.RF_Bowl.ToolPos(:,jk),sf);
            
            % RF Wrist
            rawdata{i}.RF_HumanWrist.RobotPos(:,jk) = smooth(rawdata{i}.RF_HumanWrist.RobotPos(:,jk),sf);
            rawdata{i}.RF_HumanWrist.ToolPos(:,jk)  = smooth(rawdata{i}.RF_HumanWrist.ToolPos(:,jk),sf);
            rawdata{i}.RF_HumanWrist.BowlPos(:,jk)  = smooth(rawdata{i}.RF_HumanWrist.BowlPos(:,jk),sf);
            
            % RF Tool
            rawdata{i}.RF_Tool.RobotPos(:,jk)       = smooth(rawdata{i}.RF_Tool.RobotPos(:,jk),sf);
            rawdata{i}.RF_Tool.HumanWristPos(:,jk)  = smooth(rawdata{i}.RF_Tool.HumanWristPos(:,jk),sf);
            rawdata{i}.RF_Tool.BowlPos(:,jk)        = smooth(rawdata{i}.RF_Tool.BowlPos(:,jk),sf);
            
            % RF Robot
            rawdata{i}.RF_Robot.HumanWristPos(:,jk) = smooth(rawdata{i}.RF_Robot.HumanWristPos(:,jk),sf);
            rawdata{i}.RF_Robot.ToolPos(:,jk)       = smooth(rawdata{i}.RF_Robot.ToolPos(:,jk),sf);
            rawdata{i}.RF_Robot.BowlPos(:,jk)       = smooth(rawdata{i}.RF_Robot.BowlPos(:,jk),sf);
        end
        
        % ============== Smoothing Rotations ====================
        for jk = 1:4
            % RF World
            rawdata{i}.RF_World.RobotRot(:,jk)      = smooth(rawdata{i}.RF_World.RobotRot(:,jk),sf);
            rawdata{i}.RF_World.HumanWristRot(:,jk) = smooth(rawdata{i}.RF_World.HumanWristRot(:,jk),sf);
            rawdata{i}.RF_World.ToolRot(:,jk)       = smooth(rawdata{i}.RF_World.ToolRot(:,jk),sf);
            rawdata{i}.RF_World.BowlRot(:,jk)       = smooth(rawdata{i}.RF_World.BowlRot(:,jk),sf);
            
            % RF Bowl
            rawdata{i}.RF_Bowl.RobotRot(:,jk)       = smooth(rawdata{i}.RF_Bowl.RobotRot(:,jk),sf);
            rawdata{i}.RF_Bowl.HumanWristRot(:,jk)  = smooth(rawdata{i}.RF_Bowl.HumanWristRot(:,jk),sf);
            rawdata{i}.RF_Bowl.ToolRot(:,jk)        = smooth(rawdata{i}.RF_Bowl.ToolRot(:,jk),sf);
            
            % RF Wrist
            rawdata{i}.RF_HumanWrist.RobotRot(:,jk) = smooth(rawdata{i}.RF_HumanWrist.RobotRot(:,jk),sf);
            rawdata{i}.RF_HumanWrist.ToolRot(:,jk)  = smooth(rawdata{i}.RF_HumanWrist.ToolRot(:,jk),sf);
            rawdata{i}.RF_HumanWrist.BowlRot(:,jk)  = smooth(rawdata{i}.RF_HumanWrist.BowlRot(:,jk),sf);
            
            % RF Tool
            rawdata{i}.RF_Tool.RobotRot(:,jk)       = smooth(rawdata{i}.RF_Tool.RobotRot(:,jk),sf);
            rawdata{i}.RF_Tool.HumanWristRot(:,jk)  = smooth(rawdata{i}.RF_Tool.HumanWristRot(:,jk),sf);
            rawdata{i}.RF_Tool.BowlRot(:,jk)        = smooth(rawdata{i}.RF_Tool.BowlRot(:,jk),sf);
            
            % RF Robot
            rawdata{i}.RF_Robot.HumanWristRot(:,jk) = smooth(rawdata{i}.RF_Robot.HumanWristRot(:,jk),sf);
            rawdata{i}.RF_Robot.ToolRot(:,jk)       = smooth(rawdata{i}.RF_Robot.ToolRot(:,jk),sf);
            rawdata{i}.RF_Robot.BowlRot(:,jk)       = smooth(rawdata{i}.RF_Robot.BowlRot(:,jk),sf);
        end
        
        % =================== Resizing ===================
        
        % ===== RF World ====
        % Robot
        ppdata_res.RF_World.RobotPos.X(i,:) = spline(1:length(rawdata{i}.RF_World.RobotPos(:,1)), rawdata{i}.RF_World.RobotPos(:,1), linspace(1, length(rawdata{i}.RF_World.RobotPos(:,1)), max_demo_len));
        ppdata_res.RF_World.RobotPos.Y(i,:) = spline(1:length(rawdata{i}.RF_World.RobotPos(:,2)), rawdata{i}.RF_World.RobotPos(:,2), linspace(1, length(rawdata{i}.RF_World.RobotPos(:,2)), max_demo_len));
        ppdata_res.RF_World.RobotPos.Z(i,:) = spline(1:length(rawdata{i}.RF_World.RobotPos(:,3)), rawdata{i}.RF_World.RobotPos(:,3), linspace(1, length(rawdata{i}.RF_World.RobotPos(:,3)), max_demo_len));
        
        ppdata_res.RF_World.RobotPos.RX(i,:) = spline(1:length(rawdata{i}.RF_World.RobotRot(:,1)), rawdata{i}.RF_World.RobotRot(:,1), linspace(1, length(rawdata{i}.RF_World.RobotRot(:,1)), max_demo_len));
        ppdata_res.RF_World.RobotPos.RY(i,:) = spline(1:length(rawdata{i}.RF_World.RobotRot(:,2)), rawdata{i}.RF_World.RobotRot(:,2), linspace(1, length(rawdata{i}.RF_World.RobotRot(:,2)), max_demo_len));
        ppdata_res.RF_World.RobotPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_World.RobotRot(:,3)), rawdata{i}.RF_World.RobotRot(:,3), linspace(1, length(rawdata{i}.RF_World.RobotRot(:,3)), max_demo_len));
        ppdata_res.RF_World.RobotPos.RW(i,:) = spline(1:length(rawdata{i}.RF_World.RobotRot(:,4)), rawdata{i}.RF_World.RobotRot(:,4), linspace(1, length(rawdata{i}.RF_World.RobotRot(:,4)), max_demo_len));
        
        % Tool
        ppdata_res.RF_World.ToolPos.X(i,:) = spline(1:length(rawdata{i}.RF_World.ToolPos(:,1)), rawdata{i}.RF_World.ToolPos(:,1), linspace(1, length(rawdata{i}.RF_World.ToolPos(:,1)), max_demo_len));
        ppdata_res.RF_World.ToolPos.Y(i,:) = spline(1:length(rawdata{i}.RF_World.ToolPos(:,2)), rawdata{i}.RF_World.ToolPos(:,2), linspace(1, length(rawdata{i}.RF_World.ToolPos(:,2)), max_demo_len));
        ppdata_res.RF_World.ToolPos.Z(i,:) = spline(1:length(rawdata{i}.RF_World.ToolPos(:,3)), rawdata{i}.RF_World.ToolPos(:,3), linspace(1, length(rawdata{i}.RF_World.ToolPos(:,3)), max_demo_len));
        
        ppdata_res.RF_World.ToolPos.RX(i,:) = spline(1:length(rawdata{i}.RF_World.ToolRot(:,1)), rawdata{i}.RF_World.ToolRot(:,1), linspace(1, length(rawdata{i}.RF_World.ToolRot(:,1)), max_demo_len));
        ppdata_res.RF_World.ToolPos.RY(i,:) = spline(1:length(rawdata{i}.RF_World.ToolRot(:,2)), rawdata{i}.RF_World.ToolRot(:,2), linspace(1, length(rawdata{i}.RF_World.ToolRot(:,2)), max_demo_len));
        ppdata_res.RF_World.ToolPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_World.ToolRot(:,3)), rawdata{i}.RF_World.ToolRot(:,3), linspace(1, length(rawdata{i}.RF_World.ToolRot(:,3)), max_demo_len));
        ppdata_res.RF_World.ToolPos.RW(i,:) = spline(1:length(rawdata{i}.RF_World.ToolRot(:,4)), rawdata{i}.RF_World.ToolRot(:,4), linspace(1, length(rawdata{i}.RF_World.ToolRot(:,4)), max_demo_len));
        
        % Human Wrist
        ppdata_res.RF_World.HumanWristPos.X(i,:) = spline(1:length(rawdata{i}.RF_World.HumanWristPos(:,1)), rawdata{i}.RF_World.HumanWristPos(:,1), linspace(1, length(rawdata{i}.RF_World.HumanWristPos(:,1)), max_demo_len));
        ppdata_res.RF_World.HumanWristPos.Y(i,:) = spline(1:length(rawdata{i}.RF_World.HumanWristPos(:,2)), rawdata{i}.RF_World.HumanWristPos(:,2), linspace(1, length(rawdata{i}.RF_World.HumanWristPos(:,2)), max_demo_len));
        ppdata_res.RF_World.HumanWristPos.Z(i,:) = spline(1:length(rawdata{i}.RF_World.HumanWristPos(:,3)), rawdata{i}.RF_World.HumanWristPos(:,3), linspace(1, length(rawdata{i}.RF_World.HumanWristPos(:,3)), max_demo_len));
        
        ppdata_res.RF_World.HumanWristPos.RX(i,:) = spline(1:length(rawdata{i}.RF_World.HumanWristRot(:,1)), rawdata{i}.RF_World.HumanWristRot(:,1), linspace(1, length(rawdata{i}.RF_World.HumanWristRot(:,1)), max_demo_len));
        ppdata_res.RF_World.HumanWristPos.RY(i,:) = spline(1:length(rawdata{i}.RF_World.HumanWristRot(:,2)), rawdata{i}.RF_World.HumanWristRot(:,2), linspace(1, length(rawdata{i}.RF_World.HumanWristRot(:,2)), max_demo_len));
        ppdata_res.RF_World.HumanWristPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_World.HumanWristRot(:,3)), rawdata{i}.RF_World.HumanWristRot(:,3), linspace(1, length(rawdata{i}.RF_World.HumanWristRot(:,3)), max_demo_len));
        ppdata_res.RF_World.HumanWristPos.RW(i,:) = spline(1:length(rawdata{i}.RF_World.HumanWristRot(:,4)), rawdata{i}.RF_World.HumanWristRot(:,4), linspace(1, length(rawdata{i}.RF_World.HumanWristRot(:,4)), max_demo_len));
        
        % Bowl
        ppdata_res.RF_World.BowlPos.X(i,:) = spline(1:length(rawdata{i}.RF_World.BowlPos(:,1)), rawdata{i}.RF_World.BowlPos(:,1), linspace(1, length(rawdata{i}.RF_World.BowlPos(:,1)), max_demo_len));
        ppdata_res.RF_World.BowlPos.Y(i,:) = spline(1:length(rawdata{i}.RF_World.BowlPos(:,2)), rawdata{i}.RF_World.BowlPos(:,2), linspace(1, length(rawdata{i}.RF_World.BowlPos(:,2)), max_demo_len));
        ppdata_res.RF_World.BowlPos.Z(i,:) = spline(1:length(rawdata{i}.RF_World.BowlPos(:,3)), rawdata{i}.RF_World.BowlPos(:,3), linspace(1, length(rawdata{i}.RF_World.BowlPos(:,3)), max_demo_len));
        
        ppdata_res.RF_World.BowlPos.RX(i,:) = spline(1:length(rawdata{i}.RF_World.BowlRot(:,1)), rawdata{i}.RF_World.BowlRot(:,1), linspace(1, length(rawdata{i}.RF_World.BowlRot(:,1)), max_demo_len));
        ppdata_res.RF_World.BowlPos.RY(i,:) = spline(1:length(rawdata{i}.RF_World.BowlRot(:,2)), rawdata{i}.RF_World.BowlRot(:,2), linspace(1, length(rawdata{i}.RF_World.BowlRot(:,2)), max_demo_len));
        ppdata_res.RF_World.BowlPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_World.BowlRot(:,3)), rawdata{i}.RF_World.BowlRot(:,3), linspace(1, length(rawdata{i}.RF_World.BowlRot(:,3)), max_demo_len));
        ppdata_res.RF_World.BowlPos.RW(i,:) = spline(1:length(rawdata{i}.RF_World.BowlRot(:,4)), rawdata{i}.RF_World.BowlRot(:,4), linspace(1, length(rawdata{i}.RF_World.BowlRot(:,4)), max_demo_len));
        
        % ===== RF Bowl ====
        % Robot
        ppdata_res.RF_Bowl.RobotPos.X(i,:) = spline(1:length(rawdata{i}.RF_Bowl.RobotPos(:,1)), rawdata{i}.RF_Bowl.RobotPos(:,1), linspace(1, length(rawdata{i}.RF_Bowl.RobotPos(:,1)), max_demo_len));
        ppdata_res.RF_Bowl.RobotPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Bowl.RobotPos(:,2)), rawdata{i}.RF_Bowl.RobotPos(:,2), linspace(1, length(rawdata{i}.RF_Bowl.RobotPos(:,2)), max_demo_len));
        ppdata_res.RF_Bowl.RobotPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Bowl.RobotPos(:,3)), rawdata{i}.RF_Bowl.RobotPos(:,3), linspace(1, length(rawdata{i}.RF_Bowl.RobotPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Bowl.RobotPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Bowl.RobotRot(:,1)), rawdata{i}.RF_Bowl.RobotRot(:,1), linspace(1, length(rawdata{i}.RF_Bowl.RobotRot(:,1)), max_demo_len));
        ppdata_res.RF_Bowl.RobotPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Bowl.RobotRot(:,2)), rawdata{i}.RF_Bowl.RobotRot(:,2), linspace(1, length(rawdata{i}.RF_Bowl.RobotRot(:,2)), max_demo_len));
        ppdata_res.RF_Bowl.RobotPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Bowl.RobotRot(:,3)), rawdata{i}.RF_Bowl.RobotRot(:,3), linspace(1, length(rawdata{i}.RF_Bowl.RobotRot(:,3)), max_demo_len));
        ppdata_res.RF_Bowl.RobotPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Bowl.RobotRot(:,4)), rawdata{i}.RF_Bowl.RobotRot(:,4), linspace(1, length(rawdata{i}.RF_Bowl.RobotRot(:,4)), max_demo_len));
        
        % Tool
        ppdata_res.RF_Bowl.ToolPos.X(i,:) = spline(1:length(rawdata{i}.RF_Bowl.ToolPos(:,1)), rawdata{i}.RF_Bowl.ToolPos(:,1), linspace(1, length(rawdata{i}.RF_Bowl.ToolPos(:,1)), max_demo_len));
        ppdata_res.RF_Bowl.ToolPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Bowl.ToolPos(:,2)), rawdata{i}.RF_Bowl.ToolPos(:,2), linspace(1, length(rawdata{i}.RF_Bowl.ToolPos(:,2)), max_demo_len));
        ppdata_res.RF_Bowl.ToolPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Bowl.ToolPos(:,3)), rawdata{i}.RF_Bowl.ToolPos(:,3), linspace(1, length(rawdata{i}.RF_Bowl.ToolPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Bowl.ToolPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Bowl.ToolRot(:,1)), rawdata{i}.RF_Bowl.ToolRot(:,1), linspace(1, length(rawdata{i}.RF_Bowl.ToolRot(:,1)), max_demo_len));
        ppdata_res.RF_Bowl.ToolPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Bowl.ToolRot(:,2)), rawdata{i}.RF_Bowl.ToolRot(:,2), linspace(1, length(rawdata{i}.RF_Bowl.ToolRot(:,2)), max_demo_len));
        ppdata_res.RF_Bowl.ToolPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Bowl.ToolRot(:,3)), rawdata{i}.RF_Bowl.ToolRot(:,3), linspace(1, length(rawdata{i}.RF_Bowl.ToolRot(:,3)), max_demo_len));
        ppdata_res.RF_Bowl.ToolPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Bowl.ToolRot(:,4)), rawdata{i}.RF_Bowl.ToolRot(:,4), linspace(1, length(rawdata{i}.RF_Bowl.ToolRot(:,4)), max_demo_len));
        
        % Human Wrist
        ppdata_res.RF_Bowl.HumanWristPos.X(i,:) = spline(1:length(rawdata{i}.RF_Bowl.HumanWristPos(:,1)), rawdata{i}.RF_Bowl.HumanWristPos(:,1), linspace(1, length(rawdata{i}.RF_Bowl.HumanWristPos(:,1)), max_demo_len));
        ppdata_res.RF_Bowl.HumanWristPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Bowl.HumanWristPos(:,2)), rawdata{i}.RF_Bowl.HumanWristPos(:,2), linspace(1, length(rawdata{i}.RF_Bowl.HumanWristPos(:,2)), max_demo_len));
        ppdata_res.RF_Bowl.HumanWristPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Bowl.HumanWristPos(:,3)), rawdata{i}.RF_Bowl.HumanWristPos(:,3), linspace(1, length(rawdata{i}.RF_Bowl.HumanWristPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Bowl.HumanWristPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Bowl.HumanWristRot(:,1)), rawdata{i}.RF_Bowl.HumanWristRot(:,1), linspace(1, length(rawdata{i}.RF_Bowl.HumanWristRot(:,1)), max_demo_len));
        ppdata_res.RF_Bowl.HumanWristPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Bowl.HumanWristRot(:,2)), rawdata{i}.RF_Bowl.HumanWristRot(:,2), linspace(1, length(rawdata{i}.RF_Bowl.HumanWristRot(:,2)), max_demo_len));
        ppdata_res.RF_Bowl.HumanWristPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Bowl.HumanWristRot(:,3)), rawdata{i}.RF_Bowl.HumanWristRot(:,3), linspace(1, length(rawdata{i}.RF_Bowl.HumanWristRot(:,3)), max_demo_len));
        ppdata_res.RF_Bowl.HumanWristPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Bowl.HumanWristRot(:,4)), rawdata{i}.RF_Bowl.HumanWristRot(:,4), linspace(1, length(rawdata{i}.RF_Bowl.HumanWristRot(:,4)), max_demo_len));
        
        % ===== RF Tool ====
        % Robot
        ppdata_res.RF_Tool.RobotPos.X(i,:) = spline(1:length(rawdata{i}.RF_Tool.RobotPos(:,1)), rawdata{i}.RF_Tool.RobotPos(:,1), linspace(1, length(rawdata{i}.RF_Tool.RobotPos(:,1)), max_demo_len));
        ppdata_res.RF_Tool.RobotPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Tool.RobotPos(:,2)), rawdata{i}.RF_Tool.RobotPos(:,2), linspace(1, length(rawdata{i}.RF_Tool.RobotPos(:,2)), max_demo_len));
        ppdata_res.RF_Tool.RobotPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Tool.RobotPos(:,3)), rawdata{i}.RF_Tool.RobotPos(:,3), linspace(1, length(rawdata{i}.RF_Tool.RobotPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Tool.RobotPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Tool.RobotRot(:,1)), rawdata{i}.RF_Tool.RobotRot(:,1), linspace(1, length(rawdata{i}.RF_Tool.RobotRot(:,1)), max_demo_len));
        ppdata_res.RF_Tool.RobotPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Tool.RobotRot(:,2)), rawdata{i}.RF_Tool.RobotRot(:,2), linspace(1, length(rawdata{i}.RF_Tool.RobotRot(:,2)), max_demo_len));
        ppdata_res.RF_Tool.RobotPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Tool.RobotRot(:,3)), rawdata{i}.RF_Tool.RobotRot(:,3), linspace(1, length(rawdata{i}.RF_Tool.RobotRot(:,3)), max_demo_len));
        ppdata_res.RF_Tool.RobotPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Tool.RobotRot(:,4)), rawdata{i}.RF_Tool.RobotRot(:,4), linspace(1, length(rawdata{i}.RF_Tool.RobotRot(:,4)), max_demo_len));
        
        % Human Wrist
        ppdata_res.RF_Tool.HumanWristPos.X(i,:) = spline(1:length(rawdata{i}.RF_Tool.HumanWristPos(:,1)), rawdata{i}.RF_Tool.HumanWristPos(:,1), linspace(1, length(rawdata{i}.RF_Tool.HumanWristPos(:,1)), max_demo_len));
        ppdata_res.RF_Tool.HumanWristPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Tool.HumanWristPos(:,2)), rawdata{i}.RF_Tool.HumanWristPos(:,2), linspace(1, length(rawdata{i}.RF_Tool.HumanWristPos(:,2)), max_demo_len));
        ppdata_res.RF_Tool.HumanWristPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Tool.HumanWristPos(:,3)), rawdata{i}.RF_Tool.HumanWristPos(:,3), linspace(1, length(rawdata{i}.RF_Tool.HumanWristPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Tool.HumanWristPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Tool.HumanWristRot(:,1)), rawdata{i}.RF_Tool.HumanWristRot(:,1), linspace(1, length(rawdata{i}.RF_Tool.HumanWristRot(:,1)), max_demo_len));
        ppdata_res.RF_Tool.HumanWristPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Tool.HumanWristRot(:,2)), rawdata{i}.RF_Tool.HumanWristRot(:,2), linspace(1, length(rawdata{i}.RF_Tool.HumanWristRot(:,2)), max_demo_len));
        ppdata_res.RF_Tool.HumanWristPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Tool.HumanWristRot(:,3)), rawdata{i}.RF_Tool.HumanWristRot(:,3), linspace(1, length(rawdata{i}.RF_Tool.HumanWristRot(:,3)), max_demo_len));
        ppdata_res.RF_Tool.HumanWristPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Tool.HumanWristRot(:,4)), rawdata{i}.RF_Tool.HumanWristRot(:,4), linspace(1, length(rawdata{i}.RF_Tool.HumanWristRot(:,4)), max_demo_len));
        
        % Bowl
        ppdata_res.RF_Tool.BowlPos.X(i,:) = spline(1:length(rawdata{i}.RF_Tool.BowlPos(:,1)), rawdata{i}.RF_Tool.BowlPos(:,1), linspace(1, length(rawdata{i}.RF_Tool.BowlPos(:,1)), max_demo_len));
        ppdata_res.RF_Tool.BowlPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Tool.BowlPos(:,2)), rawdata{i}.RF_Tool.BowlPos(:,2), linspace(1, length(rawdata{i}.RF_Tool.BowlPos(:,2)), max_demo_len));
        ppdata_res.RF_Tool.BowlPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Tool.BowlPos(:,3)), rawdata{i}.RF_Tool.BowlPos(:,3), linspace(1, length(rawdata{i}.RF_Tool.BowlPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Tool.BowlPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Tool.BowlRot(:,1)), rawdata{i}.RF_Tool.BowlRot(:,1), linspace(1, length(rawdata{i}.RF_Tool.BowlRot(:,1)), max_demo_len));
        ppdata_res.RF_Tool.BowlPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Tool.BowlRot(:,2)), rawdata{i}.RF_Tool.BowlRot(:,2), linspace(1, length(rawdata{i}.RF_Tool.BowlRot(:,2)), max_demo_len));
        ppdata_res.RF_Tool.BowlPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Tool.BowlRot(:,3)), rawdata{i}.RF_Tool.BowlRot(:,3), linspace(1, length(rawdata{i}.RF_Tool.BowlRot(:,3)), max_demo_len));
        ppdata_res.RF_Tool.BowlPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Tool.BowlRot(:,4)), rawdata{i}.RF_Tool.BowlRot(:,4), linspace(1, length(rawdata{i}.RF_Tool.BowlRot(:,4)), max_demo_len));
        
        % ===== RF HumanWrist ====
        % Robot
        ppdata_res.RF_HumanWrist.RobotPos.X(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.RobotPos(:,1)), rawdata{i}.RF_HumanWrist.RobotPos(:,1), linspace(1, length(rawdata{i}.RF_HumanWrist.RobotPos(:,1)), max_demo_len));
        ppdata_res.RF_HumanWrist.RobotPos.Y(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.RobotPos(:,2)), rawdata{i}.RF_HumanWrist.RobotPos(:,2), linspace(1, length(rawdata{i}.RF_HumanWrist.RobotPos(:,2)), max_demo_len));
        ppdata_res.RF_HumanWrist.RobotPos.Z(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.RobotPos(:,3)), rawdata{i}.RF_HumanWrist.RobotPos(:,3), linspace(1, length(rawdata{i}.RF_HumanWrist.RobotPos(:,3)), max_demo_len));
        
        ppdata_res.RF_HumanWrist.RobotPos.RX(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.RobotRot(:,1)), rawdata{i}.RF_HumanWrist.RobotRot(:,1), linspace(1, length(rawdata{i}.RF_HumanWrist.RobotRot(:,1)), max_demo_len));
        ppdata_res.RF_HumanWrist.RobotPos.RY(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.RobotRot(:,2)), rawdata{i}.RF_HumanWrist.RobotRot(:,2), linspace(1, length(rawdata{i}.RF_HumanWrist.RobotRot(:,2)), max_demo_len));
        ppdata_res.RF_HumanWrist.RobotPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.RobotRot(:,3)), rawdata{i}.RF_HumanWrist.RobotRot(:,3), linspace(1, length(rawdata{i}.RF_HumanWrist.RobotRot(:,3)), max_demo_len));
        ppdata_res.RF_HumanWrist.RobotPos.RW(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.RobotRot(:,4)), rawdata{i}.RF_HumanWrist.RobotRot(:,4), linspace(1, length(rawdata{i}.RF_HumanWrist.RobotRot(:,4)), max_demo_len));
        
        % Tool
        ppdata_res.RF_HumanWrist.ToolPos.X(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.ToolPos(:,1)), rawdata{i}.RF_HumanWrist.ToolPos(:,1), linspace(1, length(rawdata{i}.RF_HumanWrist.ToolPos(:,1)), max_demo_len));
        ppdata_res.RF_HumanWrist.ToolPos.Y(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.ToolPos(:,2)), rawdata{i}.RF_HumanWrist.ToolPos(:,2), linspace(1, length(rawdata{i}.RF_HumanWrist.ToolPos(:,2)), max_demo_len));
        ppdata_res.RF_HumanWrist.ToolPos.Z(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.ToolPos(:,3)), rawdata{i}.RF_HumanWrist.ToolPos(:,3), linspace(1, length(rawdata{i}.RF_HumanWrist.ToolPos(:,3)), max_demo_len));
        
        ppdata_res.RF_HumanWrist.ToolPos.RX(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.ToolRot(:,1)), rawdata{i}.RF_HumanWrist.ToolRot(:,1), linspace(1, length(rawdata{i}.RF_HumanWrist.ToolRot(:,1)), max_demo_len));
        ppdata_res.RF_HumanWrist.ToolPos.RY(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.ToolRot(:,2)), rawdata{i}.RF_HumanWrist.ToolRot(:,2), linspace(1, length(rawdata{i}.RF_HumanWrist.ToolRot(:,2)), max_demo_len));
        ppdata_res.RF_HumanWrist.ToolPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.ToolRot(:,3)), rawdata{i}.RF_HumanWrist.ToolRot(:,3), linspace(1, length(rawdata{i}.RF_HumanWrist.ToolRot(:,3)), max_demo_len));
        ppdata_res.RF_HumanWrist.ToolPos.RW(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.ToolRot(:,4)), rawdata{i}.RF_HumanWrist.ToolRot(:,4), linspace(1, length(rawdata{i}.RF_HumanWrist.ToolRot(:,4)), max_demo_len));
        
        % Bowl
        ppdata_res.RF_HumanWrist.BowlPos.X(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.BowlPos(:,1)), rawdata{i}.RF_HumanWrist.BowlPos(:,1), linspace(1, length(rawdata{i}.RF_HumanWrist.BowlPos(:,1)), max_demo_len));
        ppdata_res.RF_HumanWrist.BowlPos.Y(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.BowlPos(:,2)), rawdata{i}.RF_HumanWrist.BowlPos(:,2), linspace(1, length(rawdata{i}.RF_HumanWrist.BowlPos(:,2)), max_demo_len));
        ppdata_res.RF_HumanWrist.BowlPos.Z(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.BowlPos(:,3)), rawdata{i}.RF_HumanWrist.BowlPos(:,3), linspace(1, length(rawdata{i}.RF_HumanWrist.BowlPos(:,3)), max_demo_len));
        
        ppdata_res.RF_HumanWrist.BowlPos.RX(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.BowlRot(:,1)), rawdata{i}.RF_HumanWrist.BowlRot(:,1), linspace(1, length(rawdata{i}.RF_HumanWrist.BowlRot(:,1)), max_demo_len));
        ppdata_res.RF_HumanWrist.BowlPos.RY(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.BowlRot(:,2)), rawdata{i}.RF_HumanWrist.BowlRot(:,2), linspace(1, length(rawdata{i}.RF_HumanWrist.BowlRot(:,2)), max_demo_len));
        ppdata_res.RF_HumanWrist.BowlPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.BowlRot(:,3)), rawdata{i}.RF_HumanWrist.BowlRot(:,3), linspace(1, length(rawdata{i}.RF_HumanWrist.BowlRot(:,3)), max_demo_len));
        ppdata_res.RF_HumanWrist.BowlPos.RW(i,:) = spline(1:length(rawdata{i}.RF_HumanWrist.BowlRot(:,4)), rawdata{i}.RF_HumanWrist.BowlRot(:,4), linspace(1, length(rawdata{i}.RF_HumanWrist.BowlRot(:,4)), max_demo_len));
        
        % ===== RF Robot ====
        % Tool
        ppdata_res.RF_Robot.ToolPos.X(i,:) = spline(1:length(rawdata{i}.RF_Robot.ToolPos(:,1)), rawdata{i}.RF_Robot.ToolPos(:,1), linspace(1, length(rawdata{i}.RF_Robot.ToolPos(:,1)), max_demo_len));
        ppdata_res.RF_Robot.ToolPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Robot.ToolPos(:,2)), rawdata{i}.RF_Robot.ToolPos(:,2), linspace(1, length(rawdata{i}.RF_Robot.ToolPos(:,2)), max_demo_len));
        ppdata_res.RF_Robot.ToolPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Robot.ToolPos(:,3)), rawdata{i}.RF_Robot.ToolPos(:,3), linspace(1, length(rawdata{i}.RF_Robot.ToolPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Robot.ToolPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Robot.ToolRot(:,1)), rawdata{i}.RF_Robot.ToolRot(:,1), linspace(1, length(rawdata{i}.RF_Robot.ToolRot(:,1)), max_demo_len));
        ppdata_res.RF_Robot.ToolPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Robot.ToolRot(:,2)), rawdata{i}.RF_Robot.ToolRot(:,2), linspace(1, length(rawdata{i}.RF_Robot.ToolRot(:,2)), max_demo_len));
        ppdata_res.RF_Robot.ToolPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Robot.ToolRot(:,3)), rawdata{i}.RF_Robot.ToolRot(:,3), linspace(1, length(rawdata{i}.RF_Robot.ToolRot(:,3)), max_demo_len));
        ppdata_res.RF_Robot.ToolPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Robot.ToolRot(:,4)), rawdata{i}.RF_Robot.ToolRot(:,4), linspace(1, length(rawdata{i}.RF_Robot.ToolRot(:,4)), max_demo_len));
        
        % Human Wrist
        ppdata_res.RF_Robot.HumanWristPos.X(i,:) = spline(1:length(rawdata{i}.RF_Robot.HumanWristPos(:,1)), rawdata{i}.RF_Robot.HumanWristPos(:,1), linspace(1, length(rawdata{i}.RF_Robot.HumanWristPos(:,1)), max_demo_len));
        ppdata_res.RF_Robot.HumanWristPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Robot.HumanWristPos(:,2)), rawdata{i}.RF_Robot.HumanWristPos(:,2), linspace(1, length(rawdata{i}.RF_Robot.HumanWristPos(:,2)), max_demo_len));
        ppdata_res.RF_Robot.HumanWristPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Robot.HumanWristPos(:,3)), rawdata{i}.RF_Robot.HumanWristPos(:,3), linspace(1, length(rawdata{i}.RF_Robot.HumanWristPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Robot.HumanWristPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Robot.HumanWristRot(:,1)), rawdata{i}.RF_Robot.HumanWristRot(:,1), linspace(1, length(rawdata{i}.RF_Robot.HumanWristRot(:,1)), max_demo_len));
        ppdata_res.RF_Robot.HumanWristPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Robot.HumanWristRot(:,2)), rawdata{i}.RF_Robot.HumanWristRot(:,2), linspace(1, length(rawdata{i}.RF_Robot.HumanWristRot(:,2)), max_demo_len));
        ppdata_res.RF_Robot.HumanWristPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Robot.HumanWristRot(:,3)), rawdata{i}.RF_Robot.HumanWristRot(:,3), linspace(1, length(rawdata{i}.RF_Robot.HumanWristRot(:,3)), max_demo_len));
        ppdata_res.RF_Robot.HumanWristPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Robot.HumanWristRot(:,4)), rawdata{i}.RF_Robot.HumanWristRot(:,4), linspace(1, length(rawdata{i}.RF_Robot.HumanWristRot(:,4)), max_demo_len));
        
        % Bowl
        ppdata_res.RF_Robot.BowlPos.X(i,:) = spline(1:length(rawdata{i}.RF_Robot.BowlPos(:,1)), rawdata{i}.RF_Robot.BowlPos(:,1), linspace(1, length(rawdata{i}.RF_Robot.BowlPos(:,1)), max_demo_len));
        ppdata_res.RF_Robot.BowlPos.Y(i,:) = spline(1:length(rawdata{i}.RF_Robot.BowlPos(:,2)), rawdata{i}.RF_Robot.BowlPos(:,2), linspace(1, length(rawdata{i}.RF_Robot.BowlPos(:,2)), max_demo_len));
        ppdata_res.RF_Robot.BowlPos.Z(i,:) = spline(1:length(rawdata{i}.RF_Robot.BowlPos(:,3)), rawdata{i}.RF_Robot.BowlPos(:,3), linspace(1, length(rawdata{i}.RF_Robot.BowlPos(:,3)), max_demo_len));
        
        ppdata_res.RF_Robot.BowlPos.RX(i,:) = spline(1:length(rawdata{i}.RF_Robot.BowlRot(:,1)), rawdata{i}.RF_Robot.BowlRot(:,1), linspace(1, length(rawdata{i}.RF_Robot.BowlRot(:,1)), max_demo_len));
        ppdata_res.RF_Robot.BowlPos.RY(i,:) = spline(1:length(rawdata{i}.RF_Robot.BowlRot(:,2)), rawdata{i}.RF_Robot.BowlRot(:,2), linspace(1, length(rawdata{i}.RF_Robot.BowlRot(:,2)), max_demo_len));
        ppdata_res.RF_Robot.BowlPos.RZ(i,:) = spline(1:length(rawdata{i}.RF_Robot.BowlRot(:,3)), rawdata{i}.RF_Robot.BowlRot(:,3), linspace(1, length(rawdata{i}.RF_Robot.BowlRot(:,3)), max_demo_len));
        ppdata_res.RF_Robot.BowlPos.RW(i,:) = spline(1:length(rawdata{i}.RF_Robot.BowlRot(:,4)), rawdata{i}.RF_Robot.BowlRot(:,4), linspace(1, length(rawdata{i}.RF_Robot.BowlRot(:,4)), max_demo_len));
        
        
    end
    
    sfnameout = sprintf('S%.2d_ppdata_res.mat', snum);
    save(sfnameout, 'ppdata_res', '-mat');
    
    
    % Plotting resized data
%     figure('Name', 'Robot Motion in World RF', 'NumberTitle', 'off', 'Color', 'w'); hold on;
%     subplot(3,1,1); hold on; plot(ppdata_res.RF_World.RobotPos.X'); ylabel('X'); title('Robot');
%     subplot(3,1,2); hold on; plot(ppdata_res.RF_World.RobotPos.Y'); ylabel('Y');
%     subplot(3,1,3); hold on; plot(ppdata_res.RF_World.RobotPos.Z'); ylabel('Z');
    
    clear rawdata ppdata_res task_demo_len max_demo_len
    
end