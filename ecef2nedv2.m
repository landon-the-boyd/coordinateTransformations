function nedv = ecef2nedv2(ecef,lla0,angleUnit)
% ECEF2NEDV2 Rotate ecef vectors into the ned frame
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
%   nedv - mx3 array of rotated ned vectors
%
%   See also ECEF2NEDV

arguments
    ecef (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

nedv = zeros(size(ecef));

for k = 1:size(ecef,1)

    [U,V,W] = ecef2nedv(ecef(k,1),ecef(k,2),ecef(k,3),...
        lla0(1),lla0(2),angleUnit);

    nedv(k,:) = [U,V,W];
end


end