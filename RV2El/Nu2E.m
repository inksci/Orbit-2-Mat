function E = Nu2E( e, nu )

%-------------------------------------------------------------------------------
%   Converts true anomaly to eccentric or hyperbolic anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   E = Nu2E( e, nu )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e                     Eccentricity
%   nu                    True anomaly
%
%   -------
%   Outputs
%   -------
%   E                     Eccentric or hyperbolic anomaly
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	References: Wiesel, W. E., Spaceflight Dynamics, McGraw-Hill, 1988, pp. 57,60.
%-------------------------------------------------------------------------------
%	 Copyright 1993-1998 Princeton Satellite Systems, Inc. All rights reserved.
%-------------------------------------------------------------------------------

k = find( e == 1 );
if( length(k) > 0 )
  error('Eccentric anomaly is not defined for parabolas')
end

if( nargin < 2 )
  if( length(e) == 1 )
    if( e < 1 )
      nu = linspace(0,2*pi);
    else
	    nuMax = acos(-1/e);
	    nu = linspace(-nuMax,nuMax);
	  end
  else
    error('If e is not a scalar you must enter nu')
  end
end

if( length(e) == 1 )
  e = DupVect(e,length(nu))';
end
	
k = find( e < 1 );
if( length(k) > 0 )
  eX(k) = 2*atan( sqrt( (1-e(k))./(1+e(k)) ).*tan(0.5*nu(k))); ;
  yLbl = 'Eccentric';
else
  yLbl = [];
end

k = find( e > 1 );
if( length(k) > 0 )
  cosNu  = cos( nu(k) );
  eX(k) = acosh( (e(k) + cosNu)./(e(k).*cosNu + 1) );
  if( isempty(yLbl) )
    yLbl = 'Hyperbolic';
  else
    yLbl = [yLbl '/Hyperbolic'];
  end
end

if( nargout == 0 & length(nu) > 1 )
  Plot2D(nu,eX,'True Anomaly',[yLbl, ' Anomaly'])
else
  E = eX;
end 
