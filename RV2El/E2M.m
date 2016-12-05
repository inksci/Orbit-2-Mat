function meanAnom = E2M( ecc, eccAnom )

%-------------------------------------------------------------------------------
%   Converts eccentric anomaly to mean anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   meanAnom = E2M( ecc, eccAnom )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   ecc            Eccentricity
%   eccAnom        Eccentric anomaly
%
%   -------
%   Outputs
%   -------
%   meanAnom       Mean anomaly
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%   References:	Bate, R. R. Fundamentals of Astrodynamics. pp. 185-187.
%-------------------------------------------------------------------------------
%    Copyright 1993-1998 Princeton Satellite Systems, Inc. All rights reserved.
%-------------------------------------------------------------------------------

if( nargin < 2 )
  if( length(ecc) == 1 )
    eccAnom = linspace(-pi+eps,pi-eps);
  else
    error('If ecc is not a scalar you must enter eccAnom')
  end  
end

if( length(ecc) == 1 )
  ecc = DupVect(ecc,length(eccAnom))'; 
end  

meanAnomX = zeros(size(eccAnom));

k = find( ecc == 1 );
if( length(k) > 0 )
  error('Eccentric anomaly is not defined for parabolas')
end

k = find( ecc < 1 );
if( length(k) > 0 )
  meanAnomX(k) = eccAnom(k) - ecc(k).*sin( eccAnom(k) );
end

k = find( ecc > 1 );
if( length(k) > 0 )
  meanAnomX(k) = ecc(k).*sinh( eccAnom(k) ) - eccAnom(k);
end

if( nargout == 0 & length(eccAnom) > 1 )
  Plot2D(eccAnom,meanAnomX,'Eccentric Anomaly','Mean Anomaly')
else
  meanAnom = meanAnomX;
end
