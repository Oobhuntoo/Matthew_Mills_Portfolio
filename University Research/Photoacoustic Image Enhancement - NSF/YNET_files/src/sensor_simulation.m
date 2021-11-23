% for time reversal: http://www.k-wave.org/documentation/example_pr_2D_tr_circular_sensor.php
% for each img in training set, plug into sensor simulation, plug that
% output into time reversal method

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
    imshow(BW);
    
    %source.p0 = disc_mag*makeDisc(Nx, Ny, disc_x_pos, disc_y_pos, disc_radius);
    source.p0 = BW;
    % define a Cartesian sensor mask of a centered circle with 50 sensor elements 
    sensor_radius = 2.5e-3; % [m] 
    num_sensor_points = 128;
    
    sensor.mask = makeCartCircle(sensor_radius, num_sensor_points);
    % run the simulation 
    sensor_data = kspaceFirstOrder2D(kgrid, medium, source, sensor);
    final_path = strcat("U:\YNET_files\test\images\sensor_data\","im",int2str(count),".png");
    imwrite(sensor_data, final_path);
    count = count + 1;
end


A = sensor_data;
x = 1:size(A,1) ; 

figure
hold on
for i = 1:5
    plot(x,A(:,i*20))
end
legend

figure
plot(x,A)
legend


