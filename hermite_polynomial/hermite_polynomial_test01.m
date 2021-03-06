function hermite_polynomial_test01 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST01 tests H_POLYNOMIAL_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST01:\n' );
  fprintf ( 1, '  H_POLYNOMIAL_VALUES stores values of\n' );
  fprintf ( 1, '  the physicist''s Hermite polynomials.\n' );
  fprintf ( 1, '  H_POLYNOMIAL_VALUE evaluates the polynomial.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                        Tabulated                 Computed\n' );
  fprintf ( 1, '     N        X           H(N,X)                    H(N,X)                     Error\n' );

  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx1 ] = h_polynomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2_vec = h_polynomial_value ( 1, n, x );
    fx2 = fx2_vec(1,n+1);
    e = fx1 - fx2;

    fprintf ( 1, '  %4d  %12f  %24.16e  %24.16e  %8.2g\n', n, x, fx1, fx2, e );

  end

  return
end
