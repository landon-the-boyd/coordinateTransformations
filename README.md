# coordinateTransformations
A set of coordinate transformation tools written in MATLAB

## Why new coordinate transformation functions in MATLAB?
<p> MATLAB has coordiante transformation functions as part of the navigation toolbox, with the capability to convert from just about any standard coordinate frame. However, I've found that some of these function have unnecessarily verbose syntax, so this repo has wrappers that make these functions simpler to use and makes code that uses them look cleaner

## Installation

You need to have accesss to MATLAB's navigation toolbox beforee installation, as the functions here are just wrappers around that functionality. First, clone the repository to anywhere on your machine

<code>git clone git@github.com:landon-the-boyd/coordinateTransformations.git </code>

If you want the functions to be available for only a certain project, then add the following line into youur MATLAB code:

<code>addpath("Path_to_folder/coordinateTransformations")</code>

If you want to make the functions available for any MATLAB code you write in the future, then follow this tutorial from The MathWorks to save coordinateTransforrmations to your startup MATLAB path

https://www.mathworks.com/help/matlab/matlab_env/add-folders-to-matlab-search-path-at-startup.html

## Usage
MATLAB's <code>ecef2lla</code> and <code>lla2ecef</code> accept the input position as an Mx3 array and output the results in the same format. However, the local frame transformations involving ned, enu, or aer require you to break out the coordinates of all input positions, require 3 seperate inputs for all LLA center points, and output the results as three seperate arguments. 

```
ecefCoordinates = ones(10,3);
lla0 = [0,0,0]; % Center point of desired local frame

% Perform transformation
[N,E,D] = ecef2ned(ecefCoordinates(:,1),ecefCoordinates(:,2),ecefCoordinates(:,3),lla0(1),lla0(2),lla0(3),wgs84ellipsoid("meters"))
nedCoordinates = [N,E,D]; % Reassemble into matrix of coordinates
```

These new functions, the above code would be:

```
ecefCoordinates = ones(10,3);
lla0 = [0,0,0]; % Center point of desired local frame

% Perform transformation
nedCoordinates = ecef2ned2(ecefCoordinates,lla0);
```
Making all of the other coordinate transformations behave like <code>ecef2lla</code> and <code>lla2ecef</code>.