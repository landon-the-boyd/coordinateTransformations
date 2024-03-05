function ecef = enu2ecef2(enu,lla0,spheroid,angleUnit)
% ENU2ECEF2 Convert enu coordinates into the ecef frame
% Landon Boyd, 03/05/2024
%
%   INPUTS:
%
%   enu - mx3 array of enu coordinates
%   lla0 - 1x3 array of LLA coordinates of local frame center
%   spheroid - referenceEllipsoid object, default is wgs84Ellipsoid("meter")
%   angleUnit - string of angle unit of provided lla0. Default is "degrees"
%
%   OUTPUTS:
%
%   ecef - mx3 array of converted ecef positions
%
%   See also ENU2ECEF

arguments
    enu (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    spheroid (1,1) referenceEllipsoid = wgs84Ellipsoid("meter")
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

ecef = zeros(size(enu));

for k = 1:size(enu,1)

    [X,Y,Z] = enu2ecef(enu(k,1),enu(k,2),enu(k,3),...
        lla0(1),lla0(2),lla0(3),spheroid,angleUnit);

    ecef(k,:) = [X,Y,Z];
end


end