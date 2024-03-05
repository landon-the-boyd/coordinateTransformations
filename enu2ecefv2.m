function ecefv = enu2ecefv2(enu,lla0,angleUnit)
% ENU2ECEFV2 Rotate enu vectors into the ecef frame
% Landon Boyd, 03/05/2024
%
%   INPUTS:
%
%   enu - mx3 array of enu vectors
%   lla0 - 1x3 array of LLA coordinates of local frame center
%   spheroid - referenceEllipsoid object, default is wgs84Ellipsoid("meter")
%   angleUnit - string of angle unit of provided lla0. Default is "degrees"
%
%   OUTPUTS:
%
%   ecefv - mx3 array of rotated ecef vectors
%
%   See also ENU2ECEFV

arguments
    enu (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

ecefv = zeros(size(enu));

for k = 1:size(enu,1)

    [U,V,W] = enu2ecefv(enu(k,1),enu(k,2),enu(k,3),...
        lla0(1),lla0(2),angleUnit);

    ecefv(k,:) = [U,V,W];
end


end