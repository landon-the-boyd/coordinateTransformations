function ecefv = ned2ecefv2(ned,lla0,angleUnit)
% NED2ECEFV2 Rotate ned vectors into the ecef frame
% Landon Boyd, 03/05/2024
%
%   INPUTS:
%
%   ned - mx3 array of ned vectors
%   lla0 - 1x3 array of LLA coordinates of local frame center
%   spheroid - referenceEllipsoid object, default is wgs84Ellipsoid("meter")
%   angleUnit - string of angle unit of provided lla0. Default is "degrees"
%
%   OUTPUTS:
%
%   ecefv - mx3 array of rotated ecef vectors
%
%   See also NED2ECEFV

arguments
    ned (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

ecefv = zeros(size(ned));

for k = 1:size(ned,1)

    [U,V,W] = ned2ecefv(ned(k,1),ned(k,2),ned(k,3),...
        lla0(1),lla0(2),angleUnit);

    ecefv(k,:) = [U,V,W];
end


end