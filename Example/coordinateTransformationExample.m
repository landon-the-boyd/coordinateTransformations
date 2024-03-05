% Example for coordinateTransformations
% Landon Boyd, 03/05/2024
% I put this in a seperate folder since I encouraged users to add it to
% their path in the README and I would hate to coincidentally override
% someone's script name


clear
clc
addpath("../")

% https://www.random.org/geographic-coordinates/
LLA = [53.14402,-118.37963,500];

% MATLAB's handy lla2ecef
ECEF = lla2ecef(LLA);

% Generate some local frame points
nedPoints = [ 0, 0, 0;...
             10, 0, 5;...
             10,10,10;...
             -5,-1,10];

figure()
plot3(nedPoints(:,1),nedPoints(:,2),nedPoints(:,3),'b*',...
    "MarkerSize",10,"LineWidth",2)
grid on
xlim([-10,10])
ylim([-10,10])
zlim([-10,10])
xlabel("North")
ylabel("East")
zlabel("Down")
title("NED Coordinates")
set(gcf,'Color','w')

% Convert our NED points to ECEF coordinates
ECEFCoordinates = ned2ecef2(nedPoints,LLA);

figure()
plot3(ECEFCoordinates(:,1),ECEFCoordinates(:,2),ECEFCoordinates(:,3),'b*',...
    "MarkerSize",10,"LineWidth",2)
grid on
xlabel("ECEF X")
ylabel("ECEF Y")
zlabel("ECEF Z")
title("ECEF Coordinates")
set(gcf,'Color','w')


