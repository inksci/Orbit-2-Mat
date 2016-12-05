function meanAnom = Nu2M( e, nu )

%-------------------------------------------------------------------------------
%   Converts true anomaly to mean anomaly.
%-------------------------------------------------------------------------------
%   Form:
%   meanAnom = Nu2M( e, nu )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   e                    Eccentricity
%   nu                   True anomaly
%
%   -------
%   Outputs
%   -------
%   meanAnom             Mean anomaly
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	 Copyright 1993-1998 Princeton Satellite Systems, Inc. All rights reserved.
%-------------------------------------------------------------------------------

if( nargin < 2 )
  if( e ~= 1 )
    if( e < 1 )
      nu = linspace(0,2*pi);
	  else
	    nuMax = acos(-1/e);
	    nu = 0.75*linspace(-nuMax,nuMax);
	  end
  else
	  nu = 0.75*linspace(-pi,pi);
  end
end

if( e ~= 1 )
  eccAnom = Nu2E( e, nu );
  meanAnomX = E2M( e, eccAnom );
else
  meanAnomX = tan(0.5*nu) + tan(0.5*nu).^3/3;
end

if( nargout == 0 & length(nu) > 1 )
  Plot2D(nu,meanAnomX,'True Anomaly','Mean Anomaly')
else
  meanAnom = meanAnomX;
end
