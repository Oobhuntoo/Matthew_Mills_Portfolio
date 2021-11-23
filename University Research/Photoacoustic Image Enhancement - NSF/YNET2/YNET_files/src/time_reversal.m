% create the computational grid 
Nx = 128; % number of grid points in the x (row) direction 
Ny = 128; % number of grid points in the y (column) direction 
dx = 50e-6; % grid point spacing in the x direction [m] 
dy = 50e-6; % grid point spacing in the y direction [m] 
kgrid = makeGrid(Nx, dx, Ny, dy);
% define the medium properties 
medium.sound_speed = 1500*ones(Nx, Ny); % [m/s] 
medium.sound_speed(1:50, :) = 1800; % [m/s] 
medium.density = 1040; % [kg/m^3]
% define an initial pressure using makeDisc 
disc_x_pos = 75; % [grid points] 
disc_y_pos = 120; % [grid points] 
disc_radius = 8; % [grid points] 
disc_mag = 3; % [Pa]

files = dir("U:\YNET_files\test\images\*.tif");
count = 1;
for file = files'
    file_path = strcat("U:\YNET_files\test\images\",file.name);
    test_file = imread(file_path);
    resized_img = imresize(test_file, [128,128]);
    Gray = rgb2gray(resized_img);
    BW = im2bw(Gray,0.5);

    %source.p0 = disc_mag*makeDisc(Nx, Ny, disc_x_pos, disc_y_pos, disc_radius);
    source.p0 = BW;
    % define a Cartesian sensor mask of a centered circle with 50 sensor elements 
    sensor_radius = 2.5e-3; % [m] 
    num_sensor_points = 128;

    sensor.mask = makeCartCircle(sensor_radius, num_sensor_points);
    B = sensor.mask;
    % run the simulation 
    sensor_data = kspaceFirstOrder2D(kgrid, medium, source, sensor);

    % create a binary sensor mask of an equivalent continuous circle
    sensor_radius_grid_points = round(sensor_radius / dx);
    binary_sensor_mask = makeCircle(Nx, Ny, Nx/2 + 1, Ny/2 + 1, sensor_radius_grid_points);

    % assign to sensor structure
    sensor.mask = binary_sensor_mask;

    % interpolate data to remove the gaps and assign to sensor structure
    sensor.time_reversal_boundary_data = interpCartData(kgrid, sensor_data, B, binary_sensor_mask);

    source.p0 = 0;
    p0_recon = kspaceFirstOrder2D(kgrid, medium, source, sensor);

    %sensor_data=sensor_data-min(sensor_data(:)); % shift data such that the smallest element of A is 0
    %sensor_data=sensor_data/max(sensor_data(:)); % normalize the shifted data to 1
    final_path = strcat("U:\YNET_files\test\images\time_reversal_data\","sensor_data",int2str(count),".png");
    imwrite(sensor.time_reversal_boundary_data, final_path);
    
    final_path = strcat("U:\YNET_files\test\images\time_reversal_data\","recon",int2str(count),".png");
    imwrite(p0_recon, final_path);

    count = count + 1;
    clear sensor;
end

