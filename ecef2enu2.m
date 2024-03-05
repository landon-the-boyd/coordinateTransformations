function enu = ecef2enu2(ecef,lla0,spheroid,angleUnit)
% ECEF2ENU2 Convert ecef coordinates into the enu frame
% Landon Boyd, 03/05/2024
%
%   INPUTS:
%
%   ecef - mx3 array of ecef coordinates
%   lla0 - 1x3 array of LLA coordinates of local frame center
%   spheroid - referenceEllipsoid object, default is wgs84Ellipsoid("meter")
%   angleUnit - string of angle unit of provided lla0. Default is "degrees"
%
%   OUTPUTS:
%
%   enu - mx3 array of converted enu positions
%
%   See also ECEF2ENU

arguments
    ecef (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    spheroid (1,1) referenceEllipsoid = wgs84Ellipsoid("meter")
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

enu = zeros(size(ecef));

for k = 1:size(ecef,1)

    [E,N,U] = ecef2enu(ecef(k,1),ecef(k,2),ecef(k,3),...
        lla0(1),lla0(2),lla0(3),spheroid,angleUnit);

    enu(k,:) = [E,N,U];
end


end