function [el, E, f] = RV2El( r, v, mu )

%-------------------------------------------------------------------------------
%   Converts R and V to Keplerian orbital elements for an elliptic orbit
%-------------------------------------------------------------------------------
%   Form:
%   [el, E, f] = RV2El( r, v, mu )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   r               (3,1) Position vector
%   v               (3,1) Velocity vector
%   mu                    Gravitational constant
%
%   -------
%   Outputs
%   -------
%   el                    Elements vector [a,i,W,w,e,M]
%   E                     Eccentric anomaly
%   f                     True anomaly
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	  References:	  Bate, R.R., et. al. Fundamentals of Astrodynamics, pp. 70-71.
%-------------------------------------------------------------------------------
%   Copyright 1993-1994 Princeton Satellite Systems, Inc.
%   All rights reserved.
%-------------------------------------------------------------------------------

if( nargin < 3 )
  mu = 3.98600436e5;
end

% Error Limit

tol  = 1.e-12;

% The orbit angular momentum

h    = Cross(r,v);

hsq  = h'*h;
hmag = sqrt(hsq);
	
% The line of nodes

N    = [-h(2);h(1);0];

Nmag = sqrt(N(1)^2 + N(2)^2);
	
% Functions of the radius vector and velocity

vsq  = v'*v;
vmag = sqrt(vsq);

rv   = r'*v;

rmag = Mag(r);
	
% The eccentricity vector

ev = ((vsq - mu/rmag)*r - rv*v)/mu;

% Elements vector [a,i,W,w,e,M,E,f]
	
% The eccentricity

esq    = ev'*ev;
el(5)  = sqrt(esq);

% The semimajor axis

el(1) = (hsq/mu) / ((1-el(5))*(1+el(5)));
	
% The inclination

el(2) = acos( h(3) / hmag );
	
% Check to see if the orbit is circular or in the XY plane
	
if ( el(5) > tol & abs(el(2)) > tol ),
	
   % The longitude of the ascending node

   el(3) = atan2 ( N(2), N(1) );
	
   % The argument of perigee

   arg = (N(1)*ev(1) + N(2)*ev(2)) / ( Nmag*el(5) );

   if     ( arg >  1 ),
     el(4) = 0;
   elseif ( arg < -1 ),
     el(4) = pi;
   else
     el(4) = acos(arg);
   end;

   if ( ev(3) < 0 ),
     el(4) = - el(4);
   end
	
   % The true anomaly

   arg = ev'*r/(rmag*el(5));

   if     ( arg >  1 ),
     f = 0;
   elseif ( arg < -1 ),
     f = pi;
   else
     f = acos(arg);
   end;

   if ( rv < 0 ),
     f = -f;
   end
	  
elseif ( Nmag > tol )
	
  % The longitude of the ascending node

  el(3) = atan2 ( N(2), N(1) );
	
  % The argument of perigee

  el(4) = 0;
	
  % The true anomaly

  f = acos ( ( N(1)*r(1) + N(2)*r(2) ) / ( Nmag*rmag ) );

  if ( r(3) < 0 ),
    f = - f;
  end
	  
else
	
  % The argument of perigee

  el(4) = 0;
	
  % The longitude of the ascending node

  el(3) = 0;
	
  % The true anomaly
  %-----------------
  f = atan2 ( r(2), r(1) );
	  
end

el(6) = Nu2M(el(5),f);
E     = Nu2E(el(5),f);

if( f < 0 )
	f = f + 2*pi;
end

