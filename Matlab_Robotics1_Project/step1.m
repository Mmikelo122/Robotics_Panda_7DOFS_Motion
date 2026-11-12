clear; clc; close all;

% Step 1: Load the Panda robot model using column vectors
robot = loadrobot("frankaEmikaPanda", "DataFormat", "column");

% Print robot joints and links in the Command Window
showdetails(robot);

% Step 2: Create an empty 7x3 matrix to store the 3 random configurations
Q_rand = zeros(7, 3);

% Open a new figure window
figure;

% Step 3: Generate and plot 3 random configurations
for k = 1:3
    % Generate 7 random joint angles between -pi/2 and +pi/2 (in radians)
    q_7dof = -pi/2 + pi * rand(7, 1);
    
    % Save the current 7x1 configuration in column k (needed for Part 2 & 3)
    Q_rand(:, k) = q_7dof;
    
    % Append two zeros for the 2 finger joints (total 9x1 vector)
    q_full = [q_7dof; 0; 0];
    
    % Divide the figure into 3 slots (1 row, 3 columns) and pick slot k
    subplot(1, 3, k);
    
    % Plot the 3D robot
    show(robot, q_full);
    title(['Configuration ', num2str(k)]);

end