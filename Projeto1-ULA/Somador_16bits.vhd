library ieee;
use ieee.std_logic_1164.all;

entity somador_16bits is
port(
a_soma: in std_logic_vector(15 downto 0);
b_soma: in std_logic_vector(15 downto 0);
s_soma: out std_logic_vector(15 downto 0);
c_out: out std_logic
);
end somador_16bits;


architecture ckt of somador_16bits is
component somador1bit is
port(
A: in std_logic;
B: in std_logic;
Cin: in std_logic;
Cout: out std_logic;
S: out std_logic
);
end component;

signal carry: std_logic_vector(14 downto 0);

begin 
U0: somador1bit port map(
A => a_soma(0),
B => b_soma(0),
Cin => '0',
S => s_soma(0),
Cout => carry(0)
);

U1: somador1bit port map(
A => a_soma(1),
B => b_soma(1),
Cin => carry(0),
S => s_soma(1),
Cout => carry(1)
);

U2: somador1bit port map(
A => a_soma(2),
B => b_soma(2),
Cin => carry(1),
S => s_soma(2),
Cout => carry(2)
);

U3: somador1bit port map(
A => a_soma(3),
B => b_soma(3),
Cin => carry(2),
S => s_soma(3),
Cout => carry(3)
);

U4: somador1bit port map(
A => a_soma(4),
B => b_soma(4),
Cin => carry(3),
S => s_soma(4),
Cout => carry(4)
);

U5: somador1bit port map(
A => a_soma(5),
B => b_soma(5),
Cin => carry(4),
S => s_soma(5),
Cout => carry(5)
);

U6: somador1bit port map(
A => a_soma(6),
B => b_soma(6),
Cin => carry(5),
S => s_soma(6),
Cout => carry(6)
);

U7: somador1bit port map(
A => a_soma(7),
B => b_soma(7),
Cin => carry(6),
S => s_soma(7),
Cout => carry(7)
);

U8: somador1bit port map(
A => a_soma(8),
B => b_soma(8),
Cin => carry(7),
S => s_soma(8),
Cout => carry(8)
);

U9: somador1bit port map(
A => a_soma(9),
B => b_soma(9),
Cin => carry(8),
S => s_soma(9),
Cout => carry(9)
);

U10: somador1bit port map(
A => a_soma(10),
B => b_soma(10),
Cin => carry(9),
S => s_soma(10),
Cout => carry(10)
);

U11: somador1bit port map(
A => a_soma(11),
B => b_soma(11),
Cin => carry(10),
S => s_soma(11),
Cout => carry(11)
);

U12: somador1bit port map(
A => a_soma(12),
B => b_soma(12),
Cin => carry(11),
S => s_soma(12),
Cout => carry(12)
);

U13: somador1bit port map(
A => a_soma(13),
B => b_soma(13),
Cin => carry(12),
S => s_soma(13),
Cout => carry(13)
);

U14: somador1bit port map(
A => a_soma(14),
B => b_soma(14),
Cin => carry(13),
S => s_soma(14),
Cout => carry(14)
);

U15: somador1bit port map(
A => a_soma(15),
B => b_soma(15),
Cin => carry(14),
S => s_soma(15),
Cout => c_out
);

end ckt;


