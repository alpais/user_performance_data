sampling_rate = 0.01;

exception_demos = [];

for subject_num = 1:52
    
    smsgdisp = sprintf('============ Subject S%d =========', subject_num); disp(smsgdisp);
    bag_dir = sprintf('/../S0_data/rawdata_sensors_bags/S%.2d/', subject_num);
    bags = dir(strcat(bag_dir,'*.bag'));
    
    
    for jj = 1:length(bags)
        
        if ismember(jj, exception_demos)
            continue
        else
            
            databag = ros.Bag.load(strcat(bag_dir, bags(jj).name));
            
            smsg = sprintf('Processing demonstration %d out of %d', jj, length(bags));
            disp(smsg);
            
            disp(databag.info);
            
            tree = ros.TFTree(databag);
            % tree.build(databag)
            %disp(tree.allFrames);
            world_frame  = 'calib_right_arm_base_link';
            
            time_samples = tree.time_begin+1.2:sampling_rate:tree.time_end-1;
            task_duration = tree.time_end - tree.time_begin;
            demo_len = length(time_samples);
            
            
            % ================================================================
            %           Read Transforms
            % ================================================================
            
            % in World Frame
            r_ee_world = tree.lookup(world_frame, 'Hand_ft', time_samples);
            hand_world = tree.lookup(world_frame, 'Human_Wrist/base_link', time_samples);
            tool_world = tree.lookup(world_frame, 'Tool_Frame/base_link', time_samples);
            bowl_world = tree.lookup(world_frame, 'Bowl_Frame/base_link', time_samples);
            
            % in Bowl Frame
            r_ee_bowl = tree.lookup('Bowl_Frame/base_link', 'Hand_ft', time_samples);
            hand_bowl = tree.lookup('Bowl_Frame/base_link', 'Human_Wrist/base_link', time_samples);
            tool_bowl = tree.lookup('Bowl_Frame/base_link', 'Tool_Frame/base_link', time_samples);
            
            % in Robot Frame
            hand_robot = tree.lookup('Hand_ft', 'Human_Wrist/base_link', time_samples);
            tool_robot = tree.lookup('Hand_ft', 'Tool_Frame/base_link', time_samples);
            bowl_robot = tree.lookup('Hand_ft', 'Bowl_Frame/base_link', time_samples);
            
            % in Wrist Frame
            r_ee_wrist = tree.lookup('Human_Wrist/base_link', 'Hand_ft', time_samples);
            tool_wrist = tree.lookup('Human_Wrist/base_link', 'Tool_Frame/base_link', time_samples);
            bowl_wrist = tree.lookup('Human_Wrist/base_link', 'Bowl_Frame/base_link', time_samples);
            
            % in Tool Frame
            r_ee_tool = tree.lookup('Tool_Frame/base_link', 'Hand_ft', time_samples);
            hand_tool = tree.lookup('Tool_Frame/base_link', 'Human_Wrist/base_link', time_samples);
            bowl_tool = tree.lookup('Tool_Frame/base_link', 'Bowl_Frame/base_link', time_samples);
            
            for i= 1:demo_len
                
                % World RF
                rawdata{jj}.RF_World.RobotPos(i,1:3) = r_ee_world(i).translation;
                rawdata{jj}.RF_World.RobotRot(i,1:4) = r_ee_world(i).rotation;
                
                rawdata{jj}.RF_World.HumanWristPos(i,1:3) = hand_world(i).translation;
                rawdata{jj}.RF_World.HumanWristRot(i,1:4) = hand_world(i).rotation;
                
                rawdata{jj}.RF_World.ToolPos(i,1:3) = tool_world(i).translation;
                rawdata{jj}.RF_World.ToolRot(i,1:4) = tool_world(i).rotation;
                
                rawdata{jj}.RF_World.BowlPos(i,1:3) = bowl_world(i).translation;
                rawdata{jj}.RF_World.BowlRot(i,1:4) = bowl_world(i).rotation;
                
                % Bowl RF
                rawdata{jj}.RF_Bowl.RobotPos(i,1:3) = r_ee_bowl(i).translation;
                rawdata{jj}.RF_Bowl.RobotRot(i,1:4) = r_ee_bowl(i).rotation;
                
                rawdata{jj}.RF_Bowl.HumanWristPos(i,1:3) = hand_bowl(i).translation;
                rawdata{jj}.RF_Bowl.HumanWristRot(i,1:4) = hand_bowl(i).rotation;
                
                rawdata{jj}.RF_Bowl.ToolPos(i,1:3) = tool_bowl(i).translation;
                rawdata{jj}.RF_Bowl.ToolRot(i,1:4) = tool_bowl(i).rotation;
                
                % Robot RF
                rawdata{jj}.RF_Robot.HumanWristPos(i,1:3) = hand_robot(i).translation;
                rawdata{jj}.RF_Robot.HumanWristRot(i,1:4) = hand_robot(i).rotation;
                
                rawdata{jj}.RF_Robot.ToolPos(i,1:3) = tool_robot(i).translation;
                rawdata{jj}.RF_Robot.ToolRot(i,1:4) = tool_robot(i).rotation;
                
                rawdata{jj}.RF_Robot.BowlPos(i,1:3) = bowl_robot(i).translation;
                rawdata{jj}.RF_Robot.BowlRot(i,1:4) = bowl_robot(i).rotation;
                
                % Human Wrist RF
                rawdata{jj}.RF_HumanWrist.RobotPos(i,1:3) = r_ee_wrist(i).translation;
                rawdata{jj}.RF_HumanWrist.RobotRot(i,1:4) = r_ee_wrist(i).rotation;
                
                rawdata{jj}.RF_HumanWrist.ToolPos(i,1:3) = tool_wrist(i).translation;
                rawdata{jj}.RF_HumanWrist.ToolRot(i,1:4) = tool_wrist(i).rotation;
                
                rawdata{jj}.RF_HumanWrist.BowlPos(i,1:3) = bowl_wrist(i).translation;
                rawdata{jj}.RF_HumanWrist.BowlRot(i,1:4) = bowl_wrist(i).rotation;
                
                % Tool RF
                rawdata{jj}.RF_Tool.RobotPos(i,1:3) = r_ee_tool(i).translation;
                rawdata{jj}.RF_Tool.RobotRot(i,1:4) = r_ee_tool(i).rotation;
                
                rawdata{jj}.RF_Tool.HumanWristPos(i,1:3) = hand_tool(i).translation;
                rawdata{jj}.RF_Tool.HumanWristRot(i,1:4) = hand_tool(i).rotation;
                
                rawdata{jj}.RF_Tool.BowlPos(i,1:3) = bowl_tool(i).translation;
                rawdata{jj}.RF_Tool.BowlRot(i,1:4) = bowl_tool(i).rotation;
                
                % Duration
                rawdata{jj}.tak_duration = demo_len;
            end
            
            clear r_ee_world hand_world tool_world bowl_world
            clear r_ee_bowl hand_bowl tool_bowl
            clear hand_robot tool_robot bowl_robot
            clear r_ee_wrist tool_wrist bowl_wrist
            clear r_ee_tool hand_tool bowl_tool
            clear databag time_samples tree
        end
        
    end
    
    sfoutname = sprintf('S%d_rawdata.mat', subject_num);
    save(sfoutname,'rawdata','-mat');
    
    clear rawdata
    
end
% %% Plotting
% % figure; hold on;
% subplot(3,1,1); hold on; plot(a(:,1),'r');
% subplot(3,1,2); hold on; plot(a(:,2),'r');
% subplot(3,1,3); hold on; plot(a(:,3),'r');
%    %tp = spline(1:length(times), times, linspace(1, length(times), length(r_ft)));
%
% %% Save data
