function r83row_print_part ( n, a, max_print, title )

%*****************************************************************************80
%
%% R83ROW_PRINT_PART prints "part" of an R83ROW.
%
%  Discussion:
%
%    An R83ROW is a (3,N) array of R8's.
%
%    The user specifies MAX_PRINT, the maximum number of lines to print.
%
%    If N, the size of the vector, is no more than MAX_PRINT, then
%    the entire vector is printed, one entry per line.
%
%    Otherwise, if possible, the first MAX_PRINT-2 entries are printed,
%    followed by a line of periods suggesting an omission,
%    and the last entry.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries of the vector.
%
%    Input, real A(3,N), the vector to be printed.
%
%    Input, integer MAX_PRINT, the maximum number of lines
%    to print.
%
%    Input, string TITLE, a title.
%
  if ( max_print <= 0 )
    return
  end

  if ( n <= 0 )
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  if ( n <= max_print )

    for i = 1 : n
      fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, a(1:3,i) );
    end

  elseif ( 3 <= max_print )

    for i = 1 : max_print-2
      fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, a(1:3,i) );
    end
    fprintf ( 1, '  ....  ..............  ..............  ..............\n' );
    i = n;
    fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, a(1:3,i) );

  else

    for i = 1 : max_print - 1
      fprintf ( 1, '  %4d  %14g  %14g  %14g\n', i, a(1:3,i) );
    end
    i = max_print;
    fprintf ( 1, '  %4d  %14g  %14g  %14g  ...more entries...\n', i, a(1:3,i) );

  end

  return
end
