function [ w, xyz ] = pyra_unit_o48 ( )

%*****************************************************************************80
%
%% PYRA_UNIT_O48 returns a 48 point quadrature rule for the unit pyramid.
%
%  Discussion:
%
%    The integration region is defined as:
%
%    - ( 1 - Z ) <= X <= 1 - Z
%    - ( 1 - Z ) <= Y <= 1 - Z
%              0 <= Z <= 1.
%
%    When Z is zero, the integration region is a square lying in the (X,Y) 
%    plane, centered at (0,0,0) with "radius" 1.  As Z increases to 1, the 
%    radius of the square diminishes, and when Z reaches 1, the square has 
%    contracted to the single point (0,0,1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carlos Felippa,
%    A compendium of FEM integration formulas for symbolic work,
%    Engineering Computation,
%    Volume 21, Number 8, 2004, pages 867-890.
%
%  Parameters:
%
%    Output, real W(48), the weights.
%
%    Output, real XYZ(3,48), the abscissas.
%
  w(1:48) = [ ...
  2.01241939442682455E-002, ...
  2.01241939442682455E-002, ...
  2.01241939442682455E-002, ...
  2.01241939442682455E-002, ...
  2.60351137043010779E-002, ...
  2.60351137043010779E-002, ...
  2.60351137043010779E-002, ...
  2.60351137043010779E-002, ...
  1.24557795239745531E-002, ...
  1.24557795239745531E-002, ...
  1.24557795239745531E-002, ...
  1.24557795239745531E-002, ...
  1.87873998794808156E-003, ...
  1.87873998794808156E-003, ...
  1.87873998794808156E-003, ...
  1.87873998794808156E-003, ...
  4.32957927807745280E-002, ...
  4.32957927807745280E-002, ...
  4.32957927807745280E-002, ...
  4.32957927807745280E-002, ...
  1.97463249834127288E-002, ...
  1.97463249834127288E-002, ...
  1.97463249834127288E-002, ...
  1.97463249834127288E-002, ...
  5.60127223523590526E-002, ...
  5.60127223523590526E-002, ...
  5.60127223523590526E-002, ...
  5.60127223523590526E-002, ...
  2.55462562927473852E-002, ...
  2.55462562927473852E-002, ...
  2.55462562927473852E-002, ...
  2.55462562927473852E-002, ...
  2.67977366291788643E-002, ...
  2.67977366291788643E-002, ...
  2.67977366291788643E-002, ...
  2.67977366291788643E-002, ...
  1.22218992265373354E-002, ...
  1.22218992265373354E-002, ...
  1.22218992265373354E-002, ...
  1.22218992265373354E-002, ...
  4.04197740453215038E-003, ...
  4.04197740453215038E-003, ...
  4.04197740453215038E-003, ...
  4.04197740453215038E-003, ...
  1.84346316995826843E-003, ...
  1.84346316995826843E-003, ...
  1.84346316995826843E-003, ...
  1.84346316995826843E-003 ];

  xyz(1:3,1:48) = [ ...
  0.88091731624450909,   0.0000000000000000,   4.85005494469969989E-02; ...    
 -0.88091731624450909,   0.0000000000000000,   4.85005494469969989E-02; ...    
   0.0000000000000000,   0.88091731624450909,  4.85005494469969989E-02; ...    
   0.0000000000000000,  -0.88091731624450909,  4.85005494469969989E-02; ...    
  0.70491874112648223,   0.0000000000000000,   0.23860073755186201; ...    
 -0.70491874112648223,   0.0000000000000000,   0.23860073755186201; ...    
   0.0000000000000000,   0.70491874112648223,  0.23860073755186201; ...      
   0.0000000000000000,  -0.70491874112648223,  0.23860073755186201; ...    
  0.44712732143189760,   0.0000000000000000,   0.51704729510436798; ...    
 -0.44712732143189760,   0.0000000000000000,   0.51704729510436798; ...    
   0.0000000000000000,   0.44712732143189760,  0.51704729510436798; ...    
   0.0000000000000000,  -0.44712732143189760,  0.51704729510436798; ...    
  0.18900486065123448,   0.0000000000000000,   0.79585141789677305; ...    
 -0.18900486065123448,   0.0000000000000000,   0.79585141789677305; ...    
   0.0000000000000000,   0.18900486065123448,  0.79585141789677305; ...    
   0.0000000000000000,  -0.18900486065123448,  0.79585141789677305; ...    
  0.36209733410322176,   0.36209733410322176,  4.85005494469969989E-02; ...    
 -0.36209733410322176,   0.36209733410322176,  4.85005494469969989E-02; ...    
 -0.36209733410322176,  -0.36209733410322176,  4.85005494469969989E-02; ...    
  0.36209733410322176,  -0.36209733410322176,  4.85005494469969989E-02; ...    
  0.76688932060387538,   0.76688932060387538,  4.85005494469969989E-02; ...    
 -0.76688932060387538,   0.76688932060387538,  4.85005494469969989E-02; ...    
 -0.76688932060387538,  -0.76688932060387538,  4.85005494469969989E-02; ...    
  0.76688932060387538,  -0.76688932060387538,  4.85005494469969989E-02; ...    
  0.28975386476618070,   0.28975386476618070,  0.23860073755186201; ...    
 -0.28975386476618070,   0.28975386476618070,  0.23860073755186201; ...    
 -0.28975386476618070,  -0.28975386476618070,  0.23860073755186201; ...    
  0.28975386476618070,  -0.28975386476618070,  0.23860073755186201; ...    
  0.61367241226233160,   0.61367241226233160,  0.23860073755186201; ...    
 -0.61367241226233160,   0.61367241226233160,  0.23860073755186201; ...    
 -0.61367241226233160,  -0.61367241226233160,  0.23860073755186201; ...    
  0.61367241226233160,  -0.61367241226233160,  0.23860073755186201; ...    
  0.18378979287798017,   0.18378979287798017,  0.51704729510436798; ...    
 -0.18378979287798017,   0.18378979287798017,  0.51704729510436798; ...    
 -0.18378979287798017,  -0.18378979287798017,  0.51704729510436798; ...    
  0.18378979287798017,  -0.18378979287798017,  0.51704729510436798; ...    
  0.38925011625173161,   0.38925011625173161,  0.51704729510436798; ...    
 -0.38925011625173161,   0.38925011625173161,  0.51704729510436798; ...    
 -0.38925011625173161,  -0.38925011625173161,  0.51704729510436798; ...    
  0.38925011625173161,  -0.38925011625173161,  0.51704729510436798; ...    
  7.76896479525748113E-02,   7.76896479525748113E-02,  0.79585141789677305; ...
 -7.76896479525748113E-02,   7.76896479525748113E-02,  0.79585141789677305; ...
 -7.76896479525748113E-02,  -7.76896479525748113E-02,  0.79585141789677305; ...
  7.76896479525748113E-02,  -7.76896479525748113E-02,  0.79585141789677305; ...
  0.16453962988669860,   0.16453962988669860,  0.79585141789677305; ...    
 -0.16453962988669860,   0.16453962988669860,  0.79585141789677305; ...    
 -0.16453962988669860,  -0.16453962988669860,  0.79585141789677305; ...    
  0.16453962988669860,  -0.16453962988669860,  0.79585141789677305 ]';

  return
end