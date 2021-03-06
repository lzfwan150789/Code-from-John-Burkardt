function c8_norm_l2_test ( )

%*****************************************************************************80
%
%% C8_NORM_L2_TEST tests C8_NORM_L2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_NORM_L2_TEST\n' );
  fprintf ( 1, '  C8_NORM_L2 computes the L2 norm of a C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       C1=C8_UNIFORM_01          R2=C8_NORM_L2(C1)\n' );
  fprintf ( 1, '     ---------------------     ---------------------\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 10
    [ c1, seed ] = c8_uniform_01 ( seed );
    r2 = c8_norm_l2 ( c1 );
    fprintf ( 1, '  %12.6f,%12.6f  %12.6f\n', real ( c1 ), imag ( c1 ), r2 );
  end

  return
end