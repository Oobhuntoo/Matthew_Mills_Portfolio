test_file = imread("U:\YNET_files\training\1st_manual\21_manual1.gif");
resized_img = imresize(test_file, [128,128]);
BW = imbinarize(resized_img,0.5);
%imshow(BW)

% create a binary sensor mask of an equivalent continuous circle
sensor_radius_grid_points = round(sensor_radius / kgrid_recon.dx);
binary_sensor_mask = makeCircle(kgrid_recon.Nx, kgrid_recon.Ny, kgrid_recon.Nx/2 + 1, kgrid_recon.Ny/2 + 1, sensor_radius_grid_points, sensor_angle);

% assign to sensor structure
sensor.mask = binary_sensor_mask;

% interpolate data to remove the gaps and assign to sensor structure
sensor.time_reversal_boundary_data = interpCartData(kgrid_recon, sensor_data, cart_sensor_mask, binary_sensor_mask);