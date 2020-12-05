--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Fri Dec  4 23:04:27 2020
--Host        : l2study running 64-bit Ubuntu 18.04.5 LTS
--Command     : generate_target system_20_wrapper.bd
--Design      : system_20_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_20_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    btns_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    jb_pin10_io : inout STD_LOGIC;
    jb_pin1_io : inout STD_LOGIC;
    jb_pin2_io : inout STD_LOGIC;
    jb_pin3_io : inout STD_LOGIC;
    jb_pin4_io : inout STD_LOGIC;
    jb_pin7_io : inout STD_LOGIC;
    jb_pin8_io : inout STD_LOGIC;
    jb_pin9_io : inout STD_LOGIC;
    je_pin10_io : inout STD_LOGIC;
    je_pin1_io : inout STD_LOGIC;
    je_pin2_io : inout STD_LOGIC;
    je_pin3_io : inout STD_LOGIC;
    je_pin4_io : inout STD_LOGIC;
    je_pin7_io : inout STD_LOGIC;
    je_pin8_io : inout STD_LOGIC;
    je_pin9_io : inout STD_LOGIC;
    ld0123_basic : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ld56_rgb : out STD_LOGIC_VECTOR ( 5 downto 0 );
    sws_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end system_20_wrapper;

architecture STRUCTURE of system_20_wrapper is
  component system_20 is
  port (
    ld56_rgb : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ld0123_basic : out STD_LOGIC_VECTOR ( 3 downto 0 );
    je_pin1_o : out STD_LOGIC;
    je_pin7_i : in STD_LOGIC;
    je_pin2_o : out STD_LOGIC;
    je_pin8_i : in STD_LOGIC;
    je_pin3_o : out STD_LOGIC;
    je_pin9_i : in STD_LOGIC;
    je_pin10_o : out STD_LOGIC;
    je_pin4_o : out STD_LOGIC;
    je_pin3_i : in STD_LOGIC;
    je_pin4_i : in STD_LOGIC;
    je_pin1_i : in STD_LOGIC;
    je_pin2_i : in STD_LOGIC;
    je_pin10_t : out STD_LOGIC;
    je_pin8_t : out STD_LOGIC;
    je_pin9_t : out STD_LOGIC;
    je_pin4_t : out STD_LOGIC;
    je_pin9_o : out STD_LOGIC;
    je_pin10_i : in STD_LOGIC;
    je_pin7_t : out STD_LOGIC;
    je_pin1_t : out STD_LOGIC;
    je_pin2_t : out STD_LOGIC;
    je_pin7_o : out STD_LOGIC;
    je_pin3_t : out STD_LOGIC;
    je_pin8_o : out STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    btns_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sws_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    jb_pin1_o : out STD_LOGIC;
    jb_pin7_i : in STD_LOGIC;
    jb_pin2_o : out STD_LOGIC;
    jb_pin8_i : in STD_LOGIC;
    jb_pin3_o : out STD_LOGIC;
    jb_pin9_i : in STD_LOGIC;
    jb_pin10_o : out STD_LOGIC;
    jb_pin4_o : out STD_LOGIC;
    jb_pin3_i : in STD_LOGIC;
    jb_pin4_i : in STD_LOGIC;
    jb_pin1_i : in STD_LOGIC;
    jb_pin2_i : in STD_LOGIC;
    jb_pin10_t : out STD_LOGIC;
    jb_pin8_t : out STD_LOGIC;
    jb_pin9_t : out STD_LOGIC;
    jb_pin4_t : out STD_LOGIC;
    jb_pin9_o : out STD_LOGIC;
    jb_pin10_i : in STD_LOGIC;
    jb_pin7_t : out STD_LOGIC;
    jb_pin1_t : out STD_LOGIC;
    jb_pin2_t : out STD_LOGIC;
    jb_pin7_o : out STD_LOGIC;
    jb_pin3_t : out STD_LOGIC;
    jb_pin8_o : out STD_LOGIC
  );
  end component system_20;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal jb_pin10_i : STD_LOGIC;
  signal jb_pin10_o : STD_LOGIC;
  signal jb_pin10_t : STD_LOGIC;
  signal jb_pin1_i : STD_LOGIC;
  signal jb_pin1_o : STD_LOGIC;
  signal jb_pin1_t : STD_LOGIC;
  signal jb_pin2_i : STD_LOGIC;
  signal jb_pin2_o : STD_LOGIC;
  signal jb_pin2_t : STD_LOGIC;
  signal jb_pin3_i : STD_LOGIC;
  signal jb_pin3_o : STD_LOGIC;
  signal jb_pin3_t : STD_LOGIC;
  signal jb_pin4_i : STD_LOGIC;
  signal jb_pin4_o : STD_LOGIC;
  signal jb_pin4_t : STD_LOGIC;
  signal jb_pin7_i : STD_LOGIC;
  signal jb_pin7_o : STD_LOGIC;
  signal jb_pin7_t : STD_LOGIC;
  signal jb_pin8_i : STD_LOGIC;
  signal jb_pin8_o : STD_LOGIC;
  signal jb_pin8_t : STD_LOGIC;
  signal jb_pin9_i : STD_LOGIC;
  signal jb_pin9_o : STD_LOGIC;
  signal jb_pin9_t : STD_LOGIC;
  signal je_pin10_i : STD_LOGIC;
  signal je_pin10_o : STD_LOGIC;
  signal je_pin10_t : STD_LOGIC;
  signal je_pin1_i : STD_LOGIC;
  signal je_pin1_o : STD_LOGIC;
  signal je_pin1_t : STD_LOGIC;
  signal je_pin2_i : STD_LOGIC;
  signal je_pin2_o : STD_LOGIC;
  signal je_pin2_t : STD_LOGIC;
  signal je_pin3_i : STD_LOGIC;
  signal je_pin3_o : STD_LOGIC;
  signal je_pin3_t : STD_LOGIC;
  signal je_pin4_i : STD_LOGIC;
  signal je_pin4_o : STD_LOGIC;
  signal je_pin4_t : STD_LOGIC;
  signal je_pin7_i : STD_LOGIC;
  signal je_pin7_o : STD_LOGIC;
  signal je_pin7_t : STD_LOGIC;
  signal je_pin8_i : STD_LOGIC;
  signal je_pin8_o : STD_LOGIC;
  signal je_pin8_t : STD_LOGIC;
  signal je_pin9_i : STD_LOGIC;
  signal je_pin9_o : STD_LOGIC;
  signal je_pin9_t : STD_LOGIC;
begin
jb_pin10_iobuf: component IOBUF
     port map (
      I => jb_pin10_o,
      IO => jb_pin10_io,
      O => jb_pin10_i,
      T => jb_pin10_t
    );
jb_pin1_iobuf: component IOBUF
     port map (
      I => jb_pin1_o,
      IO => jb_pin1_io,
      O => jb_pin1_i,
      T => jb_pin1_t
    );
jb_pin2_iobuf: component IOBUF
     port map (
      I => jb_pin2_o,
      IO => jb_pin2_io,
      O => jb_pin2_i,
      T => jb_pin2_t
    );
jb_pin3_iobuf: component IOBUF
     port map (
      I => jb_pin3_o,
      IO => jb_pin3_io,
      O => jb_pin3_i,
      T => jb_pin3_t
    );
jb_pin4_iobuf: component IOBUF
     port map (
      I => jb_pin4_o,
      IO => jb_pin4_io,
      O => jb_pin4_i,
      T => jb_pin4_t
    );
jb_pin7_iobuf: component IOBUF
     port map (
      I => jb_pin7_o,
      IO => jb_pin7_io,
      O => jb_pin7_i,
      T => jb_pin7_t
    );
jb_pin8_iobuf: component IOBUF
     port map (
      I => jb_pin8_o,
      IO => jb_pin8_io,
      O => jb_pin8_i,
      T => jb_pin8_t
    );
jb_pin9_iobuf: component IOBUF
     port map (
      I => jb_pin9_o,
      IO => jb_pin9_io,
      O => jb_pin9_i,
      T => jb_pin9_t
    );
je_pin10_iobuf: component IOBUF
     port map (
      I => je_pin10_o,
      IO => je_pin10_io,
      O => je_pin10_i,
      T => je_pin10_t
    );
je_pin1_iobuf: component IOBUF
     port map (
      I => je_pin1_o,
      IO => je_pin1_io,
      O => je_pin1_i,
      T => je_pin1_t
    );
je_pin2_iobuf: component IOBUF
     port map (
      I => je_pin2_o,
      IO => je_pin2_io,
      O => je_pin2_i,
      T => je_pin2_t
    );
je_pin3_iobuf: component IOBUF
     port map (
      I => je_pin3_o,
      IO => je_pin3_io,
      O => je_pin3_i,
      T => je_pin3_t
    );
je_pin4_iobuf: component IOBUF
     port map (
      I => je_pin4_o,
      IO => je_pin4_io,
      O => je_pin4_i,
      T => je_pin4_t
    );
je_pin7_iobuf: component IOBUF
     port map (
      I => je_pin7_o,
      IO => je_pin7_io,
      O => je_pin7_i,
      T => je_pin7_t
    );
je_pin8_iobuf: component IOBUF
     port map (
      I => je_pin8_o,
      IO => je_pin8_io,
      O => je_pin8_i,
      T => je_pin8_t
    );
je_pin9_iobuf: component IOBUF
     port map (
      I => je_pin9_o,
      IO => je_pin9_io,
      O => je_pin9_i,
      T => je_pin9_t
    );
system_20_i: component system_20
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      btns_4bits_tri_i(3 downto 0) => btns_4bits_tri_i(3 downto 0),
      jb_pin10_i => jb_pin10_i,
      jb_pin10_o => jb_pin10_o,
      jb_pin10_t => jb_pin10_t,
      jb_pin1_i => jb_pin1_i,
      jb_pin1_o => jb_pin1_o,
      jb_pin1_t => jb_pin1_t,
      jb_pin2_i => jb_pin2_i,
      jb_pin2_o => jb_pin2_o,
      jb_pin2_t => jb_pin2_t,
      jb_pin3_i => jb_pin3_i,
      jb_pin3_o => jb_pin3_o,
      jb_pin3_t => jb_pin3_t,
      jb_pin4_i => jb_pin4_i,
      jb_pin4_o => jb_pin4_o,
      jb_pin4_t => jb_pin4_t,
      jb_pin7_i => jb_pin7_i,
      jb_pin7_o => jb_pin7_o,
      jb_pin7_t => jb_pin7_t,
      jb_pin8_i => jb_pin8_i,
      jb_pin8_o => jb_pin8_o,
      jb_pin8_t => jb_pin8_t,
      jb_pin9_i => jb_pin9_i,
      jb_pin9_o => jb_pin9_o,
      jb_pin9_t => jb_pin9_t,
      je_pin10_i => je_pin10_i,
      je_pin10_o => je_pin10_o,
      je_pin10_t => je_pin10_t,
      je_pin1_i => je_pin1_i,
      je_pin1_o => je_pin1_o,
      je_pin1_t => je_pin1_t,
      je_pin2_i => je_pin2_i,
      je_pin2_o => je_pin2_o,
      je_pin2_t => je_pin2_t,
      je_pin3_i => je_pin3_i,
      je_pin3_o => je_pin3_o,
      je_pin3_t => je_pin3_t,
      je_pin4_i => je_pin4_i,
      je_pin4_o => je_pin4_o,
      je_pin4_t => je_pin4_t,
      je_pin7_i => je_pin7_i,
      je_pin7_o => je_pin7_o,
      je_pin7_t => je_pin7_t,
      je_pin8_i => je_pin8_i,
      je_pin8_o => je_pin8_o,
      je_pin8_t => je_pin8_t,
      je_pin9_i => je_pin9_i,
      je_pin9_o => je_pin9_o,
      je_pin9_t => je_pin9_t,
      ld0123_basic(3 downto 0) => ld0123_basic(3 downto 0),
      ld56_rgb(5 downto 0) => ld56_rgb(5 downto 0),
      sws_4bits_tri_i(3 downto 0) => sws_4bits_tri_i(3 downto 0)
    );
end STRUCTURE;
