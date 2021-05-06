---------------------------------------------------
-- Sheet: vga_driver
-- RefDes: 
-- Part Number: XC7A35T
-- Generated By: Multisim
--
-- Author: lenovo
-- Date: Monday, May 03 16:47:05, 2021
---------------------------------------------------

---------------------------------------------------
-- Use: This file defines the top-level of the design
-- Use with the exported package file
---------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

library work;
use work.VGA_driver_pkg.ALL;


entity vga_driver is
	port (

		CLK : in std_logic;
		SW0 : in std_logic;
		SW1 : in std_logic;
		SW2 : in std_logic;
		SW3 : in std_logic;
		SW4 : in std_logic;
		SW5 : in std_logic;
		SW6 : in std_logic;
		SW7 : in std_logic;
		SW8 : in std_logic;
		SW9 : in std_logic;
		SW10 : in std_logic;
		SW11 : in std_logic;
		rst_n : in std_logic;
		red0 : out std_logic;
		red1 : out std_logic;
		red2 : out std_logic;
		red3 : out std_logic;
		green0 : out std_logic;
		green1 : out std_logic;
		green2 : out std_logic;
		green3 : out std_logic;
		blue0 : out std_logic;
		blue1 : out std_logic;
		blue2 : out std_logic;
		blue3 : out std_logic;
		hs : out std_logic;
		vs : out std_logic;
		HCOUNT : out std_logic;
		VCOUNT : out std_logic
	);
end vga_driver;


architecture behavioral of vga_driver is


	component AND2_NI
		port (
    B : in STD_LOGIC := 'X';
    A : in STD_LOGIC := 'X';
    Y : out STD_LOGIC := 'U'
  );
	end component;

	component AND3_NI
		port (
    C : in STD_LOGIC := 'X';
    B : in STD_LOGIC := 'X';
    A : in STD_LOGIC := 'X';
    Y : out STD_LOGIC := 'U'
  );
	end component;

	component AND4_NI
		port (
    D : in STD_LOGIC := 'X';
    C : in STD_LOGIC := 'X';
    B : in STD_LOGIC := 'X';
    A : in STD_LOGIC := 'X';
    Y : out STD_LOGIC := 'U'
  );
	end component;

	component AND7_NI
		port (
    G : in STD_LOGIC := 'X';
    F : in STD_LOGIC := 'X';
    E : in STD_LOGIC := 'X';
    D : in STD_LOGIC := 'X';
    C : in STD_LOGIC := 'X';
    B : in STD_LOGIC := 'X';
    A : in STD_LOGIC := 'X';
    Y : out STD_LOGIC := 'U'
  );
	end component;

	component AND8_NI
		port (
    H : in STD_LOGIC := 'X';
    G : in STD_LOGIC := 'X';
    F : in STD_LOGIC := 'X';
    E : in STD_LOGIC := 'X';
    D : in STD_LOGIC := 'X';
    C : in STD_LOGIC := 'X';
    B : in STD_LOGIC := 'X';
    A : in STD_LOGIC := 'X';
    Y : out STD_LOGIC := 'U'
  );
	end component;

	component AUTO_IBUF
		port(
		I : in std_logic;
		O : out std_logic
	);
	end component;

	component AUTO_OBUF
		port(
		I : in std_logic;
		O : out std_logic
	);
	end component;

	component CNTR_4BIN_S_NI
		port( 
  LOAD: in STD_LOGIC;
  CLR: in STD_LOGIC;
  ENP: in STD_LOGIC; 
  ENT: in STD_LOGIC;
  CLK: in STD_LOGIC;
  A :in STD_LOGIC;
  B :in STD_LOGIC;
  C :in STD_LOGIC;
  D :in STD_LOGIC;
  RCO : out STD_LOGIC;
  QA : out STD_LOGIC;
  QB : out STD_LOGIC;
  QC : out STD_LOGIC;
  QD : out STD_LOGIC
 );
	end component;

	component CNTR_BCD_S_NI
		port( 
  LOAD: in std_logic;
  CLR: in std_logic;
  ENP: in std_logic; 
  ENT: in std_logic;
  CLK: in std_logic;
  A:in STD_LOGIC;
  B:in STD_LOGIC;
  C:in STD_LOGIC;
  D:in STD_LOGIC;
  RCO: out STD_LOGIC;
  QA: out STD_LOGIC;
  QB: out STD_LOGIC;
  QC: out STD_LOGIC;
  QD: out STD_LOGIC
 );
	end component;

	component DIGITAL_HIGH_NI
		Port ( 
  Y : out  STD_LOGIC:='1'
 );
	end component;

	component DIGITAL_LOW_NI
		Port ( 
  Y : out  STD_LOGIC:='0'
 );
	end component;

	component FF_JK_PSCLR_CO_NI
		port (
   J: in STD_LOGIC;
   K: in STD_LOGIC;
   CLK : in STD_LOGIC;  
   PR: in STD_LOGIC;
   CLR: in STD_LOGIC;
   Q : out STD_LOGIC;
   Qneg : out STD_LOGIC
);
	end component;

	component FF_T_CLR_CO_NI
		port (
    T: in STD_LOGIC;
    CLK : in STD_LOGIC;
    CLR : in STD_LOGIC;
     Q : out STD_LOGIC;
     Qneg : out STD_LOGIC
 );
	end component;

	component INV_NI
		port (
    A : in STD_LOGIC := 'X';
    Y : out STD_LOGIC := 'U'
  );
	end component;

	component OR2_NI
		port (
    B : in STD_LOGIC := 'X';
    A : in STD_LOGIC := 'X';
    Y : out STD_LOGIC := 'U'
  );
	end component;
	signal \1\ : std_logic;
	signal \PLD2/VCNT7\ : std_logic;
	signal \5\ : std_logic;
	signal \PLD25/CLK\ : std_logic;
	signal \8\ : std_logic;
	signal \100\ : std_logic;
	signal \PLD2/vblank\ : std_logic;
	signal \PLD1/hs\ : std_logic;
	signal \PLD1/HCNT2\ : std_logic;
	signal \PLD1/rst_n\ : std_logic;
	signal \233\ : std_logic;
	signal \PLD1/HCNT3\ : std_logic;
	signal \PLD1/HCNT6\ : std_logic;
	signal \PLD2/VCNT2\ : std_logic;
	signal \423\ : std_logic;
	signal \PLD2/VCNT3\ : std_logic;
	signal \PLD2/VCNT\ : std_logic;
	signal \237\ : std_logic;
	signal \PLD1/hblank\ : std_logic;
	signal \249\ : std_logic;
	signal \7\ : std_logic;
	signal \236\ : std_logic;
	signal \420\ : std_logic;
	signal \235\ : std_logic;
	signal \234\ : std_logic;
	signal \PLD1/HCNT7\ : std_logic;
	signal \PLD1/HCNT9\ : std_logic;
	signal \PLD1/HCNT0\ : std_logic;
	signal \PLD2/vs\ : std_logic;
	signal \4\ : std_logic;
	signal \424\ : std_logic;
	signal \PLD2/VCNT1\ : std_logic;
	signal \PLD1/HCNT1\ : std_logic;
	signal \PLD2/VCNT4\ : std_logic;
	signal \PLD2/VCNT6\ : std_logic;
	signal \422\ : std_logic;
	signal \PLD1/CLK\ : std_logic;
	signal \PLD2/VCNT0\ : std_logic;
	signal \6\ : std_logic;
	signal \PLD1/HCNT\ : std_logic;
	signal \PLD1/HCNT5\ : std_logic;
	signal \PLD25/JA1\ : std_logic;
	signal \421\ : std_logic;
	signal \PLD2/VCNT5\ : std_logic;
	signal \PLD1/HCNT8\ : std_logic;
	signal \PLD2/VCNT8\ : std_logic;
	signal \PLD1/HCNT4\ : std_logic;
	signal \232\ : std_logic;
	signal \PLD25/JA2\ : std_logic;
	signal \47\ : std_logic;
	signal \384\ : std_logic;
	signal \393\ : std_logic;
	signal \390\ : std_logic;
	signal \387\ : std_logic;
	signal \385\ : std_logic;
	signal \392\ : std_logic;
	signal \391\ : std_logic;
	signal \389\ : std_logic;
	signal \386\ : std_logic;
	signal \388\ : std_logic;
	signal \68\ : std_logic;
	signal \73\ : std_logic;
	signal \58\ : std_logic;
	signal \24\ : std_logic;
	signal \67\ : std_logic;
	signal \21\ : std_logic;
	signal \64\ : std_logic;
	signal \66\ : std_logic;
	signal \69\ : std_logic;
	signal \72\ : std_logic;
	signal \70\ : std_logic;
	signal \22\ : std_logic;
	signal \71\ : std_logic;
	signal \78\ : std_logic;
	signal \77\ : std_logic;
	signal \92\ : std_logic;
	signal \59\ : std_logic;
	signal \63\ : std_logic;
	signal \51\ : std_logic;
	signal \61\ : std_logic;
	signal \25\ : std_logic;
	signal \23\ : std_logic;
	signal \53\ : std_logic;
	signal \20\ : std_logic;
	signal \65\ : std_logic;
	signal \91\ : std_logic;
	signal \26\ : std_logic;
	signal \93\ : std_logic;
	signal \2\ : std_logic;
	signal \87\ : std_logic;
	signal \340\ : std_logic;
	signal \375\ : std_logic;
	signal \109\ : std_logic;
	signal \106\ : std_logic;
	signal \381\ : std_logic;
	signal \108\ : std_logic;
	signal \99\ : std_logic;
	signal \379\ : std_logic;
	signal \378\ : std_logic;
	signal \102\ : std_logic;
	signal \107\ : std_logic;
	signal \380\ : std_logic;
	signal \376\ : std_logic;
	signal \103\ : std_logic;
	signal \105\ : std_logic;
	signal \95\ : std_logic;
	signal \383\ : std_logic;
	signal \104\ : std_logic;
	signal \110\ : std_logic;
	signal \76\ : std_logic;
	signal \377\ : std_logic;
	signal \3\ : std_logic;
	signal \173\ : std_logic;
	signal \9\ : std_logic;
	signal \10\ : std_logic;
	signal \11\ : std_logic;
	signal \12\ : std_logic;
	signal \13\ : std_logic;
	signal \222\ : std_logic;
	signal \15\ : std_logic;
	signal \14\ : std_logic;
	signal \16\ : std_logic;
begin
	CLK_AUTOBUF : AUTO_IBUF
		port map( I => CLK, O => \PLD25/CLK\ );
	SW0_AUTOBUF : AUTO_IBUF
		port map( I => SW0, O => \9\ );
	SW1_AUTOBUF : AUTO_IBUF
		port map( I => SW1, O => \10\ );
	SW2_AUTOBUF : AUTO_IBUF
		port map( I => SW2, O => \11\ );
	SW3_AUTOBUF : AUTO_IBUF
		port map( I => SW3, O => \173\ );
	SW4_AUTOBUF : AUTO_IBUF
		port map( I => SW4, O => \12\ );
	SW5_AUTOBUF : AUTO_IBUF
		port map( I => SW5, O => \13\ );
	SW6_AUTOBUF : AUTO_IBUF
		port map( I => SW6, O => \5\ );
	SW7_AUTOBUF : AUTO_IBUF
		port map( I => SW7, O => \14\ );
	SW8_AUTOBUF : AUTO_IBUF
		port map( I => SW8, O => \16\ );
	SW9_AUTOBUF : AUTO_IBUF
		port map( I => SW9, O => \8\ );
	SW10_AUTOBUF : AUTO_IBUF
		port map( I => SW10, O => \222\ );
	SW11_AUTOBUF : AUTO_IBUF
		port map( I => SW11, O => \15\ );
	rst_n_AUTOBUF : AUTO_IBUF
		port map( I => rst_n, O => \PLD1/rst_n\ );
	red0_AUTOBUF : AUTO_OBUF
		port map( I => \232\, O => red0 );
	red1_AUTOBUF : AUTO_OBUF
		port map( I => \233\, O => red1 );
	red2_AUTOBUF : AUTO_OBUF
		port map( I => \234\, O => red2 );
	red3_AUTOBUF : AUTO_OBUF
		port map( I => \235\, O => red3 );
	green0_AUTOBUF : AUTO_OBUF
		port map( I => \236\, O => green0 );
	green1_AUTOBUF : AUTO_OBUF
		port map( I => \237\, O => green1 );
	green2_AUTOBUF : AUTO_OBUF
		port map( I => \421\, O => green2 );
	green3_AUTOBUF : AUTO_OBUF
		port map( I => \249\, O => green3 );
	blue0_AUTOBUF : AUTO_OBUF
		port map( I => \420\, O => blue0 );
	blue1_AUTOBUF : AUTO_OBUF
		port map( I => \422\, O => blue1 );
	blue2_AUTOBUF : AUTO_OBUF
		port map( I => \423\, O => blue2 );
	blue3_AUTOBUF : AUTO_OBUF
		port map( I => \424\, O => blue3 );
	hs_AUTOBUF : AUTO_OBUF
		port map( I => \PLD1/hs\, O => hs );
	vs_AUTOBUF : AUTO_OBUF
		port map( I => \PLD2/vs\, O => vs );
	HCOUNT_AUTOBUF : AUTO_OBUF
		port map( I => \4\, O => HCOUNT );
	VCOUNT_AUTOBUF : AUTO_OBUF
		port map( I => \7\, O => VCOUNT );
	U412 : INV_NI
		port map( Y => \100\, A => \47\ );
	U413 : AND2_NI
		port map( A => \100\, B => \9\, Y => \232\ );
	U414 : AND2_NI
		port map( A => \100\, B => \10\, Y => \233\ );
	U415 : AND2_NI
		port map( A => \100\, B => \11\, Y => \234\ );
	U416 : AND2_NI
		port map( A => \100\, B => \173\, Y => \235\ );
	U417 : AND2_NI
		port map( A => \100\, B => \12\, Y => \236\ );
	U418 : AND2_NI
		port map( A => \100\, B => \13\, Y => \237\ );
	U419 : AND2_NI
		port map( A => \100\, B => \5\, Y => \421\ );
	U420 : AND2_NI
		port map( A => \100\, B => \14\, Y => \249\ );
	U421 : AND2_NI
		port map( A => \100\, B => \16\, Y => \420\ );
	U422 : AND2_NI
		port map( A => \100\, B => \8\, Y => \422\ );
	U423 : AND2_NI
		port map( A => \100\, B => \222\, Y => \423\ );
	U424 : AND2_NI
		port map( A => \100\, B => \15\, Y => \424\ );
	U40 : OR2_NI
		port map( A => \PLD2/vblank\, B => \PLD1/hblank\, Y => \47\ );
	U1 : DIGITAL_LOW_NI
		port map( Y => open );
	U2 : DIGITAL_HIGH_NI
		port map( Y => open );
	U28 : AND2_NI
		port map( A => \PLD1/HCNT\, B => \100\, Y => \4\ );
	U29 : INV_NI
		port map( Y => \6\, A => \PLD2/vblank\ );
	U30 : AND2_NI
		port map( A => \6\, B => \PLD2/VCNT\, Y => \7\ );
	U376 : CNTR_4BIN_S_NI
		port map( QA => open, QB => \PLD1/CLK\, QC => open, QD => open, RCO => open, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \PLD25/CLK\ );
	U377 : DIGITAL_HIGH_NI
		port map( Y => \384\ );
	U378 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \385\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \PLD25/CLK\ );
	U379 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \390\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \385\ );
	U380 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \391\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \390\ );
	U381 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \392\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \391\ );
	U382 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \387\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \392\ );
	U383 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \388\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \387\ );
	U384 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \386\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \388\ );
	U385 : FF_T_CLR_CO_NI
		port map( T => \384\, Q => \PLD25/JA1\, Qneg => open, CLR => \384\, CLK => \387\ );
	U386 : CNTR_BCD_S_NI
		port map( QA => open, QB => open, QC => open, QD => open, RCO => \389\, A => \393\, B => \393\, C => \393\, D => \393\, ENP => \384\, ENT => \384\, LOAD => \384\, CLR => \384\, CLK => \386\ );
	U387 : FF_T_CLR_CO_NI
		port map( T => \384\, Q => \PLD25/JA2\, Qneg => open, CLR => \384\, CLK => \389\ );
	U388 : DIGITAL_LOW_NI
		port map( Y => \393\ );
	U63 : DIGITAL_HIGH_NI
		port map( Y => \68\ );
	U64 : CNTR_4BIN_S_NI
		port map( QA => \63\, QB => \64\, QC => \66\, QD => \67\, RCO => \69\, A => \68\, B => \68\, C => \68\, D => \68\, ENP => \PLD1/rst_n\, ENT => \PLD1/rst_n\, LOAD => \68\, CLR => \51\, CLK => \PLD1/CLK\ );
	U65 : CNTR_4BIN_S_NI
		port map( QA => \59\, QB => \21\, QC => \61\, QD => \22\, RCO => \70\, A => \68\, B => \68\, C => \68\, D => \68\, ENP => \69\, ENT => \69\, LOAD => \68\, CLR => \51\, CLK => \PLD1/CLK\ );
	U66 : CNTR_4BIN_S_NI
		port map( QA => \72\, QB => \73\, QC => open, QD => open, RCO => open, A => \68\, B => \68\, C => \68\, D => \68\, ENP => \71\, ENT => \71\, LOAD => \68\, CLR => \51\, CLK => \PLD1/CLK\ );
	U151 : AND2_NI
		port map( A => \70\, B => \69\, Y => \71\ );
	U152 : AND7_NI
		port map( A => \63\, B => \64\, C => \66\, D => \67\, Y => \58\, E => \59\, F => \72\, G => \73\ );
	U73 : FF_JK_PSCLR_CO_NI
		port map( J => \91\, Q => \PLD1/hs\, Qneg => open, K => \93\, CLR => \68\, CLK => \PLD1/CLK\, PR => \68\ );
	U75 : INV_NI
		port map( Y => \51\, A => \58\ );
	U156 : AND4_NI
		port map( A => \63\, B => \64\, C => \66\, D => \67\, Y => \65\ );
	U157 : AND4_NI
		port map( A => \22\, B => \61\, C => \21\, D => \20\, Y => \53\ );
	U166 : AND4_NI
		port map( A => \22\, B => \25\, C => \24\, D => \23\, Y => \26\ );
	U167 : AND3_NI
		port map( A => \87\, B => \77\, C => \65\, Y => \92\ );
	U181 : AND2_NI
		port map( A => \78\, B => \73\, Y => \87\ );
	U182 : INV_NI
		port map( Y => \20\, A => \59\ );
	U183 : INV_NI
		port map( Y => \23\, A => \61\ );
	U15 : INV_NI
		port map( Y => \24\, A => \21\ );
	U184 : INV_NI
		port map( Y => \25\, A => \59\ );
	U185 : INV_NI
		port map( Y => \78\, A => \72\ );
	U186 : OR2_NI
		port map( A => \53\, B => \26\, Y => \77\ );
	U187 : OR2_NI
		port map( A => \58\, B => \92\, Y => \91\ );
	U188 : AND2_NI
		port map( A => \51\, B => \92\, Y => \93\ );
	U14 : AND2_NI
		port map( A => \73\, B => \22\, Y => \1\ );
	U17 : AND2_NI
		port map( A => \73\, B => \72\, Y => \2\ );
	U18 : OR2_NI
		port map( A => \1\, B => \2\, Y => \PLD1/hblank\ );
	U3 : AND2_NI
		port map( A => \63\, B => \PLD1/HCNT\, Y => \PLD1/HCNT0\ );
	U4 : AND2_NI
		port map( A => \64\, B => \PLD1/HCNT\, Y => \PLD1/HCNT1\ );
	U5 : AND2_NI
		port map( A => \66\, B => \PLD1/HCNT\, Y => \PLD1/HCNT2\ );
	U6 : AND2_NI
		port map( A => \67\, B => \PLD1/HCNT\, Y => \PLD1/HCNT3\ );
	U7 : AND2_NI
		port map( A => \59\, B => \PLD1/HCNT\, Y => \PLD1/HCNT4\ );
	U8 : AND2_NI
		port map( A => \21\, B => \PLD1/HCNT\, Y => \PLD1/HCNT5\ );
	U9 : AND2_NI
		port map( A => \61\, B => \PLD1/HCNT\, Y => \PLD1/HCNT6\ );
	U10 : AND2_NI
		port map( A => \22\, B => \PLD1/HCNT\, Y => \PLD1/HCNT7\ );
	U11 : AND2_NI
		port map( A => \72\, B => \PLD1/HCNT\, Y => \PLD1/HCNT8\ );
	U12 : AND2_NI
		port map( A => \73\, B => \PLD1/HCNT\, Y => \PLD1/HCNT9\ );
	U13 : INV_NI
		port map( Y => \PLD1/HCNT\, A => \PLD1/hblank\ );
	U62 : CNTR_4BIN_S_NI
		port map( QA => \110\, QB => \76\, QC => \109\, QD => \383\, RCO => \340\, A => \375\, B => \375\, C => \375\, D => \375\, ENP => \PLD1/rst_n\, ENT => \PLD1/rst_n\, LOAD => \375\, CLR => \376\, CLK => \PLD1/hs\ );
	U153 : CNTR_4BIN_S_NI
		port map( QA => \108\, QB => \107\, QC => \106\, QD => \105\, RCO => \377\, A => \375\, B => \375\, C => \375\, D => \375\, ENP => \340\, ENT => \340\, LOAD => \375\, CLR => \376\, CLK => \PLD1/hs\ );
	U154 : CNTR_4BIN_S_NI
		port map( QA => \104\, QB => \378\, QC => open, QD => open, RCO => open, A => \375\, B => \375\, C => \375\, D => \375\, ENP => \379\, ENT => \379\, LOAD => \375\, CLR => \376\, CLK => \PLD1/hs\ );
	U74 : DIGITAL_HIGH_NI
		port map( Y => \375\ );
	U155 : AND2_NI
		port map( A => \377\, B => \340\, Y => \379\ );
	U76 : FF_JK_PSCLR_CO_NI
		port map( J => \381\, Q => \PLD2/vs\, Qneg => open, K => \103\, CLR => \375\, CLK => \PLD1/hs\, PR => \375\ );
	U82 : AND2_NI
		port map( A => \378\, B => \383\, Y => \380\ );
	U83 : INV_NI
		port map( Y => \376\, A => \380\ );
	U189 : AND8_NI
		port map( A => \110\, B => \99\, C => \383\, D => \95\, Y => \102\, E => \107\, F => \106\, G => \105\, H => \104\ );
	U190 : INV_NI
		port map( Y => \99\, A => \109\ );
	U191 : INV_NI
		port map( Y => \95\, A => \108\ );
	U192 : AND2_NI
		port map( A => \376\, B => \102\, Y => \103\ );
	U193 : OR2_NI
		port map( A => \380\, B => \102\, Y => \381\ );
	U194 : AND4_NI
		port map( A => \107\, B => \106\, C => \105\, D => \104\, Y => \3\ );
	U195 : OR2_NI
		port map( A => \3\, B => \378\, Y => \PLD2/vblank\ );
	U16 : INV_NI
		port map( Y => \PLD2/VCNT\, A => \PLD2/vblank\ );
	U19 : AND2_NI
		port map( A => \110\, B => \PLD2/VCNT\, Y => \PLD2/VCNT0\ );
	U20 : AND2_NI
		port map( A => \76\, B => \PLD2/VCNT\, Y => \PLD2/VCNT1\ );
	U21 : AND2_NI
		port map( A => \109\, B => \PLD2/VCNT\, Y => \PLD2/VCNT2\ );
	U22 : AND2_NI
		port map( A => \383\, B => \PLD2/VCNT\, Y => \PLD2/VCNT3\ );
	U23 : AND2_NI
		port map( A => \108\, B => \PLD2/VCNT\, Y => \PLD2/VCNT4\ );
	U24 : AND2_NI
		port map( A => \107\, B => \PLD2/VCNT\, Y => \PLD2/VCNT5\ );
	U25 : AND2_NI
		port map( A => \106\, B => \PLD2/VCNT\, Y => \PLD2/VCNT6\ );
	U26 : AND2_NI
		port map( A => \105\, B => \PLD2/VCNT\, Y => \PLD2/VCNT7\ );
	U27 : AND2_NI
		port map( A => \104\, B => \PLD2/VCNT\, Y => \PLD2/VCNT8\ );
end behavioral;