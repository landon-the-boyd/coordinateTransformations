function enuv = ecef2enuv2(ecef,lla0,angleUnit)
% ECEF2ENUV2 Rotate ecef vectors into the enu frame
% Landon Boyd, 03/05/2024
%
%   INPUTS:
%
%   ecef - mx3 array of ecef vectors
%   lla0 - 1x3 array of LLA coordinates of local frame center
%   spheroid - referenceEllipsoid object, default is wgs84Ellipsoid("meter")
%   angleUnit - string of angle unit of provided lla0. Default is "degrees"
%
%   OUTPUTS:
%
%   enuv - mx3 array of rotated enu vectors
%
%   See also ECEF2ENUV

arguments
    ecef (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

enuv = zeros(size(ecef));

for k = 1:size(ecef,1)

    [U,V,W] = ecef2enuv(ecef(k,1),ecef(k,2),ecef(k,3),...
        lla0(1),lla0(2),angleUnit);

    enuv(k,:) = [U,V,W];
end


end