excepted_demos{52} = [];
    
for snum = 1:52
    
    smsgdisp = sprintf('============ Subject S%d =========', snum); disp(smsgdisp);
    bag_dir = sprintf('/../S0_data/rawdata_sensors_bags/S%.2d/', snum);
    bags = dir(strcat(bag_dir,'*.bag'));
    
    ed_tool = zeros(1, length(bags));
    ed_hand = zeros(1, length(bags));
    for jj = 1:length(bags)
        
        databag = ros.Bag.load(strcat(bag_dir, bags(jj).name));
        
        smsg = sprintf('Processing demonstration %d out of %d', jj, length(bags));
        disp(smsg);
        
        if ismember('/tool/ft_sensor/netft_data', databag.topics)
            rawdata_FT{jj}.Tool_FT = read_FT_From_Bag(databag, '/tool/ft_sensor/netft_data');
        else
            fprintf(2, '  >> Tool FT not recorded for subject %d, in demo %d \n', snum, jj);
            ed_tool(jj) = 1;
        end
        
        if ismember('/hand/ft_sensor/netft_data', databag.topics)
            rawdata_FT{jj}.Hand_FT = read_FT_From_Bag(databag, '/hand/ft_sensor/netft_data');
        else
            fprintf(2, '  >> Hand FT not recorded for subject %d, in demo %d \n', snum, jj);
            ed_hand(jj) = 1;
        end        
    end
    
    excepted_demos{snum}.Tool_FT = ed_tool;
    excepted_demos{snum}.Hand_FT = ed_hand;
    
    clear ed_tool ed_hand
    
    if exist('rawdata_FT', 'var')
        sfoutname = sprintf('/../S0_data/rawdata_sensors_parsed/S%.2d_rawdata_FT.mat', snum);
         save(sfoutname, 'rawdata_FT', '-mat');        
        clear rawdata_FT databag bags bag_dir
    end
end


for i = 1:52 excepted_demos{i}.traj = zeros(1, length(excepted_demos{i}.Tool_FT)); end
excepted_demos{39}.traj(1) = 1;
excepted_demos{38}.traj(2) = 1;
excepted_demos{24}.traj(2) = 1;
excepted_demos{7}.traj(2) = 1;
excepted_demos{7}.traj(2) = 0;
excepted_demos{7}.traj(1) = 1;

save('excepted_demos.mat','excepted_demos','-mat')
