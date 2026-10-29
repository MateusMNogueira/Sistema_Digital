library ieee;
use ieee.std_logic_1164.all;

entity comparador_Vtot is

  port ( Vtot : in std_logic_vector(9 downto 0);
         Vtot_gt_Vm1, Vtot_gt_Vm2, Vtot_gt_Vm3, Vtot_gt_Vm4, Vtot_gt_Vm5, Vtot_gt_Vm6 : out std_logic;
         VTOT_EQ_0 : out std_logic
  );

end comparador_Vtot;

architecture CKT of comparador_Vtot is

component comparador_10bits is

  port( A, B : in std_logic_vector(9 downto 0); 
        AigualB : out std_logic;
        AmaiorB : out std_logic;
        AmenorB : out std_logic
  );

end component;


signal gt1, gt2, gt3, gt4, gt5, gt6 : std_logic;
signal eq1, eq2, eq3, eq4, eq5, eq6 : std_logic;

begin

  U1 : comparador_10bits port map(
  A => Vtot,
  B => "0001100100",
  AigualB => eq1,
  AmaiorB => gt1,
  AmenorB => open
  );

  U2 : comparador_10bits port map(
  A => Vtot,
  B => "0000110010",
  AigualB => eq2,
  AmaiorB => gt2,
  AmenorB => open
  );

  U3 : comparador_10bits port map(
  A => Vtot,
  B => "0000011001",
  AigualB => eq3,
  AmaiorB => gt3,
  AmenorB => open
  );

  U4 : comparador_10bits port map(
  A => Vtot,
  B => "0000001010",
  AigualB => eq4,
  AmaiorB => gt4,
  AmenorB => open
  );

  U5 : comparador_10bits port map(
  A => Vtot,
  B => "0000000101",
  AigualB => eq5,
  AmaiorB => gt5,
  AmenorB => open
  );

  U6 : comparador_10bits port map(
  A => Vtot,
  B => "0000000001",
  AigualB => eq6,
  AmaiorB => gt6,
  AmenorB => open
  );

  U7 : comparador_10bits port map(
  A => Vtot,
  B => "0000000000",
  AigualB => VTOT_EQ_0,
  AmaiorB => open,
  AmenorB => open
  );


  Vtot_gt_Vm1 <= gt1 or eq1;
  Vtot_gt_Vm2 <= gt2 or eq2;
  Vtot_gt_Vm3 <= gt3 or eq3;
  Vtot_gt_Vm4 <= gt4 or eq4;
  Vtot_gt_Vm5 <= gt5 or eq5;
  Vtot_gt_Vm6 <= gt6 or eq6;
  
  
end CKT;

