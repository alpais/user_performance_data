


subj_start  = 1;
subj_end    = 52;

% load('excepted_demos');
excepted_demos{52}.hand_all = [];

for snum = subj_start:subj_end
    
    fprintf('       >> Processing Subject %d \n', snum);
    data_dir = sprintf('../S0_data/rawdata_sensors_bags/S%.2d/', snum);
    data_files = dir(strcat(data_dir, '*.txt'));
    
    
%     excepted_demos{snum}.hand_all = zeros(1, length(excepted_demos{snum}.Tool_FT));
    
    for dem = 1:length(data_files)
        data = load(strcat(data_dir, data_files(dem).name));
        
        if isempty(data)
            excepted_demos{snum}.hand_all(dem) = 1;
            fprintf(2, 'Demo %.2d no finger or tactile data \n', dem);
            continue
        end
        
        if (sum(data(300, 763:785) - data(10, 763:785))==0)
            excepted_demos{snum}.hand_all(dem) = 1;
            fprintf(2, 'Demo %.2d no finger JA data \n', dem);
            continue
        end
        
        if (sum(sum(data(:, 727:744)~=0)) == 0)
            excepted_demos{snum}.hand_all(dem) = 1;
            fprintf(2, 'Demo %.2d no tactile data \n', dem);
            continue
        end
        
        rawdata_hand{dem}.finger_ja       = data(:, 763:785);
        rawdata_hand{dem}.tactile_front   = data(:, 727:744);
        rawdata_hand{dem}.tactile_side    = data(:, 745:762);
        
        clear data
    end
    
    if exist('rawdata_hand', 'var')
        sfoutdir = sprintf('../S0_data/rawdata_sensors_parsed/hand');
        sfoutname = sprintf('%s/S%.2d_rawdata_hand.mat', sfoutdir, snum);
        save(sfoutname, 'rawdata_hand', '-mat');
    end
    
    clear data_dir data_files rawdata_hand
    
end

save('excepted_demos.mat', 'excepted_demos', '-mat')