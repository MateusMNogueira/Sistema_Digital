library ieee;
use ieee.std_logic_1164.all;

entity decrementador is
port(
A: in std_logic_vector(7 downto 0);
Cout: out std_logic;
S: out std_logic_vector(7 downto 0)
);
end decrementador;

architecture ckt of decrementador is
component somador1bit is
port(
A: in std_logic;
B: in std_logic;
Cin: in std_logic;
Cout: out std_logic;
S: out std_logic
);
end component;

--Ligações internas do circuito
signal C1,C2,C3,C4,C5,C6,C7: std_logic;
signal Carry_in: std_logic:='0';

begin
U0: somador1bit port map(A=>A(0),B=>'1',Cin=>Carry_in, Cout=>C1,S=>S(0));
U1: somador1bit port map(A=>A(1),B=>'1',Cin=>C1, Cout=>C2,S=>S(1));
U2: somador1bit port map(A=>A(2),B=>'1',Cin=>C2, Cout=>C3,S=>S(2));
U3: somador1bit port map(A=>A(3),B=>'1',Cin=>C3, Cout=>C4,S=>S(3));
U4: somador1bit port map(A=>A(4),B=>'1',Cin=>C4, Cout=>C5,S=>S(4));
U5: somador1bit port map(A=>A(5),B=>'1',Cin=>C5, Cout=>C6,S=>S(5));
U6: somador1bit port map(A=>A(6),B=>'1',Cin=>C6, Cout=>C7,S=>S(6));
U7: somador1bit port map(A=>A(7),B=>'1',Cin=>C7, Cout=>Cout,S=>S(7));
end ckt;