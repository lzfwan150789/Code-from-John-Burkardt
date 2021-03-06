function i4_is_odd_test ( )

%*****************************************************************************80
%
%% I4_IS_ODD_TEST tests I4_IS_ODD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_IS_ODD_TEST\n' );
  fprintf ( 1, '  I4_IS_ODD reports whether an I4 is odd.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I     I4_IS_ODD(I)\n' );
  fprintf ( 1, '\n' );

  for i = -2 : 25
    fprintf ( 1, '  %6d  %1d\n', i, i4_is_odd ( i ) );
  end

  return
end
