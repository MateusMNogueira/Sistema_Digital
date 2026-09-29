library ieee;
use ieee.std_logic_1164.all;

entity AND_64 is
port(
A_and: in std_logic_vector(7 downto 0);
B_and: in std_logic_vector(7 downto 0);
saida_and0: out std_logic_vector(7 downto 0);
saida_and1: out std_logic_vector(7 downto 0);
saida_and2: out std_logic_vector(7 downto 0);
saida_and3: out std_logic_vector(7 downto 0);
saida_and4: out std_logic_vector(7 downto 0);
saida_and5: out std_logic_vector(7 downto 0);
saida_and6: out std_logic_vector(7 downto 0);
saida_and7: out std_logic_vector(7 downto 0)
);
end AND_64;


architecture ckt of AND_64 is
begin

-- ANDs referentes ao bit A(0)
saida_and0(0) <= A_and(0) and B_and(0);
saida_and0(1) <= A_and(0) and B_and(1);
saida_and0(2) <= A_and(0) and B_and(2);
saida_and0(3) <= A_and(0) and B_and(3);
saida_and0(4) <= A_and(0) and B_and(4);
saida_and0(5) <= A_and(0) and B_and(5);
saida_and0(6) <= A_and(0) and B_and(6);
saida_and0(7) <= A_and(0) and B_and(7);


-- ANDs referentes ao bit A(1)
saida_and1(0) <= A_and(1) and B_and(0);
saida_and1(1) <= A_and(1) and B_and(1);
saida_and1(2) <= A_and(1) and B_and(2);
saida_and1(3) <= A_and(1) and B_and(3);
saida_and1(4) <= A_and(1) and B_and(4);
saida_and1(5) <= A_and(1) and B_and(5);
saida_and1(6) <= A_and(1) and B_and(6);
saida_and1(7) <= A_and(1) and B_and(7);


-- ANDs referentes ao bit A(2)
saida_and2(0) <= A_and(2) and B_and(0);
saida_and2(1) <= A_and(2) and B_and(1);
saida_and2(2) <= A_and(2) and B_and(2);
saida_and2(3) <= A_and(2) and B_and(3);
saida_and2(4) <= A_and(2) and B_and(4);
saida_and2(5) <= A_and(2) and B_and(5);
saida_and2(6) <= A_and(2) and B_and(6);
saida_and2(7) <= A_and(2) and B_and(7);


-- ANDs referentes ao bit A(3)
saida_and3(0) <= A_and(3) and B_and(0);
saida_and3(1) <= A_and(3) and B_and(1);
saida_and3(2) <= A_and(3) and B_and(2);
saida_and3(3) <= A_and(3) and B_and(3);
saida_and3(4) <= A_and(3) and B_and(4);
saida_and3(5) <= A_and(3) and B_and(5);
saida_and3(6) <= A_and(3) and B_and(6);
saida_and3(7) <= A_and(3) and B_and(7);


-- ANDs referentes ao bit A(4)
saida_and4(0) <= A_and(4) and B_and(0);
saida_and4(1) <= A_and(4) and B_and(1);
saida_and4(2) <= A_and(4) and B_and(2);
saida_and4(3) <= A_and(4) and B_and(3);
saida_and4(4) <= A_and(4) and B_and(4);
saida_and4(5) <= A_and(4) and B_and(5);
saida_and4(6) <= A_and(4) and B_and(6);
saida_and4(7) <= A_and(4) and B_and(7);


-- ANDs referentes ao bit A(5)
saida_and5(0) <= A_and(5) and B_and(0);
saida_and5(1) <= A_and(5) and B_and(1);
saida_and5(2) <= A_and(5) and B_and(2);
saida_and5(3) <= A_and(5) and B_and(3);
saida_and5(4) <= A_and(5) and B_and(4);
saida_and5(5) <= A_and(5) and B_and(5);
saida_and5(6) <= A_and(5) and B_and(6);
saida_and5(7) <= A_and(5) and B_and(7);


-- ANDs referentes ao bit A(6)
saida_and6(0) <= A_and(6) and B_and(0);
saida_and6(1) <= A_and(6) and B_and(1);
saida_and6(2) <= A_and(6) and B_and(2);
saida_and6(3) <= A_and(6) and B_and(3);
saida_and6(4) <= A_and(6) and B_and(4);
saida_and6(5) <= A_and(6) and B_and(5);
saida_and6(6) <= A_and(6) and B_and(6);
saida_and6(7) <= A_and(6) and B_and(7);


-- ANDs referentes ao bit A(7)
saida_and7(0) <= A_and(7) and B_and(0);
saida_and7(1) <= A_and(7) and B_and(1);
saida_and7(2) <= A_and(7) and B_and(2);
saida_and7(3) <= A_and(7) and B_and(3);
saida_and7(4) <= A_and(7) and B_and(4);
saida_and7(5) <= A_and(7) and B_and(5);
saida_and7(6) <= A_and(7) and B_and(6);
saida_and7(7) <= A_and(7) and B_and(7);


end ckt;