function jed = yjf_to_jed_common ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_JED_COMMON converts a Common YJF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, J, real F, the YJF date.
%
%    Output, real JED, the Julian Ephemeris Date.
%

%
%  Copy the input.
%
  y1 = y;
  j1 = j;
  f1 = f;
%
%  Check the input.
%
  [ y1, j1, f1, ierror ] = yjf_check_common ( y1, j1, f1 );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end
%
%  Convert the input.
%
  [ y2, m2, d2, f2 ] = yjf_to_ymdf_common ( y1, j1, f1 );

  jed = ymdf_to_jed_common ( y2, m2, d2, f2 );

  return
end