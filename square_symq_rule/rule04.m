function [ x, w ] = rule04 ( n )

%*****************************************************************************80
%
%% RULE04 returns the rule of degree 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer N, the number of nodes.
%
%    Output, real X(2,N), the coordinates of the nodes.
%
%    Output, real W(N), the weights.
%
  xs = [ ...
    0.3683480503448356E+00, ...
   -0.3683480503448355E+00, ...
    0.8881837963234579E+00, ...
   -0.8881837963234579E+00, ...
   -0.6849278434806340E+00, ...
    0.6849278434806340E+00, ...
    0.1035042199756803E-32 ];
  ys = [ ...
   -0.8931142408116063E+00, ...
    0.8931142408116063E+00, ...
   -0.3800827242611582E+00, ...
    0.3800827242611583E+00, ...
   -0.6813275148988932E+00, ...
    0.6813275148988932E+00, ...
   -0.4874534345070689E-33 ];
  ws = [ ...
    0.2922561796990344E+00, ...
    0.2922561796990344E+00, ...
    0.2970097006317383E+00, ...
    0.2970097006317383E+00, ...
    0.4208866642214383E+00, ...
    0.4208866642214383E+00, ...
    0.8081220356417685E+00 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end