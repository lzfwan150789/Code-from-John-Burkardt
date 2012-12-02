function fem2d_project_function ( nx, ny )

%*****************************************************************************80
%
%% MAIN is the main routine of the finite element program FEM2D_PROJECT_FUNCTION.
%
%  Discussion:
%
%    This program seeks the continuous piecewise linear function U(X,Y) which
%    minimizes the least squares approximation error to a given function W(X,Y),
%    while satisfying given boundary conditions.
%
%    For basis functions V(x,y), we seek U(x,y) such that
%
%      ( U(x,y) - W(x,y), V(x,y) ) = 0
%
%    in a rectangular region in the plane.
%
%    At nodes on the boundary, exact conditions are imposed:
%
%      U(x,y) = W(x,y)
%
%    The code uses continuous piecewise linear basis functions on
%    triangles determined by a uniform grid of NX by NY points.
%
%    In this version of the program, the function W is defined as:
%
%      W(x,y)  = sin ( pi * x ) * sin ( pi * y ) + x
%
%    THINGS YOU CAN EASILY CHANGE:
%
%    1) Change NX or NY, the number of nodes in the X and Y directions.
%    2) Change XL, XR, YB, YT, the left, right, bottom and top limits of the rectangle.
%    3) Change the function W in the EXACT routine.
%
%    HARDER TO CHANGE:
%
%    4) Change from "linear" to "quadratic" triangles;
%    5) Change the region from a rectangle to a general triangulated region;
%    6) Handle Neumann boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the number of nodes in the X and Y directions.
%
  timestamp ( );

  xl = 0.0;
  xr = 1.0;
  yb = 0.0;
  yt = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_PROJECT_FUNCTION\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seek U(x,y), the solution of the least squares equation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Minimize L2 norm of U(x,y) - W(x,y), for W(x,y) given,\n' );
  fprintf ( 1, '  with U(x,y) a piecewise linear function in the interior,\n' );
  fprintf ( 1, '  and matching W(x,y) on the boundary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Reformulate this in terms of a finite element problem:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ( U(x,y) - W(x,y), V(x,y) ) = 0 inside the region,\n' );
  fprintf ( 1, '    U(x,y)                    = W(x,y) on the boundary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The region is a rectangle, defined by:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %f = XL<= X <= XR = %f\n', xl, xr );
  fprintf ( 1, '  %f = YB<= Y <= YT = %f\n', yb, yt );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A finite element formulation is used, with piecewise\n' );
  fprintf ( 1, '  linear basis functions on 3 node triangular\n' );
  fprintf ( 1, '  elements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The corner nodes of the triangles are generated by an\n' );
  fprintf ( 1, '  underlying grid whose dimensions are\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NX = %d\n', nx );
  fprintf ( 1, '  NY = %d\n', ny );
%
%   NODE COORDINATES
%
%   Numbering of nodes is suggested by the following 5x10 example:
%
%       J=5 | K=41   K=42 ... K=50
%       ... |
%       J=2 | K=11   K=12 ... K=20
%       J=1 | K= 1   K= 2         K=10
%               +--------------------
%                   I= 1   I= 2 ... I=10
%
  node_num = nx * ny;

  fprintf ( 1, '  Number of nodes = %d\n', node_num );

  x = zeros(node_num,1);
  y = zeros(node_num,1);

  k = 0;
  for j = 1 : ny
    for i = 1 : nx

      k = k + 1;

      x(k) = ( ( nx - i     ) * xl   ...
           + (        i - 1 ) * xr ) ...
             / ( nx    - 1 );

      y(k) = ( ( ny - j     ) * yb   ...
           + (        j - 1 ) * yt ) ...
             / ( ny     - 1 );

    end
  end
%
%  ELEMENT array
%
%  Organize the nodes into a grid of 3-node triangles.
%  Here is part of the diagram for a 5x10 example:
%
%    |  \ |  \ |  \ |
%    |   \|   \|   \|
%   21---22---23---24--
%    |\ 8 |\10 |\12 |
%    | \  | \  | \  |
%    |  \ |  \ |  \ |  \ |
%    |  7\|  9\| 11\|   \|
%   11---12---13---14---15---16---17---18---19---20
%    |\ 2 |\ 4 |\ 6 |\  8|                   |\ 18|
%    | \  | \  | \  | \  |                   | \  |
%    |  \ |  \ |  \ |  \ |      ...          |  \ |
%    |  1\|  3\|  5\| 7 \|                   |17 \|
%    1----2----3----4----5----6----7----8----9---10
%
  element_num = 2 * ( nx - 1 ) * ( ny - 1 );

  fprintf ( 1, '  Number of elements = %d\n', element_num );

  element_node = zeros ( 3, element_num );

  k = 0;

  for j = 1 : ny - 1
    for i = 1 : nx - 1

      k = k + 1;
      element_node(1,k) = i     + ( j - 1 ) * nx;
      element_node(2,k) = i + 1 + ( j - 1 ) * nx;
      element_node(3,k) = i     +   j       * nx;

      k = k + 1;
      element_node(1,k) = i + 1 +   j       * nx;
      element_node(2,k) = i     +   j       * nx;
      element_node(3,k) = i + 1 + ( j - 1 ) * nx;

    end
  end
%
%  ASSEMBLE THE SYSTEM
%
%  Assemble the coefficient matrix A and the right-hand side B of the 
%  finite element equations, ignoring boundary conditions.
%
  b = zeros(node_num,1);
  a = sparse ( [], [], [], node_num, node_num );

  for e = 1 : element_num

    i1 = element_node(1,e);
    i2 = element_node(2,e);
    i3 = element_node(3,e);

    area = 0.5 * ...
      ( x(i1) * ( y(i2) - y(i3) ) ...
      + x(i2) * ( y(i3) - y(i1) ) ...
      + x(i3) * ( y(i1) - y(i2) ) );
%
%  Consider each quadrature point.
%  Here, we use the midside nodes as quadrature points.
%
    for q1 = 1 : 3

      q2 = mod ( q1, 3 ) + 1;

      nq1 = element_node(q1,e);
      nq2 = element_node(q2,e);

      xq = 0.5 * ( x(nq1) + x(nq2) );
      yq = 0.5 * ( y(nq1) + y(nq2) );
      wq = 1.0 / 3.0;
%
%  Consider each test function in the element.
%
      for ti1 = 1 : 3

        ti2 = mod ( ti1,         3 ) + 1;
        ti3 = mod ( ti1 + 1, 3 ) + 1;

        nti1 = element_node(ti1,e);
        nti2 = element_node(ti2,e);
        nti3 = element_node(ti3,e);

        qi = 0.5 * ( ...
             ( x(nti3) - x(nti2) ) * ( yq - y(nti2) ) ...
           - ( y(nti3) - y(nti2) ) * ( xq - x(nti2) ) ) / area;

        w = exact ( xq, yq );

        b(nti1) = b(nti1) + area * wq * ( w * qi );
%
%  Consider each basis function in the element.
%
        for tj1 = 1 : 3

          tj2 = mod ( tj1,         3 ) + 1;
          tj3 = mod ( tj1 + 1, 3 ) + 1;

          ntj1 = element_node(tj1,e);
          ntj2 = element_node(tj2,e);
          ntj3 = element_node(tj3,e);

          qj = 0.5 * ( ...
              ( x(ntj3) - x(ntj2) ) * ( yq - y(ntj2) ) ...
            - ( y(ntj3) - y(ntj2) ) * ( xq - x(ntj2) ) ) / area;

          a(nti1,ntj1) = a(nti1,ntj1) + area * wq * ( qi * qj );

        end

      end

    end

  end
%
%  BOUNDARY CONDITIONS
%
%  If the K-th variable is at a boundary node, replace the K-th finite
%  element equation by a boundary condition that sets the variable to U(K).
%
  k = 0;

  for j = 1 : ny

    for i = 1 : nx

      k = k + 1;

      if ( i == 1 | i == nx | j == 1 | j == ny )

        u = exact ( x(k), y(k) );

        a(k,1:node_num) = 0.0;
        a(k,k)                   = 1.0;
        b(k)                     = u;

      end
    end
  end
%
%  SOLVE the linear system A * X = B.
%
%  The solution X is actually returned in the space occupied by B.
%
  b = a \ b;
%
%  COMPARE U and W at the grid points only.
%  Unless W is itself a finite element function, we can't expect these values to
%  be equal.  But we aren't trying to match the pointwise data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '     K     I     J    X         Y           U(x,y)          W(x,y)\n' );
  fprintf ( 1, '\n' );

  k = 0;

  for j = 1 : ny
    for i = 1 : nx

      k = k + 1;

      w = exact ( x(k), y(k) );

      fprintf ( 1, '  %4d  %4d  %4d  %8f  %8f  %14e  %14e\n', ...
        k, i, j, x(k), y(k), b(k), w );

    end
    fprintf ( 1, '\n' );
  end
%
%  COMPUTE the L2 norm of U - W over the region.  
%  This is the quanity we want to be small.
%
%  Define a 6 point quadrature rule.
%
  q1(1:6) = [ 0.0, 0.5, 0.5, 4.0/6.0, 1.0/6.0, 1.0/6.0 ];
  q2(1:6) = [ 0.5, 0.0, 0.5, 1.0/6.0, 4.0/6.0, 1.0/6.0 ];
  q3(1:6) = [ 0.5, 0.5, 0.0, 1.0/6.0, 1.0/6.0, 4.0/6.0 ];

  wq(1:6) =  [ 1.0/30.0, 1.0/30.0, 1.0/30.0, 9.0/30.0, 9.0/30.0, 9.0/30.0 ];

  u_norm = 0.0;
  w_norm = 0.0;
  uw_norm = 0.0;

  for e = 1 : element_num

    i1 = element_node(1,e);
    i2 = element_node(2,e);
    i3 = element_node(3,e);

    area = 0.5 * ...
      ( x(i1) * ( y(i2) - y(i3) ) ...
      + x(i2) * ( y(i3) - y(i1) ) ...
      + x(i3) * ( y(i1) - y(i2) ) );
%
%  Consider each quadrature point.
%
    for q = 1 : 6

      xq = q1(q) * x(i1) + q2(q) * x(i2) + q3(q) * x(i3);
      yq = q1(q) * y(i1) + q2(q) * y(i2) + q3(q) * y(i3);
%
%  Inside element E, W is the sum of nodal values B times the basis functions.
%
      u = 0.0;

      for ti1 = 1 : 3

        ti2 = mod ( ti1,         3 ) + 1;
        ti3 = mod ( ti1 + 1, 3 ) + 1;

        nti1 = element_node(ti1,e);
        nti2 = element_node(ti2,e);
        nti3 = element_node(ti3,e);

        qi = 0.5 * ( ...
             ( x(nti3) - x(nti2) ) * ( yq - y(nti2) ) ...
           - ( y(nti3) - y(nti2) ) * ( xq - x(nti2) ) ) / area;

        u = u + b(i1) * qi;

      end

      w = exact ( xq, yq );
%
%  Add the value of ( U - W )^2 to the quadrature sum.
%
      u_norm  = u_norm  + area * wq(q) * u^2;
      w_norm  = w_norm  + area * wq(q) * w^2;
      uw_norm = uw_norm + area * wq(q) * ( u - w )^2;

    end

  end

  u_norm  = sqrt ( u_norm );
  w_norm  = sqrt ( w_norm );
  uw_norm = sqrt ( uw_norm );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ||U||   = %f\n', u_norm );
  fprintf ( 1, '  ||W||   = %f\n', w_norm );
  fprintf ( 1, '  ||U-W|| = %f\n', uw_norm );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM2D_PROJECT_FUNCTION:\n' );
  fprintf ( 1, '   Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function w = exact ( x, y )

%*****************************************************************************80
%
%% EXACT calculates the exact function.
%
%  Discussion:
%
%    The function specified here depends on the problem being solved.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of a point in the region.
%
%    Output, real W, the value of the function W(X,Y).
%
  w = sin ( pi * x ) * sin ( pi * y ) + x;

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end