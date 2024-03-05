function ecef = aer2ecef2(aer,lla0,spheroid,angleUnit)
% AER2ECEF2 Convert aer coordinates into the ecef frame
% Landon Boyd, 03/05/2024
%
%   INPUTS:
%
%   aer - mx3 array of aer coordinates
%   lla0 - 1x3 array of LLA coordinates of local frame center
%   spheroid - referenceEllipsoid object, default is wgs84Ellipsoid("meter")
%   angleUnit - string of angle unit of provided lla0. Default is "degrees"
%
%   OUTPUTS:
%
%   ecef - mx3 array of converted ecef positions
%
%   See also AER2ECEF

arguments
    aer (:,3) double {mustBeReal}
    lla0 (1,3) double {mustBeReal}
    spheroid (1,1) referenceEllipsoid = wgs84Ellipsoid("meter")
    angleUnit {mustBeMember(angleUnit,["degrees","radians"])} = "degrees"
end

ecef = zeros(size(aer));

for k = 1:size(enu,1)

    [X,Y,Z] = aer2ecef(aer(k,1),aer(k,2),aer(k,3),...
        lla0(1),lla0(2),lla0(3),spheroid,angleUnit);

    ecef(k,:) = [X,Y,Z];
end


end