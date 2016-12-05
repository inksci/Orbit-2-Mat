function wxy = Cross( w, y )

%-------------------------------------------------------------------------------
%   Vector cross product. The number of columns of w and y can be:
%
%   Both > 1 and equal
%   One can have one column and the other any number of columns
%-------------------------------------------------------------------------------
%   Form:
%   wxy = Cross( w, y )
%-------------------------------------------------------------------------------
%
%   ------
%   Inputs
%   ------
%   w                 (3)    Vector
%   y                 (3)    Vector
%
%   -------
%   Outputs
%   -------
%   wxy               (3)    Vector cross product of w and y
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
%	 Copyright 1993 Princeton Satellite Systems, Inc. All rights reserved.
%-------------------------------------------------------------------------------

[rW,cW] = size(w);
[rY,cY] = size(y);

if( cW == cY )
  wxy = [w(2,:).*y(3,:)-w(3,:).*y(2,:);...
         w(3,:).*y(1,:)-w(1,:).*y(3,:);...
	   w(1,:).*y(2,:)-w(2,:).*y(1,:)]; 
		 
elseif( cW == 1)
  wxy = [w(2)*y(3,:)-w(3)*y(2,:);...
         w(3)*y(1,:)-w(1)*y(3,:);...
	   w(1)*y(2,:)-w(2)*y(1,:)]; 
		 
elseif( cY == 1)
  wxy = [w(2,:)*y(3)-w(3,:)*y(2);...
         w(3,:)*y(1)-w(1,:)*y(3);...
	   w(1,:)*y(2)-w(2,:)*y(1)]; 
else
  error('w and y cannot have different numbers of columns unless one has only one column')
end
