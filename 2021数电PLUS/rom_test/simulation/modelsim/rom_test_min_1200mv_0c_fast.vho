-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

-- DATE "07/08/2021 14:30:43"

-- 
-- Device: Altera EP4CE10E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	rom_test IS
    PORT (
	cout : OUT std_logic;
	clk : IN std_logic;
	ch : IN std_logic_vector(1 DOWNTO 0);
	o : OUT std_logic_vector(7 DOWNTO 0)
	);
END rom_test;

-- Design Ports Information
-- cout	=>  Location: PIN_143,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[7]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[6]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[5]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[4]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[3]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[2]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[1]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o[0]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[0]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ch[1]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF rom_test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_cout : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_ch : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_o : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst1|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst1|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \inst1|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~16_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[90]~2_combout\ : std_logic;
SIGNAL \inst|Add0~0_combout\ : std_logic;
SIGNAL \inst|Add0~1\ : std_logic;
SIGNAL \inst|Add0~2_combout\ : std_logic;
SIGNAL \inst|Add0~3\ : std_logic;
SIGNAL \inst|Add0~4_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~0_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\ : std_logic;
SIGNAL \inst|Add0~5\ : std_logic;
SIGNAL \inst|Add0~6_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~1\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~2_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[94]~0_combout\ : std_logic;
SIGNAL \inst|Add0~7\ : std_logic;
SIGNAL \inst|Add0~8_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~3\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~5\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~7\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~9\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~11\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~12_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\ : std_logic;
SIGNAL \inst|Add0~15\ : std_logic;
SIGNAL \inst|Add0~16_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~13\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~4_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\ : std_logic;
SIGNAL \inst|Add0~9\ : std_logic;
SIGNAL \inst|Add0~10_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~6_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\ : std_logic;
SIGNAL \inst|Add0~11\ : std_logic;
SIGNAL \inst|Add0~12_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~8_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\ : std_logic;
SIGNAL \inst|Add0~13\ : std_logic;
SIGNAL \inst|Add0~14_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~10_combout\ : std_logic;
SIGNAL \inst|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|Equal0~1_combout\ : std_logic;
SIGNAL \inst|Equal0~2_combout\ : std_logic;
SIGNAL \inst|cout~q\ : std_logic;
SIGNAL \ch[0]~input_o\ : std_logic;
SIGNAL \ch[1]~input_o\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \inst|data_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \inst1|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst|count\ : std_logic_vector(9 DOWNTO 0);

BEGIN

cout <= ww_cout;
ww_clk <= clk;
ww_ch <= ch;
o <= ww_o;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|data_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\ch[1]~input_o\ & \ch[0]~input_o\ & \inst|count\(9) & \inst|count\(8) & \inst|count\(7) & \inst|count\(6) & \inst|count\(5) & \inst|count\(4) & \inst|count\(3) & 
\inst|count\(2) & \inst|count\(1) & \inst|count\(0));

\inst|data_rtl_0|auto_generated|ram_block1a6~portadataout\ <= \inst|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);
\inst|data_rtl_0|auto_generated|ram_block1a7\ <= \inst|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\(1);

\inst|data_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\ch[1]~input_o\ & \ch[0]~input_o\ & \inst|count\(9) & \inst|count\(8) & \inst|count\(7) & \inst|count\(6) & \inst|count\(5) & \inst|count\(4) & \inst|count\(3) & 
\inst|count\(2) & \inst|count\(1) & \inst|count\(0));

\inst|data_rtl_0|auto_generated|ram_block1a4~portadataout\ <= \inst|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\inst|data_rtl_0|auto_generated|ram_block1a5\ <= \inst|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);

\inst|data_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\ch[1]~input_o\ & \ch[0]~input_o\ & \inst|count\(9) & \inst|count\(8) & \inst|count\(7) & \inst|count\(6) & \inst|count\(5) & \inst|count\(4) & \inst|count\(3) & 
\inst|count\(2) & \inst|count\(1) & \inst|count\(0));

\inst|data_rtl_0|auto_generated|ram_block1a2~portadataout\ <= \inst|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);
\inst|data_rtl_0|auto_generated|ram_block1a3\ <= \inst|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\(1);

\inst|data_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\ch[1]~input_o\ & \ch[0]~input_o\ & \inst|count\(9) & \inst|count\(8) & \inst|count\(7) & \inst|count\(6) & \inst|count\(5) & \inst|count\(4) & \inst|count\(3) & 
\inst|count\(2) & \inst|count\(1) & \inst|count\(0));

\inst|data_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \inst|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\inst|data_rtl_0|auto_generated|ram_block1a1\ <= \inst|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);

\inst1|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~input_o\);

\inst1|altpll_component|auto_generated|wire_pll1_clk\(0) <= \inst1|altpll_component|auto_generated|pll1_CLK_bus\(0);
\inst1|altpll_component|auto_generated|wire_pll1_clk\(1) <= \inst1|altpll_component|auto_generated|pll1_CLK_bus\(1);
\inst1|altpll_component|auto_generated|wire_pll1_clk\(2) <= \inst1|altpll_component|auto_generated|pll1_CLK_bus\(2);
\inst1|altpll_component|auto_generated|wire_pll1_clk\(3) <= \inst1|altpll_component|auto_generated|pll1_CLK_bus\(3);
\inst1|altpll_component|auto_generated|wire_pll1_clk\(4) <= \inst1|altpll_component|auto_generated|pll1_CLK_bus\(4);

\inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst1|altpll_component|auto_generated|wire_pll1_clk\(0));

-- Location: IOOBUF_X1_Y24_N2
\cout~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|cout~q\,
	devoe => ww_devoe,
	o => ww_cout);

-- Location: IOOBUF_X23_Y0_N9
\o[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => ww_o(7));

-- Location: IOOBUF_X21_Y0_N9
\o[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a6~portadataout\,
	devoe => ww_devoe,
	o => ww_o(6));

-- Location: IOOBUF_X18_Y0_N23
\o[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => ww_o(5));

-- Location: IOOBUF_X16_Y0_N9
\o[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a4~portadataout\,
	devoe => ww_devoe,
	o => ww_o(4));

-- Location: IOOBUF_X34_Y9_N2
\o[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => ww_o(3));

-- Location: IOOBUF_X34_Y9_N9
\o[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a2~portadataout\,
	devoe => ww_devoe,
	o => ww_o(2));

-- Location: IOOBUF_X34_Y9_N23
\o[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => ww_o(1));

-- Location: IOOBUF_X34_Y4_N16
\o[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|data_rtl_0|auto_generated|ram_block1a0~portadataout\,
	devoe => ww_devoe,
	o => ww_o(0));

-- Location: IOIBUF_X0_Y11_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: PLL_1
\inst1|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 240,
	c0_initial => 1,
	c0_low => 240,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 20,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 50000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 24,
	m => 24,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 3267,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 260,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \inst1|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \inst1|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \inst1|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \inst1|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G3
\inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X13_Y12_N8
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~16_combout\ = !\inst|count\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|count\(0),
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~16_combout\);

-- Location: LCCOMB_X13_Y12_N6
\inst|Mod0|auto_generated|divider|divider|StageOut[90]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[90]~2_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((!\inst|count\(0)))) # (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ 
-- & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	datab => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~16_combout\,
	datac => \inst|count\(0),
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[90]~2_combout\);

-- Location: FF_X13_Y12_N7
\inst|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[90]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(0));

-- Location: LCCOMB_X13_Y12_N10
\inst|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~0_combout\ = (\inst|count\(1) & (\inst|count\(0) $ (VCC))) # (!\inst|count\(1) & (\inst|count\(0) & VCC))
-- \inst|Add0~1\ = CARRY((\inst|count\(1) & \inst|count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(1),
	datab => \inst|count\(0),
	datad => VCC,
	combout => \inst|Add0~0_combout\,
	cout => \inst|Add0~1\);

-- Location: FF_X13_Y12_N11
\inst|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(1));

-- Location: LCCOMB_X13_Y12_N12
\inst|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~2_combout\ = (\inst|count\(2) & (!\inst|Add0~1\)) # (!\inst|count\(2) & ((\inst|Add0~1\) # (GND)))
-- \inst|Add0~3\ = CARRY((!\inst|Add0~1\) # (!\inst|count\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(2),
	datad => VCC,
	cin => \inst|Add0~1\,
	combout => \inst|Add0~2_combout\,
	cout => \inst|Add0~3\);

-- Location: FF_X13_Y12_N13
\inst|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(2));

-- Location: LCCOMB_X13_Y12_N14
\inst|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~4_combout\ = (\inst|count\(3) & (\inst|Add0~3\ $ (GND))) # (!\inst|count\(3) & (!\inst|Add0~3\ & VCC))
-- \inst|Add0~5\ = CARRY((\inst|count\(3) & !\inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(3),
	datad => VCC,
	cin => \inst|Add0~3\,
	combout => \inst|Add0~4_combout\,
	cout => \inst|Add0~5\);

-- Location: LCCOMB_X10_Y11_N10
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~0_combout\ = \inst|Add0~4_combout\ $ (VCC)
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~1\ = CARRY(\inst|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~4_combout\,
	datad => VCC,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~0_combout\,
	cout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~1\);

-- Location: LCCOMB_X10_Y11_N2
\inst|Mod0|auto_generated|divider|divider|StageOut[93]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((\inst|Add0~4_combout\))) # 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~0_combout\,
	datac => \inst|Add0~4_combout\,
	datad => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\);

-- Location: FF_X10_Y11_N3
\inst|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(3));

-- Location: LCCOMB_X13_Y12_N16
\inst|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~6_combout\ = (\inst|count\(4) & (!\inst|Add0~5\)) # (!\inst|count\(4) & ((\inst|Add0~5\) # (GND)))
-- \inst|Add0~7\ = CARRY((!\inst|Add0~5\) # (!\inst|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(4),
	datad => VCC,
	cin => \inst|Add0~5\,
	combout => \inst|Add0~6_combout\,
	cout => \inst|Add0~7\);

-- Location: LCCOMB_X10_Y11_N12
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~2_combout\ = (\inst|Add0~6_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~1\ & VCC)) # (!\inst|Add0~6_combout\ & 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~1\))
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~3\ = CARRY((!\inst|Add0~6_combout\ & !\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~6_combout\,
	datad => VCC,
	cin => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~1\,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~2_combout\,
	cout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~3\);

-- Location: LCCOMB_X10_Y11_N8
\inst|Mod0|auto_generated|divider|divider|StageOut[94]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[94]~0_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((\inst|Add0~6_combout\))) # 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~2_combout\,
	datab => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	datad => \inst|Add0~6_combout\,
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[94]~0_combout\);

-- Location: FF_X10_Y11_N9
\inst|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[94]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(4));

-- Location: LCCOMB_X13_Y12_N18
\inst|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~8_combout\ = (\inst|count\(5) & (\inst|Add0~7\ $ (GND))) # (!\inst|count\(5) & (!\inst|Add0~7\ & VCC))
-- \inst|Add0~9\ = CARRY((\inst|count\(5) & !\inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(5),
	datad => VCC,
	cin => \inst|Add0~7\,
	combout => \inst|Add0~8_combout\,
	cout => \inst|Add0~9\);

-- Location: LCCOMB_X10_Y11_N14
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~4_combout\ = (\inst|Add0~8_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~3\ $ (GND))) # (!\inst|Add0~8_combout\ & 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~3\ & VCC))
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~5\ = CARRY((\inst|Add0~8_combout\ & !\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add0~8_combout\,
	datad => VCC,
	cin => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~3\,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~4_combout\,
	cout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~5\);

-- Location: LCCOMB_X10_Y11_N16
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~6_combout\ = (\inst|Add0~10_combout\ & (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~5\)) # (!\inst|Add0~10_combout\ & 
-- ((\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~5\) # (GND)))
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~7\ = CARRY((!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~5\) # (!\inst|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~10_combout\,
	datad => VCC,
	cin => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~5\,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~6_combout\,
	cout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~7\);

-- Location: LCCOMB_X10_Y11_N18
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~8_combout\ = (\inst|Add0~12_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~7\ $ (GND))) # (!\inst|Add0~12_combout\ & 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~7\ & VCC))
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~9\ = CARRY((\inst|Add0~12_combout\ & !\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add0~12_combout\,
	datad => VCC,
	cin => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~7\,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~8_combout\,
	cout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~9\);

-- Location: LCCOMB_X10_Y11_N20
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~10_combout\ = (\inst|Add0~14_combout\ & (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~9\)) # (!\inst|Add0~14_combout\ & 
-- ((\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~9\) # (GND)))
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~11\ = CARRY((!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~9\) # (!\inst|Add0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Add0~14_combout\,
	datad => VCC,
	cin => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~9\,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~10_combout\,
	cout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~11\);

-- Location: LCCOMB_X10_Y11_N22
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~12_combout\ = (\inst|Add0~16_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~11\ $ (GND))) # (!\inst|Add0~16_combout\ & 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~11\ & VCC))
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~13\ = CARRY((\inst|Add0~16_combout\ & !\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~16_combout\,
	datad => VCC,
	cin => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~11\,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~12_combout\,
	cout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~13\);

-- Location: LCCOMB_X10_Y11_N26
\inst|Mod0|auto_generated|divider|divider|StageOut[99]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((\inst|Add0~16_combout\))) # 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~12_combout\,
	datac => \inst|Add0~16_combout\,
	datad => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\);

-- Location: FF_X10_Y11_N27
\inst|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(9));

-- Location: LCCOMB_X13_Y12_N24
\inst|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~14_combout\ = (\inst|count\(8) & (!\inst|Add0~13\)) # (!\inst|count\(8) & ((\inst|Add0~13\) # (GND)))
-- \inst|Add0~15\ = CARRY((!\inst|Add0~13\) # (!\inst|count\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(8),
	datad => VCC,
	cin => \inst|Add0~13\,
	combout => \inst|Add0~14_combout\,
	cout => \inst|Add0~15\);

-- Location: LCCOMB_X13_Y12_N26
\inst|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~16_combout\ = \inst|Add0~15\ $ (!\inst|count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst|count\(9),
	cin => \inst|Add0~15\,
	combout => \inst|Add0~16_combout\);

-- Location: LCCOMB_X10_Y11_N24
\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ = !\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~13\,
	combout => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\);

-- Location: LCCOMB_X13_Y12_N0
\inst|Mod0|auto_generated|divider|divider|StageOut[95]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & (\inst|Add0~8_combout\)) # 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	datab => \inst|Add0~8_combout\,
	datad => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~4_combout\,
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\);

-- Location: FF_X13_Y12_N1
\inst|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(5));

-- Location: LCCOMB_X13_Y12_N20
\inst|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~10_combout\ = (\inst|count\(6) & (!\inst|Add0~9\)) # (!\inst|count\(6) & ((\inst|Add0~9\) # (GND)))
-- \inst|Add0~11\ = CARRY((!\inst|Add0~9\) # (!\inst|count\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(6),
	datad => VCC,
	cin => \inst|Add0~9\,
	combout => \inst|Add0~10_combout\,
	cout => \inst|Add0~11\);

-- Location: LCCOMB_X10_Y11_N4
\inst|Mod0|auto_generated|divider|divider|StageOut[96]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & (\inst|Add0~10_combout\)) # 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Add0~10_combout\,
	datab => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~6_combout\,
	datad => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\);

-- Location: FF_X10_Y11_N5
\inst|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(6));

-- Location: LCCOMB_X13_Y12_N22
\inst|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Add0~12_combout\ = (\inst|count\(7) & (\inst|Add0~11\ $ (GND))) # (!\inst|count\(7) & (!\inst|Add0~11\ & VCC))
-- \inst|Add0~13\ = CARRY((\inst|count\(7) & !\inst|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|count\(7),
	datad => VCC,
	cin => \inst|Add0~11\,
	combout => \inst|Add0~12_combout\,
	cout => \inst|Add0~13\);

-- Location: LCCOMB_X10_Y11_N30
\inst|Mod0|auto_generated|divider|divider|StageOut[97]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((\inst|Add0~12_combout\))) # 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~8_combout\,
	datac => \inst|Add0~12_combout\,
	datad => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\);

-- Location: FF_X10_Y11_N31
\inst|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(7));

-- Location: LCCOMB_X10_Y11_N0
\inst|Mod0|auto_generated|divider|divider|StageOut[98]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\ = (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & ((\inst|Add0~14_combout\))) # 
-- (!\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\ & (\inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~10_combout\,
	datac => \inst|Add0~14_combout\,
	datad => \inst|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~14_combout\,
	combout => \inst|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\);

-- Location: FF_X10_Y11_N1
\inst|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|count\(8));

-- Location: LCCOMB_X13_Y12_N28
\inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = (\inst|count\(2) & (!\inst|count\(4) & (!\inst|count\(3) & \inst|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(2),
	datab => \inst|count\(4),
	datac => \inst|count\(3),
	datad => \inst|count\(1),
	combout => \inst|Equal0~0_combout\);

-- Location: LCCOMB_X13_Y12_N4
\inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~1_combout\ = (\inst|count\(5) & (\inst|count\(7) & (\inst|count\(6) & \inst|count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(5),
	datab => \inst|count\(7),
	datac => \inst|count\(6),
	datad => \inst|count\(0),
	combout => \inst|Equal0~1_combout\);

-- Location: LCCOMB_X13_Y12_N2
\inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Equal0~2_combout\ = (\inst|count\(8) & (\inst|Equal0~0_combout\ & (\inst|Equal0~1_combout\ & \inst|count\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|count\(8),
	datab => \inst|Equal0~0_combout\,
	datac => \inst|Equal0~1_combout\,
	datad => \inst|count\(9),
	combout => \inst|Equal0~2_combout\);

-- Location: FF_X13_Y12_N3
\inst|cout\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \inst|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cout~q\);

-- Location: IOIBUF_X16_Y0_N1
\ch[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ch(0),
	o => \ch[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\ch[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ch(1),
	o => \ch[1]~input_o\);

-- Location: M9K_X15_Y13_N0
\inst|data_rtl_0|auto_generated|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000015555555555556AAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555540000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000155555555555555555555555555555555555555555555555555555555555555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555555555555555555555555555555555555555555555555555555555400000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0000000000005555555555555555555555555555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000155555555555555555555555555555555555555555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/rom_test.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst|altsyncram:data_rtl_0|altsyncram_o671:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \inst|data_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M9K_X15_Y7_N0
\inst|data_rtl_0|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000000000001556AABFFC000555AAAFFFC001556AABFFF000555AAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA955555555555555555555555555540000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA955555555555555555555555555540000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA555555555555555555555555555540000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555555555555555555555554000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000001555555555555555AAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFC0000000000000005555555555555555AAAAAAAAAAAAAAABFFFFFFFFFFFFFFF00000000000000005555555555555556AAAAAAAAAAAAAAABFFFFFFFFFFFFFFF00000000000000015555555555555556AAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAA95555555555555554000000000000000FFFFFFFFFFFFFFFEAAAAAAAAAAAAAAA95555555555555550000000000000000FFFFFFFFFFFFFFFEAAAAAAAAAAAAAAA55555555555555550000000000000003FFFFFFFFFFFFFFFAAAAAAAAAAAAAAAA5555555555555554000000000000000",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000FFFFFFFFFEAAAAAAAAA9555555555500000000000FFFFFFFFFFFFAAAAAAAAAAAAAA55555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000155555555555555556AAAAAAAAAAAAABFFFFFFFFFFFC000000000015555555555AAAAAAAAAAFFFFFFFFFF00000000005555555555AAAAAAAAAABFFFFFFFFFFF00000000000055555555555556AAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAA55555555555554000000000003FFFFFFFFFFFAAAAAAAAAA955555555540000000003",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/rom_test.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst|altsyncram:data_rtl_0|altsyncram_o671:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \inst|data_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: M9K_X27_Y7_N0
\inst|data_rtl_0|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000006BC5BC5AC1AC16F16F06B06BC5BC5BC1AC1AF16F16B06B05BFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA555555540000003FFFFFFEAAAAAA955555540000003FFFFFFEAAAAAA955555540000000FFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA555555500000003FFFFFFEAAAAAA955555540000003FFFFFFEAAAAAA955555540000000FFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA55555550000000FFFFFFFEAAAAAA955555540000003FFFFFFEAAAAAA955555540000003FFFFFFEAAAAAAA55555550000000FFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA955555540000003FFFFFFEAAAAAA95555554000000",
	mem_init2 => X"00000000000000015556AAABFFFC00015556AAAFFFF00005555AAAAFFFF00015556AAABFFFC00015556AAABFFF00005555AAAAFFFF00005556AAABFFFC00015556AAABFFF00005555AAAAFFFF00005555AAABFFFC00015556AAABFFFC0005555AAAAFFFF00005555AAAAFFFC00015556AAABFFFC0001555AAAAFFFF00005555AAAAFFFFFFAAAA55550000FFFFAAAA55540003FFFEAAA955540003FFFAAAA55550000FFFFAAAA55550003FFFEAAA955540003FFFEAAA55550000FFFFAAAA55550000FFFEAAA955540003FFFEAAA95550000FFFFAAAA55550000FFFEAAA955540003FFFEAAA95554000FFFFAAAA55550000FFFFAAA955540003FFFEAAA95554000",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000FFAA955003FFAA955003FFAA955400FFEAA955000FFFAAA555000FFFEAA95550000FFFEAAA9555500000FFFFFEAAAAA95555555400000000000000000000000000000000000000000055555555AAAAAAFFFFFC000015555AAAAFFFC0001555AAAFFFC001556AABFFC00155AAAFFC00555AABFF00155AABFF00155AABFF00155AABFF00155AABFF000556AAFFC00155AAAFFF001556AABFFF0005556AAAFFFC00015555AAAAFFFFF0000005555556AAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAA5555554000003FFFFEAAA955550000FFFEAAA5554003FFFAAA555003FFEAA955000FFEAA554003FFAA955003FFAA955003",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/rom_test.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst|altsyncram:data_rtl_0|altsyncram_o671:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \inst|data_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: M9K_X27_Y10_N0
\inst|data_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"000000000000349E34D278E349E78D279E349E78D249E34D278D349E34D278EA9500FEA9500FFA9540FFA9540FFA9540FFA9540FFA95403FAA5403FAA5403FAA5403FAA5503FEA5503FEA5503FEA5503FEA5503FEA9500FEA9500FEA9500FEA9500FEA9540FFA9540FFA9540FFA9540FFAA5403FAA5403FAA5403FAA5403FAA5403FEA5503FEA5503FEA5503FEA5500FEA9500FEA9500FEA9500FEA9500FEA9540FFA9540FFA9540FFA9540FFAA5403FAA5403FAA5403FAA5403FAA5503FEA5503FEA5503FEA5503FEA5503FEA9500FEA9500FEA9500FEA9500FFA9540FFA9540FFA9540FFA9540FFA95403FAA5403FAA5403FAA5403FAA5503FEA5503FEA550",
	mem_init2 => X"00000000000016BC16BC16BC16BC16BC16BC16F05AF05AF05AF05AF05AF05AC16BC16BC16BC16BC16BC16BC5AF05AF05AF05AF05AF05AF05BC16BC16BC16BC16BC16BC16B05AF05AF05AF05AF05AF05AF06BC16BC16BC16BC16BC16BC16F05AF05AF05AF05AF05AF05AF16BC16BC16BC16BC16BC16BC1AF05AF05AF05AF05AF05AF05AA50FA50FA50FA50FA50FA50FA43E943E943E943E943E943E94FA50FA50FA50FA50FA50FA50F943E943E943E943E943E943E90FA50FA50FA50FA50FA50FA50E943E943E943E943E943E943E50FA50FA50FA50FA50FA50FA53E943E943E943E943E943E943A50FA50FA50FA50FA50FA50F943E943E943E943E943E943E94",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000094E5394E5394E5394E93A4F93E4394E93E53A4F94F90E90E90E94F943A53E90FA50E943E943FA50FA940FA9503FA9503FEA95403FFAAA55540000000000000000000000005556AABFF0055AAFF015ABF015ABC05ABC16BF05AF05AC16BC1AF16B05BC5AC1AC1AC1BC5BC6B16F1AC5B06F1BC6B1AC5B16C5B16C5B16C5B16C5B16C5B16C5B16C1B06F1BC6B16C1BC5B06F16F1AC1AC1AC16F16B05BC1AF05AC16BC16BF05AF016AF015ABF015ABFC0156ABFF0005556AAAABFFFFFFFFFFFFFFAAAAA5554003FFAA5500FFA9503FA9503EA503E943FA50FA50E943E90F943A53E50E90E90E93E53E4394F90E53A4F93E4390E5394E5394E5394E53",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/rom_test.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst|altsyncram:data_rtl_0|altsyncram_o671:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \inst1|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \inst|data_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);
END structure;


