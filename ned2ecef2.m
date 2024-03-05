function ecef = ned2ecef2(ned,lla0,spheroid,angleUnit)
% NED2ECEF2 Convert ned coordinates into the ecef frame
% Landon Boyd, 03/05/2024
%
%   INPUTS:
%
%   ned - mx3 array of ned coordinates
%   lla0 - 1x3 array of LLA coordinates of local frame center
%   spheroid - referenceEllipsoid object, default is wgs84Ellipsoid("meter")
%   angleUnit - string of angle unit of provided lla0. Default is "degrees"
%
%   OUTPUTS:
%
%   ecef - mx3 array of converted ecef positions
%
%   See also NED2ECEF

arguments
    ned (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    spheroid (1,1) referenceEllipsoid = wgs84Ellipsoid("meter")
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

ecef = zeros(size(ned));

for k = 1:size(ned,1)

    [X,Y,Z] = ned2ecef(ned(k,1),ned(k,2),ned(k,3),...
        lla0(1),lla0(2),lla0(3),spheroid,angleUnit);

    ecef(k,:) = [X,Y,Z];
end


end