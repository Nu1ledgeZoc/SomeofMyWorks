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

-- DATE "07/09/2021 09:17:52"

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

ENTITY 	SHUDIAN_PLUS IS
    PORT (
	data : OUT std_logic_vector(7 DOWNTO 0);
	SYS_CLK : IN std_logic;
	sel_f : OUT std_logic_vector(3 DOWNTO 0);
	btn_f : IN std_logic;
	sel_mode : OUT std_logic_vector(1 DOWNTO 0);
	btn_mode : IN std_logic;
	sel_led : OUT std_logic_vector(3 DOWNTO 0);
	V_cmp_sig : IN std_logic
	);
END SHUDIAN_PLUS;

-- Design Ports Information
-- data[7]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_f[3]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_f[2]	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_f[1]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_f[0]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_mode[1]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_mode[0]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_led[3]	=>  Location: PIN_144,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_led[2]	=>  Location: PIN_142,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_led[1]	=>  Location: PIN_138,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel_led[0]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_f	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- btn_mode	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V_cmp_sig	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SYS_CLK	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SHUDIAN_PLUS IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SYS_CLK : std_logic;
SIGNAL ww_sel_f : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_btn_f : std_logic;
SIGNAL ww_sel_mode : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_btn_mode : std_logic;
SIGNAL ww_sel_led : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_V_cmp_sig : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst7|opt~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SYS_CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data[7]~output_o\ : std_logic;
SIGNAL \data[6]~output_o\ : std_logic;
SIGNAL \data[5]~output_o\ : std_logic;
SIGNAL \data[4]~output_o\ : std_logic;
SIGNAL \data[3]~output_o\ : std_logic;
SIGNAL \data[2]~output_o\ : std_logic;
SIGNAL \data[1]~output_o\ : std_logic;
SIGNAL \data[0]~output_o\ : std_logic;
SIGNAL \sel_f[3]~output_o\ : std_logic;
SIGNAL \sel_f[2]~output_o\ : std_logic;
SIGNAL \sel_f[1]~output_o\ : std_logic;
SIGNAL \sel_f[0]~output_o\ : std_logic;
SIGNAL \sel_mode[1]~output_o\ : std_logic;
SIGNAL \sel_mode[0]~output_o\ : std_logic;
SIGNAL \sel_led[3]~output_o\ : std_logic;
SIGNAL \sel_led[2]~output_o\ : std_logic;
SIGNAL \sel_led[1]~output_o\ : std_logic;
SIGNAL \sel_led[0]~output_o\ : std_logic;
SIGNAL \SYS_CLK~input_o\ : std_logic;
SIGNAL \SYS_CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \btn_f~input_o\ : std_logic;
SIGNAL \inst6|q[0]~3_combout\ : std_logic;
SIGNAL \inst6|q[2]~1_combout\ : std_logic;
SIGNAL \inst6|q~0_combout\ : std_logic;
SIGNAL \inst6|q~2_combout\ : std_logic;
SIGNAL \inst6|Equal0~0_combout\ : std_logic;
SIGNAL \inst7|count[0]~9_combout\ : std_logic;
SIGNAL \inst7|Decoder0~2_combout\ : std_logic;
SIGNAL \inst7|Decoder0~3_combout\ : std_logic;
SIGNAL \inst7|Decoder1~0_combout\ : std_logic;
SIGNAL \inst7|Decoder0~4_combout\ : std_logic;
SIGNAL \inst7|Decoder2~0_combout\ : std_logic;
SIGNAL \inst7|WideOr0~0_combout\ : std_logic;
SIGNAL \inst7|Add0~1_cout\ : std_logic;
SIGNAL \inst7|Add0~3\ : std_logic;
SIGNAL \inst7|Add0~5\ : std_logic;
SIGNAL \inst7|Add0~7\ : std_logic;
SIGNAL \inst7|Add0~9\ : std_logic;
SIGNAL \inst7|Add0~10_combout\ : std_logic;
SIGNAL \inst7|Add0~8_combout\ : std_logic;
SIGNAL \inst7|Equal0~1_combout\ : std_logic;
SIGNAL \inst7|Add0~2_combout\ : std_logic;
SIGNAL \inst7|Equal0~0_combout\ : std_logic;
SIGNAL \inst7|Decoder0~0_combout\ : std_logic;
SIGNAL \inst7|Decoder0~1_combout\ : std_logic;
SIGNAL \inst7|Add0~11\ : std_logic;
SIGNAL \inst7|Add0~13\ : std_logic;
SIGNAL \inst7|Add0~15\ : std_logic;
SIGNAL \inst7|Add0~16_combout\ : std_logic;
SIGNAL \inst7|Add0~12_combout\ : std_logic;
SIGNAL \inst7|Add0~17\ : std_logic;
SIGNAL \inst7|Add0~18_combout\ : std_logic;
SIGNAL \inst7|Equal0~4_combout\ : std_logic;
SIGNAL \inst7|Add0~4_combout\ : std_logic;
SIGNAL \inst7|Add0~6_combout\ : std_logic;
SIGNAL \inst7|Add0~14_combout\ : std_logic;
SIGNAL \inst7|Equal0~2_combout\ : std_logic;
SIGNAL \inst7|Equal0~3_combout\ : std_logic;
SIGNAL \inst7|Equal0~5_combout\ : std_logic;
SIGNAL \inst7|count[0]~10\ : std_logic;
SIGNAL \inst7|count[1]~11_combout\ : std_logic;
SIGNAL \inst7|count[1]~12\ : std_logic;
SIGNAL \inst7|count[2]~13_combout\ : std_logic;
SIGNAL \inst7|count[2]~14\ : std_logic;
SIGNAL \inst7|count[3]~15_combout\ : std_logic;
SIGNAL \inst7|count[3]~16\ : std_logic;
SIGNAL \inst7|count[4]~17_combout\ : std_logic;
SIGNAL \inst7|count[4]~18\ : std_logic;
SIGNAL \inst7|count[5]~19_combout\ : std_logic;
SIGNAL \inst7|count[5]~20\ : std_logic;
SIGNAL \inst7|count[6]~21_combout\ : std_logic;
SIGNAL \inst7|count[6]~22\ : std_logic;
SIGNAL \inst7|count[7]~23_combout\ : std_logic;
SIGNAL \inst7|count[7]~24\ : std_logic;
SIGNAL \inst7|count[8]~25_combout\ : std_logic;
SIGNAL \inst7|LessThan1~1_cout\ : std_logic;
SIGNAL \inst7|LessThan1~3_cout\ : std_logic;
SIGNAL \inst7|LessThan1~5_cout\ : std_logic;
SIGNAL \inst7|LessThan1~7_cout\ : std_logic;
SIGNAL \inst7|LessThan1~9_cout\ : std_logic;
SIGNAL \inst7|LessThan1~11_cout\ : std_logic;
SIGNAL \inst7|LessThan1~13_cout\ : std_logic;
SIGNAL \inst7|LessThan1~15_cout\ : std_logic;
SIGNAL \inst7|LessThan1~16_combout\ : std_logic;
SIGNAL \inst7|opt~q\ : std_logic;
SIGNAL \inst7|opt~clkctrl_outclk\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\ : std_logic;
SIGNAL \inst8|Add0~0_combout\ : std_logic;
SIGNAL \inst8|Add0~1\ : std_logic;
SIGNAL \inst8|Add0~2_combout\ : std_logic;
SIGNAL \inst8|Add0~3\ : std_logic;
SIGNAL \inst8|Add0~4_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[94]~2_combout\ : std_logic;
SIGNAL \inst8|Add0~5\ : std_logic;
SIGNAL \inst8|Add0~6_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~5\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\ : std_logic;
SIGNAL \inst8|Add0~7\ : std_logic;
SIGNAL \inst8|Add0~8_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\ : std_logic;
SIGNAL \inst8|Add0~9\ : std_logic;
SIGNAL \inst8|Add0~10_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\ : std_logic;
SIGNAL \inst8|Add0~11\ : std_logic;
SIGNAL \inst8|Add0~12_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~11\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\ : std_logic;
SIGNAL \inst8|Add0~13\ : std_logic;
SIGNAL \inst8|Add0~14_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\ : std_logic;
SIGNAL \inst8|Add0~15\ : std_logic;
SIGNAL \inst8|Add0~16_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~15\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ : std_logic;
SIGNAL \inst8|Mod0|auto_generated|divider|divider|StageOut[90]~0_combout\ : std_logic;
SIGNAL \btn_mode~input_o\ : std_logic;
SIGNAL \inst3|otp[0]~1_combout\ : std_logic;
SIGNAL \inst3|otp[1]~0_combout\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \inst8|data_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \V_cmp_sig~input_o\ : std_logic;
SIGNAL \inst|i[0]~32_combout\ : std_logic;
SIGNAL \inst8|Equal0~0_combout\ : std_logic;
SIGNAL \inst8|Equal0~1_combout\ : std_logic;
SIGNAL \inst8|Equal0~2_combout\ : std_logic;
SIGNAL \inst8|cout~q\ : std_logic;
SIGNAL \inst|i[0]~33\ : std_logic;
SIGNAL \inst|i[1]~34_combout\ : std_logic;
SIGNAL \inst|i[1]~35\ : std_logic;
SIGNAL \inst|i[2]~36_combout\ : std_logic;
SIGNAL \inst|i[2]~37\ : std_logic;
SIGNAL \inst|i[3]~38_combout\ : std_logic;
SIGNAL \inst|i[3]~39\ : std_logic;
SIGNAL \inst|i[4]~40_combout\ : std_logic;
SIGNAL \inst|i[4]~41\ : std_logic;
SIGNAL \inst|i[5]~42_combout\ : std_logic;
SIGNAL \inst|i[5]~43\ : std_logic;
SIGNAL \inst|i[6]~44_combout\ : std_logic;
SIGNAL \inst|i[6]~45\ : std_logic;
SIGNAL \inst|i[7]~46_combout\ : std_logic;
SIGNAL \inst|i[7]~47\ : std_logic;
SIGNAL \inst|i[8]~48_combout\ : std_logic;
SIGNAL \inst|i[8]~49\ : std_logic;
SIGNAL \inst|i[9]~50_combout\ : std_logic;
SIGNAL \inst|i[9]~51\ : std_logic;
SIGNAL \inst|i[10]~52_combout\ : std_logic;
SIGNAL \inst|i[10]~53\ : std_logic;
SIGNAL \inst|i[11]~54_combout\ : std_logic;
SIGNAL \inst|i[11]~55\ : std_logic;
SIGNAL \inst|i[12]~56_combout\ : std_logic;
SIGNAL \inst|i[12]~57\ : std_logic;
SIGNAL \inst|i[13]~58_combout\ : std_logic;
SIGNAL \inst|i[13]~59\ : std_logic;
SIGNAL \inst|i[14]~60_combout\ : std_logic;
SIGNAL \inst|i[14]~61\ : std_logic;
SIGNAL \inst|i[15]~62_combout\ : std_logic;
SIGNAL \inst|i[15]~63\ : std_logic;
SIGNAL \inst|i[16]~64_combout\ : std_logic;
SIGNAL \inst|i[16]~65\ : std_logic;
SIGNAL \inst|i[17]~66_combout\ : std_logic;
SIGNAL \inst|i[17]~67\ : std_logic;
SIGNAL \inst|i[18]~68_combout\ : std_logic;
SIGNAL \inst|i[18]~69\ : std_logic;
SIGNAL \inst|i[19]~70_combout\ : std_logic;
SIGNAL \inst|i[19]~71\ : std_logic;
SIGNAL \inst|i[20]~72_combout\ : std_logic;
SIGNAL \inst|i[20]~73\ : std_logic;
SIGNAL \inst|i[21]~74_combout\ : std_logic;
SIGNAL \inst|i[21]~75\ : std_logic;
SIGNAL \inst|i[22]~76_combout\ : std_logic;
SIGNAL \inst|i[22]~77\ : std_logic;
SIGNAL \inst|i[23]~78_combout\ : std_logic;
SIGNAL \inst|i[23]~79\ : std_logic;
SIGNAL \inst|i[24]~80_combout\ : std_logic;
SIGNAL \inst|i[24]~81\ : std_logic;
SIGNAL \inst|i[25]~82_combout\ : std_logic;
SIGNAL \inst|i[25]~83\ : std_logic;
SIGNAL \inst|i[26]~84_combout\ : std_logic;
SIGNAL \inst|i[26]~85\ : std_logic;
SIGNAL \inst|i[27]~86_combout\ : std_logic;
SIGNAL \inst|i[27]~87\ : std_logic;
SIGNAL \inst|i[28]~88_combout\ : std_logic;
SIGNAL \inst|i[28]~89\ : std_logic;
SIGNAL \inst|i[29]~90_combout\ : std_logic;
SIGNAL \inst|LessThan5~0_combout\ : std_logic;
SIGNAL \inst|i[29]~91\ : std_logic;
SIGNAL \inst|i[30]~92_combout\ : std_logic;
SIGNAL \inst|i[30]~93\ : std_logic;
SIGNAL \inst|i[31]~94_combout\ : std_logic;
SIGNAL \inst|sel_sig[3]~1_combout\ : std_logic;
SIGNAL \inst|LessThan3~1_combout\ : std_logic;
SIGNAL \inst|LessThan3~0_combout\ : std_logic;
SIGNAL \inst|LessThan3~3_combout\ : std_logic;
SIGNAL \inst|LessThan3~2_combout\ : std_logic;
SIGNAL \inst|LessThan3~4_combout\ : std_logic;
SIGNAL \inst|sel_sig[3]~2_combout\ : std_logic;
SIGNAL \inst|sel_sig[3]~3_combout\ : std_logic;
SIGNAL \inst|sel_sig[3]~4_combout\ : std_logic;
SIGNAL \inst|always1~4_combout\ : std_logic;
SIGNAL \inst|LessThan5~1_combout\ : std_logic;
SIGNAL \inst|LessThan1~0_combout\ : std_logic;
SIGNAL \inst|always1~0_combout\ : std_logic;
SIGNAL \inst|LessThan2~0_combout\ : std_logic;
SIGNAL \inst|always1~1_combout\ : std_logic;
SIGNAL \inst|always1~2_combout\ : std_logic;
SIGNAL \inst|always1~3_combout\ : std_logic;
SIGNAL \inst|LessThan6~0_combout\ : std_logic;
SIGNAL \inst|LessThan0~0_combout\ : std_logic;
SIGNAL \inst|LessThan0~1_combout\ : std_logic;
SIGNAL \inst|sel_sig~0_combout\ : std_logic;
SIGNAL \inst|sel_sig~5_combout\ : std_logic;
SIGNAL \inst|LessThan5~2_combout\ : std_logic;
SIGNAL \inst|LessThan5~3_combout\ : std_logic;
SIGNAL \inst|LessThan5~4_combout\ : std_logic;
SIGNAL \inst|LessThan6~1_combout\ : std_logic;
SIGNAL \inst|LessThan6~2_combout\ : std_logic;
SIGNAL \inst|LessThan3~5_combout\ : std_logic;
SIGNAL \inst|sel_sig[3]~6_combout\ : std_logic;
SIGNAL \inst|sel_sig[3]~10_combout\ : std_logic;
SIGNAL \inst|sel_sig[3]~11_combout\ : std_logic;
SIGNAL \inst|sel_sig~7_combout\ : std_logic;
SIGNAL \inst|sel_sig~8_combout\ : std_logic;
SIGNAL \inst|sel_sig~9_combout\ : std_logic;
SIGNAL \inst|sel_sig\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst3|otp\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst7|count\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst|i\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst8|count\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst6|q\ : std_logic_vector(3 DOWNTO 0);

BEGIN

data <= ww_data;
ww_SYS_CLK <= SYS_CLK;
sel_f <= ww_sel_f;
ww_btn_f <= btn_f;
sel_mode <= ww_sel_mode;
ww_btn_mode <= btn_mode;
sel_led <= ww_sel_led;
ww_V_cmp_sig <= V_cmp_sig;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst8|data_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\inst3|otp\(1) & \inst3|otp\(0) & \inst8|count\(9) & \inst8|count\(8) & \inst8|count\(7) & \inst8|count\(6) & \inst8|count\(5) & \inst8|count\(4) & \inst8|count\(3) & 
\inst8|count\(2) & \inst8|count\(1) & \inst8|count\(0));

\inst8|data_rtl_0|auto_generated|ram_block1a6~portadataout\ <= \inst8|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);
\inst8|data_rtl_0|auto_generated|ram_block1a7\ <= \inst8|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\(1);

\inst8|data_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\inst3|otp\(1) & \inst3|otp\(0) & \inst8|count\(9) & \inst8|count\(8) & \inst8|count\(7) & \inst8|count\(6) & \inst8|count\(5) & \inst8|count\(4) & \inst8|count\(3) & 
\inst8|count\(2) & \inst8|count\(1) & \inst8|count\(0));

\inst8|data_rtl_0|auto_generated|ram_block1a4~portadataout\ <= \inst8|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\inst8|data_rtl_0|auto_generated|ram_block1a5\ <= \inst8|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);

\inst8|data_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\inst3|otp\(1) & \inst3|otp\(0) & \inst8|count\(9) & \inst8|count\(8) & \inst8|count\(7) & \inst8|count\(6) & \inst8|count\(5) & \inst8|count\(4) & \inst8|count\(3) & 
\inst8|count\(2) & \inst8|count\(1) & \inst8|count\(0));

\inst8|data_rtl_0|auto_generated|ram_block1a2~portadataout\ <= \inst8|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);
\inst8|data_rtl_0|auto_generated|ram_block1a3\ <= \inst8|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\(1);

\inst8|data_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst3|otp\(1) & \inst3|otp\(0) & \inst8|count\(9) & \inst8|count\(8) & \inst8|count\(7) & \inst8|count\(6) & \inst8|count\(5) & \inst8|count\(4) & \inst8|count\(3) & 
\inst8|count\(2) & \inst8|count\(1) & \inst8|count\(0));

\inst8|data_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \inst8|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\inst8|data_rtl_0|auto_generated|ram_block1a1\ <= \inst8|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);

\inst7|opt~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst7|opt~q\);

\SYS_CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \SYS_CLK~input_o\);

-- Location: IOOBUF_X23_Y0_N9
\data[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => \data[7]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\data[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a6~portadataout\,
	devoe => ww_devoe,
	o => \data[6]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\data[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => \data[5]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\data[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a4~portadataout\,
	devoe => ww_devoe,
	o => \data[4]~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => \data[3]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a2~portadataout\,
	devoe => ww_devoe,
	o => \data[2]~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => \data[1]~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|data_rtl_0|auto_generated|ram_block1a0~portadataout\,
	devoe => ww_devoe,
	o => \data[0]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\sel_f[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|q\(3),
	devoe => ww_devoe,
	o => \sel_f[3]~output_o\);

-- Location: IOOBUF_X16_Y24_N2
\sel_f[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|q\(2),
	devoe => ww_devoe,
	o => \sel_f[2]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\sel_f[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|q\(1),
	devoe => ww_devoe,
	o => \sel_f[1]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\sel_f[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|q\(0),
	devoe => ww_devoe,
	o => \sel_f[0]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\sel_mode[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|otp\(1),
	devoe => ww_devoe,
	o => \sel_mode[1]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\sel_mode[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|otp\(0),
	devoe => ww_devoe,
	o => \sel_mode[0]~output_o\);

-- Location: IOOBUF_X1_Y24_N9
\sel_led[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sel_sig\(3),
	devoe => ww_devoe,
	o => \sel_led[3]~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\sel_led[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sel_sig\(2),
	devoe => ww_devoe,
	o => \sel_led[2]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\sel_led[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sel_sig\(1),
	devoe => ww_devoe,
	o => \sel_led[1]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\sel_led[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sel_sig\(0),
	devoe => ww_devoe,
	o => \sel_led[0]~output_o\);

-- Location: IOIBUF_X0_Y11_N15
\SYS_CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SYS_CLK,
	o => \SYS_CLK~input_o\);

-- Location: CLKCTRL_G4
\SYS_CLK~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \SYS_CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \SYS_CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y6_N22
\btn_f~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_f,
	o => \btn_f~input_o\);

-- Location: LCCOMB_X29_Y20_N2
\inst6|q[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst6|q[0]~3_combout\ = !\inst6|q\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst6|q\(0),
	combout => \inst6|q[0]~3_combout\);

-- Location: FF_X29_Y20_N3
\inst6|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \btn_f~input_o\,
	d => \inst6|q[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|q\(0));

-- Location: LCCOMB_X29_Y20_N30
\inst6|q[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst6|q[2]~1_combout\ = \inst6|q\(2) $ (((\inst6|q\(1) & \inst6|q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst6|q\(1),
	datac => \inst6|q\(2),
	datad => \inst6|q\(0),
	combout => \inst6|q[2]~1_combout\);

-- Location: FF_X29_Y20_N31
\inst6|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \btn_f~input_o\,
	d => \inst6|q[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|q\(2));

-- Location: LCCOMB_X29_Y20_N0
\inst6|q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst6|q~0_combout\ = (\inst6|q\(2) & (\inst6|q\(3) $ (((\inst6|q\(1) & \inst6|q\(0)))))) # (!\inst6|q\(2) & (\inst6|q\(3) & ((\inst6|q\(1)) # (!\inst6|q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(2),
	datab => \inst6|q\(1),
	datac => \inst6|q\(3),
	datad => \inst6|q\(0),
	combout => \inst6|q~0_combout\);

-- Location: FF_X29_Y20_N1
\inst6|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \btn_f~input_o\,
	d => \inst6|q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|q\(3));

-- Location: LCCOMB_X29_Y20_N4
\inst6|q~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst6|q~2_combout\ = (\inst6|q\(1) & (((!\inst6|q\(0))))) # (!\inst6|q\(1) & (\inst6|q\(0) & ((\inst6|q\(2)) # (!\inst6|q\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(2),
	datab => \inst6|q\(3),
	datac => \inst6|q\(1),
	datad => \inst6|q\(0),
	combout => \inst6|q~2_combout\);

-- Location: FF_X29_Y20_N5
\inst6|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \btn_f~input_o\,
	d => \inst6|q~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|q\(1));

-- Location: LCCOMB_X28_Y20_N24
\inst6|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst6|Equal0~0_combout\ = (!\inst6|q\(1) & (\inst6|q\(3) & (!\inst6|q\(2) & \inst6|q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(1),
	datab => \inst6|q\(3),
	datac => \inst6|q\(2),
	datad => \inst6|q\(0),
	combout => \inst6|Equal0~0_combout\);

-- Location: LCCOMB_X30_Y20_N12
\inst7|count[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[0]~9_combout\ = \inst7|count\(0) $ (VCC)
-- \inst7|count[0]~10\ = CARRY(\inst7|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(0),
	datad => VCC,
	combout => \inst7|count[0]~9_combout\,
	cout => \inst7|count[0]~10\);

-- Location: LCCOMB_X28_Y20_N4
\inst7|Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Decoder0~2_combout\ = (!\inst6|q\(0) & (!\inst6|q\(3) & (\inst6|q\(2) & \inst6|q\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(0),
	datab => \inst6|q\(3),
	datac => \inst6|q\(2),
	datad => \inst6|q\(1),
	combout => \inst7|Decoder0~2_combout\);

-- Location: LCCOMB_X28_Y20_N14
\inst7|Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Decoder0~3_combout\ = (\inst6|q\(0) & (!\inst6|q\(3) & (\inst6|q\(2) & !\inst6|q\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(0),
	datab => \inst6|q\(3),
	datac => \inst6|q\(2),
	datad => \inst6|q\(1),
	combout => \inst7|Decoder0~3_combout\);

-- Location: LCCOMB_X28_Y20_N12
\inst7|Decoder1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Decoder1~0_combout\ = (!\inst6|q\(1) & (!\inst6|q\(3) & !\inst6|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(1),
	datac => \inst6|q\(3),
	datad => \inst6|q\(0),
	combout => \inst7|Decoder1~0_combout\);

-- Location: LCCOMB_X28_Y20_N6
\inst7|Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Decoder0~4_combout\ = (\inst6|q\(1) & (!\inst6|q\(3) & (!\inst6|q\(2) & \inst6|q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(1),
	datab => \inst6|q\(3),
	datac => \inst6|q\(2),
	datad => \inst6|q\(0),
	combout => \inst7|Decoder0~4_combout\);

-- Location: LCCOMB_X28_Y20_N16
\inst7|Decoder2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Decoder2~0_combout\ = (!\inst6|q\(2) & (!\inst6|q\(3) & !\inst6|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(2),
	datac => \inst6|q\(3),
	datad => \inst6|q\(0),
	combout => \inst7|Decoder2~0_combout\);

-- Location: LCCOMB_X29_Y20_N26
\inst7|WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|WideOr0~0_combout\ = (\inst6|q\(2) & (\inst6|q\(3))) # (!\inst6|q\(2) & ((\inst6|q\(3) & ((\inst6|q\(1)))) # (!\inst6|q\(3) & (\inst6|q\(0) & !\inst6|q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(2),
	datab => \inst6|q\(3),
	datac => \inst6|q\(0),
	datad => \inst6|q\(1),
	combout => \inst7|WideOr0~0_combout\);

-- Location: LCCOMB_X29_Y20_N6
\inst7|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~1_cout\ = CARRY(\inst7|WideOr0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|WideOr0~0_combout\,
	datad => VCC,
	cout => \inst7|Add0~1_cout\);

-- Location: LCCOMB_X29_Y20_N8
\inst7|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~2_combout\ = (\inst7|Decoder2~0_combout\ & (\inst7|Add0~1_cout\ & VCC)) # (!\inst7|Decoder2~0_combout\ & (!\inst7|Add0~1_cout\))
-- \inst7|Add0~3\ = CARRY((!\inst7|Decoder2~0_combout\ & !\inst7|Add0~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder2~0_combout\,
	datad => VCC,
	cin => \inst7|Add0~1_cout\,
	combout => \inst7|Add0~2_combout\,
	cout => \inst7|Add0~3\);

-- Location: LCCOMB_X29_Y20_N10
\inst7|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~4_combout\ = (\inst7|Decoder0~4_combout\ & ((GND) # (!\inst7|Add0~3\))) # (!\inst7|Decoder0~4_combout\ & (\inst7|Add0~3\ $ (GND)))
-- \inst7|Add0~5\ = CARRY((\inst7|Decoder0~4_combout\) # (!\inst7|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|Decoder0~4_combout\,
	datad => VCC,
	cin => \inst7|Add0~3\,
	combout => \inst7|Add0~4_combout\,
	cout => \inst7|Add0~5\);

-- Location: LCCOMB_X29_Y20_N12
\inst7|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~6_combout\ = (\inst7|Decoder1~0_combout\ & (\inst7|Add0~5\ & VCC)) # (!\inst7|Decoder1~0_combout\ & (!\inst7|Add0~5\))
-- \inst7|Add0~7\ = CARRY((!\inst7|Decoder1~0_combout\ & !\inst7|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder1~0_combout\,
	datad => VCC,
	cin => \inst7|Add0~5\,
	combout => \inst7|Add0~6_combout\,
	cout => \inst7|Add0~7\);

-- Location: LCCOMB_X29_Y20_N14
\inst7|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~8_combout\ = (\inst7|Decoder0~3_combout\ & ((GND) # (!\inst7|Add0~7\))) # (!\inst7|Decoder0~3_combout\ & (\inst7|Add0~7\ $ (GND)))
-- \inst7|Add0~9\ = CARRY((\inst7|Decoder0~3_combout\) # (!\inst7|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder0~3_combout\,
	datad => VCC,
	cin => \inst7|Add0~7\,
	combout => \inst7|Add0~8_combout\,
	cout => \inst7|Add0~9\);

-- Location: LCCOMB_X29_Y20_N16
\inst7|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~10_combout\ = (\inst7|Decoder0~2_combout\ & (\inst7|Add0~9\ & VCC)) # (!\inst7|Decoder0~2_combout\ & (!\inst7|Add0~9\))
-- \inst7|Add0~11\ = CARRY((!\inst7|Decoder0~2_combout\ & !\inst7|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|Decoder0~2_combout\,
	datad => VCC,
	cin => \inst7|Add0~9\,
	combout => \inst7|Add0~10_combout\,
	cout => \inst7|Add0~11\);

-- Location: LCCOMB_X30_Y20_N30
\inst7|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~1_combout\ = (\inst7|count\(5) & (\inst7|Add0~8_combout\ & (\inst7|count\(6) $ (!\inst7|Add0~10_combout\)))) # (!\inst7|count\(5) & (!\inst7|Add0~8_combout\ & (\inst7|count\(6) $ (!\inst7|Add0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(5),
	datab => \inst7|count\(6),
	datac => \inst7|Add0~10_combout\,
	datad => \inst7|Add0~8_combout\,
	combout => \inst7|Equal0~1_combout\);

-- Location: LCCOMB_X30_Y20_N8
\inst7|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~0_combout\ = (\inst7|WideOr0~0_combout\ & (!\inst7|count\(1) & (\inst7|count\(2) $ (!\inst7|Add0~2_combout\)))) # (!\inst7|WideOr0~0_combout\ & (\inst7|count\(1) & (\inst7|count\(2) $ (!\inst7|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|WideOr0~0_combout\,
	datab => \inst7|count\(2),
	datac => \inst7|count\(1),
	datad => \inst7|Add0~2_combout\,
	combout => \inst7|Equal0~0_combout\);

-- Location: LCCOMB_X28_Y20_N10
\inst7|Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Decoder0~0_combout\ = (!\inst6|q\(1) & (\inst6|q\(3) & (!\inst6|q\(2) & !\inst6|q\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(1),
	datab => \inst6|q\(3),
	datac => \inst6|q\(2),
	datad => \inst6|q\(0),
	combout => \inst7|Decoder0~0_combout\);

-- Location: LCCOMB_X29_Y20_N28
\inst7|Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Decoder0~1_combout\ = (\inst6|q\(2) & (\inst6|q\(1) & (\inst6|q\(0) & !\inst6|q\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|q\(2),
	datab => \inst6|q\(1),
	datac => \inst6|q\(0),
	datad => \inst6|q\(3),
	combout => \inst7|Decoder0~1_combout\);

-- Location: LCCOMB_X29_Y20_N18
\inst7|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~12_combout\ = (\inst7|Decoder0~1_combout\ & ((GND) # (!\inst7|Add0~11\))) # (!\inst7|Decoder0~1_combout\ & (\inst7|Add0~11\ $ (GND)))
-- \inst7|Add0~13\ = CARRY((\inst7|Decoder0~1_combout\) # (!\inst7|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder0~1_combout\,
	datad => VCC,
	cin => \inst7|Add0~11\,
	combout => \inst7|Add0~12_combout\,
	cout => \inst7|Add0~13\);

-- Location: LCCOMB_X29_Y20_N20
\inst7|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~14_combout\ = (\inst7|Decoder0~0_combout\ & (\inst7|Add0~13\ & VCC)) # (!\inst7|Decoder0~0_combout\ & (!\inst7|Add0~13\))
-- \inst7|Add0~15\ = CARRY((!\inst7|Decoder0~0_combout\ & !\inst7|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder0~0_combout\,
	datad => VCC,
	cin => \inst7|Add0~13\,
	combout => \inst7|Add0~14_combout\,
	cout => \inst7|Add0~15\);

-- Location: LCCOMB_X29_Y20_N22
\inst7|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~16_combout\ = (\inst6|Equal0~0_combout\ & ((GND) # (!\inst7|Add0~15\))) # (!\inst6|Equal0~0_combout\ & (\inst7|Add0~15\ $ (GND)))
-- \inst7|Add0~17\ = CARRY((\inst6|Equal0~0_combout\) # (!\inst7|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst6|Equal0~0_combout\,
	datad => VCC,
	cin => \inst7|Add0~15\,
	combout => \inst7|Add0~16_combout\,
	cout => \inst7|Add0~17\);

-- Location: LCCOMB_X29_Y20_N24
\inst7|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~18_combout\ = \inst7|Add0~17\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst7|Add0~17\,
	combout => \inst7|Add0~18_combout\);

-- Location: LCCOMB_X30_Y20_N4
\inst7|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~4_combout\ = (!\inst7|Add0~16_combout\ & (\inst7|Add0~18_combout\ & (\inst7|count\(7) $ (!\inst7|Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(7),
	datab => \inst7|Add0~16_combout\,
	datac => \inst7|Add0~12_combout\,
	datad => \inst7|Add0~18_combout\,
	combout => \inst7|Equal0~4_combout\);

-- Location: LCCOMB_X30_Y20_N0
\inst7|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~2_combout\ = (\inst7|Add0~6_combout\ & ((\inst7|count\(8) $ (\inst7|Add0~14_combout\)) # (!\inst7|count\(4)))) # (!\inst7|Add0~6_combout\ & ((\inst7|count\(4)) # (\inst7|count\(8) $ (\inst7|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~6_combout\,
	datab => \inst7|count\(4),
	datac => \inst7|count\(8),
	datad => \inst7|Add0~14_combout\,
	combout => \inst7|Equal0~2_combout\);

-- Location: LCCOMB_X30_Y20_N2
\inst7|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~3_combout\ = (\inst7|count\(0) & (!\inst7|Equal0~2_combout\ & (\inst7|count\(3) $ (!\inst7|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(0),
	datab => \inst7|count\(3),
	datac => \inst7|Add0~4_combout\,
	datad => \inst7|Equal0~2_combout\,
	combout => \inst7|Equal0~3_combout\);

-- Location: LCCOMB_X30_Y20_N6
\inst7|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~5_combout\ = (\inst7|Equal0~1_combout\ & (\inst7|Equal0~0_combout\ & (\inst7|Equal0~4_combout\ & \inst7|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Equal0~1_combout\,
	datab => \inst7|Equal0~0_combout\,
	datac => \inst7|Equal0~4_combout\,
	datad => \inst7|Equal0~3_combout\,
	combout => \inst7|Equal0~5_combout\);

-- Location: FF_X30_Y20_N13
\inst7|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[0]~9_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(0));

-- Location: LCCOMB_X30_Y20_N14
\inst7|count[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[1]~11_combout\ = (\inst7|count\(1) & (!\inst7|count[0]~10\)) # (!\inst7|count\(1) & ((\inst7|count[0]~10\) # (GND)))
-- \inst7|count[1]~12\ = CARRY((!\inst7|count[0]~10\) # (!\inst7|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|count\(1),
	datad => VCC,
	cin => \inst7|count[0]~10\,
	combout => \inst7|count[1]~11_combout\,
	cout => \inst7|count[1]~12\);

-- Location: FF_X30_Y20_N15
\inst7|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[1]~11_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(1));

-- Location: LCCOMB_X30_Y20_N16
\inst7|count[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[2]~13_combout\ = (\inst7|count\(2) & (\inst7|count[1]~12\ $ (GND))) # (!\inst7|count\(2) & (!\inst7|count[1]~12\ & VCC))
-- \inst7|count[2]~14\ = CARRY((\inst7|count\(2) & !\inst7|count[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|count\(2),
	datad => VCC,
	cin => \inst7|count[1]~12\,
	combout => \inst7|count[2]~13_combout\,
	cout => \inst7|count[2]~14\);

-- Location: FF_X30_Y20_N17
\inst7|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[2]~13_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(2));

-- Location: LCCOMB_X30_Y20_N18
\inst7|count[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[3]~15_combout\ = (\inst7|count\(3) & (!\inst7|count[2]~14\)) # (!\inst7|count\(3) & ((\inst7|count[2]~14\) # (GND)))
-- \inst7|count[3]~16\ = CARRY((!\inst7|count[2]~14\) # (!\inst7|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|count\(3),
	datad => VCC,
	cin => \inst7|count[2]~14\,
	combout => \inst7|count[3]~15_combout\,
	cout => \inst7|count[3]~16\);

-- Location: FF_X30_Y20_N19
\inst7|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[3]~15_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(3));

-- Location: LCCOMB_X30_Y20_N20
\inst7|count[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[4]~17_combout\ = (\inst7|count\(4) & (\inst7|count[3]~16\ $ (GND))) # (!\inst7|count\(4) & (!\inst7|count[3]~16\ & VCC))
-- \inst7|count[4]~18\ = CARRY((\inst7|count\(4) & !\inst7|count[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|count\(4),
	datad => VCC,
	cin => \inst7|count[3]~16\,
	combout => \inst7|count[4]~17_combout\,
	cout => \inst7|count[4]~18\);

-- Location: FF_X30_Y20_N21
\inst7|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[4]~17_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(4));

-- Location: LCCOMB_X30_Y20_N22
\inst7|count[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[5]~19_combout\ = (\inst7|count\(5) & (!\inst7|count[4]~18\)) # (!\inst7|count\(5) & ((\inst7|count[4]~18\) # (GND)))
-- \inst7|count[5]~20\ = CARRY((!\inst7|count[4]~18\) # (!\inst7|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(5),
	datad => VCC,
	cin => \inst7|count[4]~18\,
	combout => \inst7|count[5]~19_combout\,
	cout => \inst7|count[5]~20\);

-- Location: FF_X30_Y20_N23
\inst7|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[5]~19_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(5));

-- Location: LCCOMB_X30_Y20_N24
\inst7|count[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[6]~21_combout\ = (\inst7|count\(6) & (\inst7|count[5]~20\ $ (GND))) # (!\inst7|count\(6) & (!\inst7|count[5]~20\ & VCC))
-- \inst7|count[6]~22\ = CARRY((\inst7|count\(6) & !\inst7|count[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|count\(6),
	datad => VCC,
	cin => \inst7|count[5]~20\,
	combout => \inst7|count[6]~21_combout\,
	cout => \inst7|count[6]~22\);

-- Location: FF_X30_Y20_N25
\inst7|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[6]~21_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(6));

-- Location: LCCOMB_X30_Y20_N26
\inst7|count[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[7]~23_combout\ = (\inst7|count\(7) & (!\inst7|count[6]~22\)) # (!\inst7|count\(7) & ((\inst7|count[6]~22\) # (GND)))
-- \inst7|count[7]~24\ = CARRY((!\inst7|count[6]~22\) # (!\inst7|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(7),
	datad => VCC,
	cin => \inst7|count[6]~22\,
	combout => \inst7|count[7]~23_combout\,
	cout => \inst7|count[7]~24\);

-- Location: FF_X30_Y20_N27
\inst7|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[7]~23_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(7));

-- Location: LCCOMB_X30_Y20_N28
\inst7|count[8]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|count[8]~25_combout\ = \inst7|count[7]~24\ $ (!\inst7|count\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst7|count\(8),
	cin => \inst7|count[7]~24\,
	combout => \inst7|count[8]~25_combout\);

-- Location: FF_X30_Y20_N29
\inst7|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|count[8]~25_combout\,
	sclr => \inst7|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(8));

-- Location: LCCOMB_X31_Y20_N6
\inst7|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~1_cout\ = CARRY((!\inst7|count\(0) & \inst7|WideOr0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(0),
	datab => \inst7|WideOr0~0_combout\,
	datad => VCC,
	cout => \inst7|LessThan1~1_cout\);

-- Location: LCCOMB_X31_Y20_N8
\inst7|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~3_cout\ = CARRY((\inst7|count\(1) & ((!\inst7|LessThan1~1_cout\) # (!\inst7|Decoder2~0_combout\))) # (!\inst7|count\(1) & (!\inst7|Decoder2~0_combout\ & !\inst7|LessThan1~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(1),
	datab => \inst7|Decoder2~0_combout\,
	datad => VCC,
	cin => \inst7|LessThan1~1_cout\,
	cout => \inst7|LessThan1~3_cout\);

-- Location: LCCOMB_X31_Y20_N10
\inst7|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~5_cout\ = CARRY((\inst7|count\(2) & (\inst7|Decoder0~4_combout\ & !\inst7|LessThan1~3_cout\)) # (!\inst7|count\(2) & ((\inst7|Decoder0~4_combout\) # (!\inst7|LessThan1~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(2),
	datab => \inst7|Decoder0~4_combout\,
	datad => VCC,
	cin => \inst7|LessThan1~3_cout\,
	cout => \inst7|LessThan1~5_cout\);

-- Location: LCCOMB_X31_Y20_N12
\inst7|LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~7_cout\ = CARRY((\inst7|Decoder1~0_combout\ & (\inst7|count\(3) & !\inst7|LessThan1~5_cout\)) # (!\inst7|Decoder1~0_combout\ & ((\inst7|count\(3)) # (!\inst7|LessThan1~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder1~0_combout\,
	datab => \inst7|count\(3),
	datad => VCC,
	cin => \inst7|LessThan1~5_cout\,
	cout => \inst7|LessThan1~7_cout\);

-- Location: LCCOMB_X31_Y20_N14
\inst7|LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~9_cout\ = CARRY((\inst7|Decoder0~3_combout\ & ((!\inst7|LessThan1~7_cout\) # (!\inst7|count\(4)))) # (!\inst7|Decoder0~3_combout\ & (!\inst7|count\(4) & !\inst7|LessThan1~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder0~3_combout\,
	datab => \inst7|count\(4),
	datad => VCC,
	cin => \inst7|LessThan1~7_cout\,
	cout => \inst7|LessThan1~9_cout\);

-- Location: LCCOMB_X31_Y20_N16
\inst7|LessThan1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~11_cout\ = CARRY((\inst7|Decoder0~2_combout\ & (\inst7|count\(5) & !\inst7|LessThan1~9_cout\)) # (!\inst7|Decoder0~2_combout\ & ((\inst7|count\(5)) # (!\inst7|LessThan1~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder0~2_combout\,
	datab => \inst7|count\(5),
	datad => VCC,
	cin => \inst7|LessThan1~9_cout\,
	cout => \inst7|LessThan1~11_cout\);

-- Location: LCCOMB_X31_Y20_N18
\inst7|LessThan1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~13_cout\ = CARRY((\inst7|Decoder0~1_combout\ & ((!\inst7|LessThan1~11_cout\) # (!\inst7|count\(6)))) # (!\inst7|Decoder0~1_combout\ & (!\inst7|count\(6) & !\inst7|LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Decoder0~1_combout\,
	datab => \inst7|count\(6),
	datad => VCC,
	cin => \inst7|LessThan1~11_cout\,
	cout => \inst7|LessThan1~13_cout\);

-- Location: LCCOMB_X31_Y20_N20
\inst7|LessThan1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~15_cout\ = CARRY((\inst7|count\(7) & ((!\inst7|LessThan1~13_cout\) # (!\inst7|Decoder0~0_combout\))) # (!\inst7|count\(7) & (!\inst7|Decoder0~0_combout\ & !\inst7|LessThan1~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(7),
	datab => \inst7|Decoder0~0_combout\,
	datad => VCC,
	cin => \inst7|LessThan1~13_cout\,
	cout => \inst7|LessThan1~15_cout\);

-- Location: LCCOMB_X31_Y20_N22
\inst7|LessThan1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|LessThan1~16_combout\ = (\inst6|Equal0~0_combout\ & ((!\inst7|count\(8)) # (!\inst7|LessThan1~15_cout\))) # (!\inst6|Equal0~0_combout\ & (!\inst7|LessThan1~15_cout\ & !\inst7|count\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|Equal0~0_combout\,
	datad => \inst7|count\(8),
	cin => \inst7|LessThan1~15_cout\,
	combout => \inst7|LessThan1~16_combout\);

-- Location: FF_X31_Y20_N23
\inst7|opt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \SYS_CLK~inputclkctrl_outclk\,
	d => \inst7|LessThan1~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|opt~q\);

-- Location: CLKCTRL_G7
\inst7|opt~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst7|opt~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst7|opt~clkctrl_outclk\);

-- Location: LCCOMB_X28_Y8_N22
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\ = !\inst8|count\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst8|count\(0),
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\);

-- Location: LCCOMB_X29_Y8_N4
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\ = \inst8|Add0~4_combout\ $ (VCC)
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ = CARRY(\inst8|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst8|Add0~4_combout\,
	datad => VCC,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\,
	cout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~3\);

-- Location: LCCOMB_X28_Y8_N26
\inst8|Mod0|auto_generated|divider|divider|StageOut[93]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\inst8|Add0~4_combout\))) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~2_combout\,
	datac => \inst8|Add0~4_combout\,
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\);

-- Location: FF_X28_Y8_N27
\inst8|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[93]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(3));

-- Location: LCCOMB_X28_Y8_N0
\inst8|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~0_combout\ = (\inst8|count\(0) & (\inst8|count\(1) $ (VCC))) # (!\inst8|count\(0) & (\inst8|count\(1) & VCC))
-- \inst8|Add0~1\ = CARRY((\inst8|count\(0) & \inst8|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(0),
	datab => \inst8|count\(1),
	datad => VCC,
	combout => \inst8|Add0~0_combout\,
	cout => \inst8|Add0~1\);

-- Location: FF_X28_Y8_N1
\inst8|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(1));

-- Location: LCCOMB_X28_Y8_N2
\inst8|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~2_combout\ = (\inst8|count\(2) & (!\inst8|Add0~1\)) # (!\inst8|count\(2) & ((\inst8|Add0~1\) # (GND)))
-- \inst8|Add0~3\ = CARRY((!\inst8|Add0~1\) # (!\inst8|count\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst8|count\(2),
	datad => VCC,
	cin => \inst8|Add0~1\,
	combout => \inst8|Add0~2_combout\,
	cout => \inst8|Add0~3\);

-- Location: FF_X28_Y8_N3
\inst8|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(2));

-- Location: LCCOMB_X28_Y8_N4
\inst8|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~4_combout\ = (\inst8|count\(3) & (\inst8|Add0~3\ $ (GND))) # (!\inst8|count\(3) & (!\inst8|Add0~3\ & VCC))
-- \inst8|Add0~5\ = CARRY((\inst8|count\(3) & !\inst8|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(3),
	datad => VCC,
	cin => \inst8|Add0~3\,
	combout => \inst8|Add0~4_combout\,
	cout => \inst8|Add0~5\);

-- Location: LCCOMB_X29_Y8_N6
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\ = (\inst8|Add0~6_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ & VCC)) # (!\inst8|Add0~6_combout\ & 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~3\))
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~5\ = CARRY((!\inst8|Add0~6_combout\ & !\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst8|Add0~6_combout\,
	datad => VCC,
	cin => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~3\,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\,
	cout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~5\);

-- Location: LCCOMB_X28_Y8_N28
\inst8|Mod0|auto_generated|divider|divider|StageOut[94]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[94]~2_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\inst8|Add0~6_combout\))) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~4_combout\,
	datac => \inst8|Add0~6_combout\,
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[94]~2_combout\);

-- Location: FF_X28_Y8_N29
\inst8|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[94]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(4));

-- Location: LCCOMB_X28_Y8_N6
\inst8|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~6_combout\ = (\inst8|count\(4) & (!\inst8|Add0~5\)) # (!\inst8|count\(4) & ((\inst8|Add0~5\) # (GND)))
-- \inst8|Add0~7\ = CARRY((!\inst8|Add0~5\) # (!\inst8|count\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst8|count\(4),
	datad => VCC,
	cin => \inst8|Add0~5\,
	combout => \inst8|Add0~6_combout\,
	cout => \inst8|Add0~7\);

-- Location: LCCOMB_X29_Y8_N8
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\ = (\inst8|Add0~8_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~5\ $ (GND))) # (!\inst8|Add0~8_combout\ & 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~5\ & VCC))
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ = CARRY((\inst8|Add0~8_combout\ & !\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~8_combout\,
	datad => VCC,
	cin => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~5\,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\,
	cout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~7\);

-- Location: LCCOMB_X29_Y8_N20
\inst8|Mod0|auto_generated|divider|divider|StageOut[95]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Add0~8_combout\)) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~8_combout\,
	datac => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~6_combout\,
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\);

-- Location: FF_X29_Y8_N21
\inst8|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[95]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(5));

-- Location: LCCOMB_X28_Y8_N8
\inst8|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~8_combout\ = (\inst8|count\(5) & (\inst8|Add0~7\ $ (GND))) # (!\inst8|count\(5) & (!\inst8|Add0~7\ & VCC))
-- \inst8|Add0~9\ = CARRY((\inst8|count\(5) & !\inst8|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(5),
	datad => VCC,
	cin => \inst8|Add0~7\,
	combout => \inst8|Add0~8_combout\,
	cout => \inst8|Add0~9\);

-- Location: LCCOMB_X29_Y8_N10
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\ = (\inst8|Add0~10_combout\ & (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~7\)) # (!\inst8|Add0~10_combout\ & 
-- ((\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~7\) # (GND)))
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ = CARRY((!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~7\) # (!\inst8|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~10_combout\,
	datad => VCC,
	cin => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~7\,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\,
	cout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~9\);

-- Location: LCCOMB_X29_Y8_N30
\inst8|Mod0|auto_generated|divider|divider|StageOut[96]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Add0~10_combout\)) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~10_combout\,
	datac => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~8_combout\,
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\);

-- Location: FF_X29_Y8_N31
\inst8|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[96]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(6));

-- Location: LCCOMB_X28_Y8_N10
\inst8|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~10_combout\ = (\inst8|count\(6) & (!\inst8|Add0~9\)) # (!\inst8|count\(6) & ((\inst8|Add0~9\) # (GND)))
-- \inst8|Add0~11\ = CARRY((!\inst8|Add0~9\) # (!\inst8|count\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(6),
	datad => VCC,
	cin => \inst8|Add0~9\,
	combout => \inst8|Add0~10_combout\,
	cout => \inst8|Add0~11\);

-- Location: LCCOMB_X29_Y8_N12
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\ = (\inst8|Add0~12_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ $ (GND))) # (!\inst8|Add0~12_combout\ & 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ & VCC))
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~11\ = CARRY((\inst8|Add0~12_combout\ & !\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~12_combout\,
	datad => VCC,
	cin => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[6]~9\,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\,
	cout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~11\);

-- Location: LCCOMB_X29_Y8_N24
\inst8|Mod0|auto_generated|divider|divider|StageOut[97]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\inst8|Add0~12_combout\))) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~10_combout\,
	datac => \inst8|Add0~12_combout\,
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\);

-- Location: FF_X29_Y8_N25
\inst8|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[97]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(7));

-- Location: LCCOMB_X28_Y8_N12
\inst8|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~12_combout\ = (\inst8|count\(7) & (\inst8|Add0~11\ $ (GND))) # (!\inst8|count\(7) & (!\inst8|Add0~11\ & VCC))
-- \inst8|Add0~13\ = CARRY((\inst8|count\(7) & !\inst8|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst8|count\(7),
	datad => VCC,
	cin => \inst8|Add0~11\,
	combout => \inst8|Add0~12_combout\,
	cout => \inst8|Add0~13\);

-- Location: LCCOMB_X29_Y8_N14
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\ = (\inst8|Add0~14_combout\ & (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~11\)) # (!\inst8|Add0~14_combout\ & 
-- ((\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~11\) # (GND)))
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ = CARRY((!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~11\) # (!\inst8|Add0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~14_combout\,
	datad => VCC,
	cin => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[7]~11\,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\,
	cout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~13\);

-- Location: LCCOMB_X29_Y8_N2
\inst8|Mod0|auto_generated|divider|divider|StageOut[98]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Add0~14_combout\)) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~14_combout\,
	datac => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\,
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\);

-- Location: FF_X29_Y8_N3
\inst8|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[98]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(8));

-- Location: LCCOMB_X28_Y8_N14
\inst8|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~14_combout\ = (\inst8|count\(8) & (!\inst8|Add0~13\)) # (!\inst8|count\(8) & ((\inst8|Add0~13\) # (GND)))
-- \inst8|Add0~15\ = CARRY((!\inst8|Add0~13\) # (!\inst8|count\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(8),
	datad => VCC,
	cin => \inst8|Add0~13\,
	combout => \inst8|Add0~14_combout\,
	cout => \inst8|Add0~15\);

-- Location: LCCOMB_X29_Y8_N16
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\ = (\inst8|Add0~16_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ $ (GND))) # (!\inst8|Add0~16_combout\ & 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~13\ & VCC))
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~15\ = CARRY((\inst8|Add0~16_combout\ & !\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Add0~16_combout\,
	datad => VCC,
	cin => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[8]~13\,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\,
	cout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~15\);

-- Location: LCCOMB_X29_Y8_N28
\inst8|Mod0|auto_generated|divider|divider|StageOut[99]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((\inst8|Add0~16_combout\))) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~14_combout\,
	datac => \inst8|Add0~16_combout\,
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\);

-- Location: FF_X29_Y8_N29
\inst8|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[99]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(9));

-- Location: LCCOMB_X28_Y8_N16
\inst8|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Add0~16_combout\ = \inst8|Add0~15\ $ (!\inst8|count\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst8|count\(9),
	cin => \inst8|Add0~15\,
	combout => \inst8|Add0~16_combout\);

-- Location: LCCOMB_X29_Y8_N18
\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ = !\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[9]~15\,
	combout => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\);

-- Location: LCCOMB_X28_Y8_N24
\inst8|Mod0|auto_generated|divider|divider|StageOut[90]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Mod0|auto_generated|divider|divider|StageOut[90]~0_combout\ = (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & ((!\inst8|count\(0)))) # 
-- (!\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\ & (\inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\,
	datac => \inst8|count\(0),
	datad => \inst8|Mod0|auto_generated|divider|divider|add_sub_9_result_int[10]~16_combout\,
	combout => \inst8|Mod0|auto_generated|divider|divider|StageOut[90]~0_combout\);

-- Location: FF_X28_Y8_N25
\inst8|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Mod0|auto_generated|divider|divider|StageOut[90]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|count\(0));

-- Location: IOIBUF_X0_Y5_N15
\btn_mode~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_btn_mode,
	o => \btn_mode~input_o\);

-- Location: LCCOMB_X26_Y8_N18
\inst3|otp[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|otp[0]~1_combout\ = !\inst3|otp\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst3|otp\(0),
	combout => \inst3|otp[0]~1_combout\);

-- Location: FF_X26_Y8_N19
\inst3|otp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \btn_mode~input_o\,
	d => \inst3|otp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|otp\(0));

-- Location: LCCOMB_X26_Y8_N16
\inst3|otp[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|otp[1]~0_combout\ = \inst3|otp\(1) $ (\inst3|otp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst3|otp\(1),
	datad => \inst3|otp\(0),
	combout => \inst3|otp[1]~0_combout\);

-- Location: FF_X26_Y8_N17
\inst3|otp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \btn_mode~input_o\,
	d => \inst3|otp[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|otp\(1));

-- Location: M9K_X27_Y7_N0
\inst8|data_rtl_0|auto_generated|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000015555555555556AAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555540000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000155555555555555555555555555555555555555555555555555555555555555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555555555555555555555555555555555555555555555555555555555400000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0000000000005555555555555555555555555555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000155555555555555555555555555555555555555555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/SHUDIAN_PLUS.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst8|altsyncram:data_rtl_0|altsyncram_qj71:auto_generated|ALTSYNCRAM",
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
	clk0 => \inst7|opt~clkctrl_outclk\,
	portaaddr => \inst8|data_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst8|data_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M9K_X27_Y6_N0
\inst8|data_rtl_0|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000000000001556AABFFC000555AAAFFFC001556AABFFF000555AAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA955555555555555555555555555540000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA955555555555555555555555555540000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA555555555555555555555555555540000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555555555555555555555554000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000001555555555555555AAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFC0000000000000005555555555555555AAAAAAAAAAAAAAABFFFFFFFFFFFFFFF00000000000000005555555555555556AAAAAAAAAAAAAAABFFFFFFFFFFFFFFF00000000000000015555555555555556AAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAA95555555555555554000000000000000FFFFFFFFFFFFFFFEAAAAAAAAAAAAAAA95555555555555550000000000000000FFFFFFFFFFFFFFFEAAAAAAAAAAAAAAA55555555555555550000000000000003FFFFFFFFFFFFFFFAAAAAAAAAAAAAAAA5555555555555554000000000000000",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000FFFFFFFFFEAAAAAAAAA9555555555500000000000FFFFFFFFFFFFAAAAAAAAAAAAAA55555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000155555555555555556AAAAAAAAAAAAABFFFFFFFFFFFC000000000015555555555AAAAAAAAAAFFFFFFFFFF00000000005555555555AAAAAAAAAABFFFFFFFFFFF00000000000055555555555556AAAAAAAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAA55555555555554000000000003FFFFFFFFFFFAAAAAAAAAA955555555540000000003",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/SHUDIAN_PLUS.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst8|altsyncram:data_rtl_0|altsyncram_qj71:auto_generated|ALTSYNCRAM",
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
	clk0 => \inst7|opt~clkctrl_outclk\,
	portaaddr => \inst8|data_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst8|data_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: M9K_X27_Y8_N0
\inst8|data_rtl_0|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000006BC5BC5AC1AC16F16F06B06BC5BC5BC1AC1AF16F16B06B05BFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA555555540000003FFFFFFEAAAAAA955555540000003FFFFFFEAAAAAA955555540000000FFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA555555500000003FFFFFFEAAAAAA955555540000003FFFFFFEAAAAAA955555540000000FFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA55555550000000FFFFFFFEAAAAAA955555540000003FFFFFFEAAAAAA955555540000003FFFFFFEAAAAAAA55555550000000FFFFFFFAAAAAAA55555550000000FFFFFFFAAAAAAA955555540000003FFFFFFEAAAAAA95555554000000",
	mem_init2 => X"00000000000000015556AAABFFFC00015556AAAFFFF00005555AAAAFFFF00015556AAABFFFC00015556AAABFFF00005555AAAAFFFF00005556AAABFFFC00015556AAABFFF00005555AAAAFFFF00005555AAABFFFC00015556AAABFFFC0005555AAAAFFFF00005555AAAAFFFC00015556AAABFFFC0001555AAAAFFFF00005555AAAAFFFFFFAAAA55550000FFFFAAAA55540003FFFEAAA955540003FFFAAAA55550000FFFFAAAA55550003FFFEAAA955540003FFFEAAA55550000FFFFAAAA55550000FFFEAAA955540003FFFEAAA95550000FFFFAAAA55550000FFFEAAA955540003FFFEAAA95554000FFFFAAAA55550000FFFFAAA955540003FFFEAAA95554000",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000FFAA955003FFAA955003FFAA955400FFEAA955000FFFAAA555000FFFEAA95550000FFFEAAA9555500000FFFFFEAAAAA95555555400000000000000000000000000000000000000000055555555AAAAAAFFFFFC000015555AAAAFFFC0001555AAAFFFC001556AABFFC00155AAAFFC00555AABFF00155AABFF00155AABFF00155AABFF00155AABFF000556AAFFC00155AAAFFF001556AABFFF0005556AAAFFFC00015555AAAAFFFFF0000005555556AAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAA5555554000003FFFFEAAA955550000FFFEAAA5554003FFFAAA555003FFEAA955000FFEAA554003FFAA955003FFAA955003",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/SHUDIAN_PLUS.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst8|altsyncram:data_rtl_0|altsyncram_qj71:auto_generated|ALTSYNCRAM",
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
	clk0 => \inst7|opt~clkctrl_outclk\,
	portaaddr => \inst8|data_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst8|data_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: M9K_X27_Y9_N0
\inst8|data_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"000000000000349E34D278E349E78D279E349E78D249E34D278D349E34D278EA9500FEA9500FFA9540FFA9540FFA9540FFA9540FFA95403FAA5403FAA5403FAA5403FAA5503FEA5503FEA5503FEA5503FEA5503FEA9500FEA9500FEA9500FEA9500FEA9540FFA9540FFA9540FFA9540FFAA5403FAA5403FAA5403FAA5403FAA5403FEA5503FEA5503FEA5503FEA5500FEA9500FEA9500FEA9500FEA9500FEA9540FFA9540FFA9540FFA9540FFAA5403FAA5403FAA5403FAA5403FAA5503FEA5503FEA5503FEA5503FEA5503FEA9500FEA9500FEA9500FEA9500FFA9540FFA9540FFA9540FFA9540FFA95403FAA5403FAA5403FAA5403FAA5503FEA5503FEA550",
	mem_init2 => X"00000000000016BC16BC16BC16BC16BC16BC16F05AF05AF05AF05AF05AF05AC16BC16BC16BC16BC16BC16BC5AF05AF05AF05AF05AF05AF05BC16BC16BC16BC16BC16BC16B05AF05AF05AF05AF05AF05AF06BC16BC16BC16BC16BC16BC16F05AF05AF05AF05AF05AF05AF16BC16BC16BC16BC16BC16BC1AF05AF05AF05AF05AF05AF05AA50FA50FA50FA50FA50FA50FA43E943E943E943E943E943E94FA50FA50FA50FA50FA50FA50F943E943E943E943E943E943E90FA50FA50FA50FA50FA50FA50E943E943E943E943E943E943E50FA50FA50FA50FA50FA50FA53E943E943E943E943E943E943A50FA50FA50FA50FA50FA50F943E943E943E943E943E943E94",
	mem_init1 => X"000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000094E5394E5394E5394E93A4F93E4394E93E53A4F94F90E90E90E94F943A53E90FA50E943E943FA50FA940FA9503FA9503FEA95403FFAAA55540000000000000000000000005556AABFF0055AAFF015ABF015ABC05ABC16BF05AF05AC16BC1AF16B05BC5AC1AC1AC1BC5BC6B16F1AC5B06F1BC6B1AC5B16C5B16C5B16C5B16C5B16C5B16C5B16C1B06F1BC6B16C1BC5B06F16F1AC1AC1AC16F16B05BC1AF05AC16BC16BF05AF016AF015ABF015ABFC0156ABFF0005556AAAABFFFFFFFFFFFFFFAAAAA5554003FFAA5500FFA9503FA9503EA503E943FA50FA50E943E90F943A53E50E90E90E93E53E4394F90E53A4F93E4390E5394E5394E5394E53",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/SHUDIAN_PLUS.ram0_romtatal_8447d579.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "romtatal:inst8|altsyncram:data_rtl_0|altsyncram_qj71:auto_generated|ALTSYNCRAM",
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
	clk0 => \inst7|opt~clkctrl_outclk\,
	portaaddr => \inst8|data_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst8|data_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: IOIBUF_X28_Y24_N1
\V_cmp_sig~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V_cmp_sig,
	o => \V_cmp_sig~input_o\);

-- Location: LCCOMB_X24_Y21_N0
\inst|i[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[0]~32_combout\ = \inst|i\(0) $ (VCC)
-- \inst|i[0]~33\ = CARRY(\inst|i\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(0),
	datad => VCC,
	combout => \inst|i[0]~32_combout\,
	cout => \inst|i[0]~33\);

-- Location: LCCOMB_X28_Y8_N20
\inst8|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Equal0~0_combout\ = (\inst8|count\(1) & (\inst8|count\(2) & (!\inst8|count\(4) & !\inst8|count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(1),
	datab => \inst8|count\(2),
	datac => \inst8|count\(4),
	datad => \inst8|count\(3),
	combout => \inst8|Equal0~0_combout\);

-- Location: LCCOMB_X28_Y8_N30
\inst8|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Equal0~1_combout\ = (\inst8|count\(5) & (\inst8|count\(7) & (\inst8|count\(0) & \inst8|count\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(5),
	datab => \inst8|count\(7),
	datac => \inst8|count\(0),
	datad => \inst8|count\(6),
	combout => \inst8|Equal0~1_combout\);

-- Location: LCCOMB_X28_Y8_N18
\inst8|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|Equal0~2_combout\ = (\inst8|count\(8) & (\inst8|Equal0~0_combout\ & (\inst8|Equal0~1_combout\ & \inst8|count\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst8|count\(8),
	datab => \inst8|Equal0~0_combout\,
	datac => \inst8|Equal0~1_combout\,
	datad => \inst8|count\(9),
	combout => \inst8|Equal0~2_combout\);

-- Location: FF_X28_Y8_N19
\inst8|cout\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst8|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8|cout~q\);

-- Location: FF_X24_Y21_N1
\inst|i[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[0]~32_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(0));

-- Location: LCCOMB_X24_Y21_N2
\inst|i[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[1]~34_combout\ = (\inst|i\(1) & (!\inst|i[0]~33\)) # (!\inst|i\(1) & ((\inst|i[0]~33\) # (GND)))
-- \inst|i[1]~35\ = CARRY((!\inst|i[0]~33\) # (!\inst|i\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(1),
	datad => VCC,
	cin => \inst|i[0]~33\,
	combout => \inst|i[1]~34_combout\,
	cout => \inst|i[1]~35\);

-- Location: FF_X24_Y21_N3
\inst|i[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[1]~34_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(1));

-- Location: LCCOMB_X24_Y21_N4
\inst|i[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[2]~36_combout\ = (\inst|i\(2) & (\inst|i[1]~35\ $ (GND))) # (!\inst|i\(2) & (!\inst|i[1]~35\ & VCC))
-- \inst|i[2]~37\ = CARRY((\inst|i\(2) & !\inst|i[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(2),
	datad => VCC,
	cin => \inst|i[1]~35\,
	combout => \inst|i[2]~36_combout\,
	cout => \inst|i[2]~37\);

-- Location: FF_X24_Y21_N5
\inst|i[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[2]~36_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(2));

-- Location: LCCOMB_X24_Y21_N6
\inst|i[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[3]~38_combout\ = (\inst|i\(3) & (!\inst|i[2]~37\)) # (!\inst|i\(3) & ((\inst|i[2]~37\) # (GND)))
-- \inst|i[3]~39\ = CARRY((!\inst|i[2]~37\) # (!\inst|i\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(3),
	datad => VCC,
	cin => \inst|i[2]~37\,
	combout => \inst|i[3]~38_combout\,
	cout => \inst|i[3]~39\);

-- Location: FF_X24_Y21_N7
\inst|i[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[3]~38_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(3));

-- Location: LCCOMB_X24_Y21_N8
\inst|i[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[4]~40_combout\ = (\inst|i\(4) & (\inst|i[3]~39\ $ (GND))) # (!\inst|i\(4) & (!\inst|i[3]~39\ & VCC))
-- \inst|i[4]~41\ = CARRY((\inst|i\(4) & !\inst|i[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(4),
	datad => VCC,
	cin => \inst|i[3]~39\,
	combout => \inst|i[4]~40_combout\,
	cout => \inst|i[4]~41\);

-- Location: FF_X24_Y21_N9
\inst|i[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[4]~40_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(4));

-- Location: LCCOMB_X24_Y21_N10
\inst|i[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[5]~42_combout\ = (\inst|i\(5) & (!\inst|i[4]~41\)) # (!\inst|i\(5) & ((\inst|i[4]~41\) # (GND)))
-- \inst|i[5]~43\ = CARRY((!\inst|i[4]~41\) # (!\inst|i\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(5),
	datad => VCC,
	cin => \inst|i[4]~41\,
	combout => \inst|i[5]~42_combout\,
	cout => \inst|i[5]~43\);

-- Location: FF_X24_Y21_N11
\inst|i[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[5]~42_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(5));

-- Location: LCCOMB_X24_Y21_N12
\inst|i[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[6]~44_combout\ = (\inst|i\(6) & (\inst|i[5]~43\ $ (GND))) # (!\inst|i\(6) & (!\inst|i[5]~43\ & VCC))
-- \inst|i[6]~45\ = CARRY((\inst|i\(6) & !\inst|i[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(6),
	datad => VCC,
	cin => \inst|i[5]~43\,
	combout => \inst|i[6]~44_combout\,
	cout => \inst|i[6]~45\);

-- Location: FF_X24_Y21_N13
\inst|i[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[6]~44_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(6));

-- Location: LCCOMB_X24_Y21_N14
\inst|i[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[7]~46_combout\ = (\inst|i\(7) & (!\inst|i[6]~45\)) # (!\inst|i\(7) & ((\inst|i[6]~45\) # (GND)))
-- \inst|i[7]~47\ = CARRY((!\inst|i[6]~45\) # (!\inst|i\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(7),
	datad => VCC,
	cin => \inst|i[6]~45\,
	combout => \inst|i[7]~46_combout\,
	cout => \inst|i[7]~47\);

-- Location: FF_X24_Y21_N15
\inst|i[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[7]~46_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(7));

-- Location: LCCOMB_X24_Y21_N16
\inst|i[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[8]~48_combout\ = (\inst|i\(8) & (\inst|i[7]~47\ $ (GND))) # (!\inst|i\(8) & (!\inst|i[7]~47\ & VCC))
-- \inst|i[8]~49\ = CARRY((\inst|i\(8) & !\inst|i[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(8),
	datad => VCC,
	cin => \inst|i[7]~47\,
	combout => \inst|i[8]~48_combout\,
	cout => \inst|i[8]~49\);

-- Location: FF_X24_Y21_N17
\inst|i[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[8]~48_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(8));

-- Location: LCCOMB_X24_Y21_N18
\inst|i[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[9]~50_combout\ = (\inst|i\(9) & (!\inst|i[8]~49\)) # (!\inst|i\(9) & ((\inst|i[8]~49\) # (GND)))
-- \inst|i[9]~51\ = CARRY((!\inst|i[8]~49\) # (!\inst|i\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(9),
	datad => VCC,
	cin => \inst|i[8]~49\,
	combout => \inst|i[9]~50_combout\,
	cout => \inst|i[9]~51\);

-- Location: FF_X24_Y21_N19
\inst|i[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[9]~50_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(9));

-- Location: LCCOMB_X24_Y21_N20
\inst|i[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[10]~52_combout\ = (\inst|i\(10) & (\inst|i[9]~51\ $ (GND))) # (!\inst|i\(10) & (!\inst|i[9]~51\ & VCC))
-- \inst|i[10]~53\ = CARRY((\inst|i\(10) & !\inst|i[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(10),
	datad => VCC,
	cin => \inst|i[9]~51\,
	combout => \inst|i[10]~52_combout\,
	cout => \inst|i[10]~53\);

-- Location: FF_X24_Y21_N21
\inst|i[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[10]~52_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(10));

-- Location: LCCOMB_X24_Y21_N22
\inst|i[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[11]~54_combout\ = (\inst|i\(11) & (!\inst|i[10]~53\)) # (!\inst|i\(11) & ((\inst|i[10]~53\) # (GND)))
-- \inst|i[11]~55\ = CARRY((!\inst|i[10]~53\) # (!\inst|i\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(11),
	datad => VCC,
	cin => \inst|i[10]~53\,
	combout => \inst|i[11]~54_combout\,
	cout => \inst|i[11]~55\);

-- Location: FF_X24_Y21_N23
\inst|i[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[11]~54_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(11));

-- Location: LCCOMB_X24_Y21_N24
\inst|i[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[12]~56_combout\ = (\inst|i\(12) & (\inst|i[11]~55\ $ (GND))) # (!\inst|i\(12) & (!\inst|i[11]~55\ & VCC))
-- \inst|i[12]~57\ = CARRY((\inst|i\(12) & !\inst|i[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(12),
	datad => VCC,
	cin => \inst|i[11]~55\,
	combout => \inst|i[12]~56_combout\,
	cout => \inst|i[12]~57\);

-- Location: FF_X24_Y21_N25
\inst|i[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[12]~56_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(12));

-- Location: LCCOMB_X24_Y21_N26
\inst|i[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[13]~58_combout\ = (\inst|i\(13) & (!\inst|i[12]~57\)) # (!\inst|i\(13) & ((\inst|i[12]~57\) # (GND)))
-- \inst|i[13]~59\ = CARRY((!\inst|i[12]~57\) # (!\inst|i\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(13),
	datad => VCC,
	cin => \inst|i[12]~57\,
	combout => \inst|i[13]~58_combout\,
	cout => \inst|i[13]~59\);

-- Location: FF_X24_Y21_N27
\inst|i[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[13]~58_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(13));

-- Location: LCCOMB_X24_Y21_N28
\inst|i[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[14]~60_combout\ = (\inst|i\(14) & (\inst|i[13]~59\ $ (GND))) # (!\inst|i\(14) & (!\inst|i[13]~59\ & VCC))
-- \inst|i[14]~61\ = CARRY((\inst|i\(14) & !\inst|i[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(14),
	datad => VCC,
	cin => \inst|i[13]~59\,
	combout => \inst|i[14]~60_combout\,
	cout => \inst|i[14]~61\);

-- Location: FF_X24_Y21_N29
\inst|i[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[14]~60_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(14));

-- Location: LCCOMB_X24_Y21_N30
\inst|i[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[15]~62_combout\ = (\inst|i\(15) & (!\inst|i[14]~61\)) # (!\inst|i\(15) & ((\inst|i[14]~61\) # (GND)))
-- \inst|i[15]~63\ = CARRY((!\inst|i[14]~61\) # (!\inst|i\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(15),
	datad => VCC,
	cin => \inst|i[14]~61\,
	combout => \inst|i[15]~62_combout\,
	cout => \inst|i[15]~63\);

-- Location: FF_X24_Y21_N31
\inst|i[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[15]~62_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(15));

-- Location: LCCOMB_X24_Y20_N0
\inst|i[16]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[16]~64_combout\ = (\inst|i\(16) & (\inst|i[15]~63\ $ (GND))) # (!\inst|i\(16) & (!\inst|i[15]~63\ & VCC))
-- \inst|i[16]~65\ = CARRY((\inst|i\(16) & !\inst|i[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(16),
	datad => VCC,
	cin => \inst|i[15]~63\,
	combout => \inst|i[16]~64_combout\,
	cout => \inst|i[16]~65\);

-- Location: FF_X24_Y20_N1
\inst|i[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[16]~64_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(16));

-- Location: LCCOMB_X24_Y20_N2
\inst|i[17]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[17]~66_combout\ = (\inst|i\(17) & (!\inst|i[16]~65\)) # (!\inst|i\(17) & ((\inst|i[16]~65\) # (GND)))
-- \inst|i[17]~67\ = CARRY((!\inst|i[16]~65\) # (!\inst|i\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(17),
	datad => VCC,
	cin => \inst|i[16]~65\,
	combout => \inst|i[17]~66_combout\,
	cout => \inst|i[17]~67\);

-- Location: FF_X24_Y20_N3
\inst|i[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[17]~66_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(17));

-- Location: LCCOMB_X24_Y20_N4
\inst|i[18]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[18]~68_combout\ = (\inst|i\(18) & (\inst|i[17]~67\ $ (GND))) # (!\inst|i\(18) & (!\inst|i[17]~67\ & VCC))
-- \inst|i[18]~69\ = CARRY((\inst|i\(18) & !\inst|i[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(18),
	datad => VCC,
	cin => \inst|i[17]~67\,
	combout => \inst|i[18]~68_combout\,
	cout => \inst|i[18]~69\);

-- Location: FF_X24_Y20_N5
\inst|i[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[18]~68_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(18));

-- Location: LCCOMB_X24_Y20_N6
\inst|i[19]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[19]~70_combout\ = (\inst|i\(19) & (!\inst|i[18]~69\)) # (!\inst|i\(19) & ((\inst|i[18]~69\) # (GND)))
-- \inst|i[19]~71\ = CARRY((!\inst|i[18]~69\) # (!\inst|i\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(19),
	datad => VCC,
	cin => \inst|i[18]~69\,
	combout => \inst|i[19]~70_combout\,
	cout => \inst|i[19]~71\);

-- Location: FF_X24_Y20_N7
\inst|i[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[19]~70_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(19));

-- Location: LCCOMB_X24_Y20_N8
\inst|i[20]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[20]~72_combout\ = (\inst|i\(20) & (\inst|i[19]~71\ $ (GND))) # (!\inst|i\(20) & (!\inst|i[19]~71\ & VCC))
-- \inst|i[20]~73\ = CARRY((\inst|i\(20) & !\inst|i[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(20),
	datad => VCC,
	cin => \inst|i[19]~71\,
	combout => \inst|i[20]~72_combout\,
	cout => \inst|i[20]~73\);

-- Location: FF_X24_Y20_N9
\inst|i[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[20]~72_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(20));

-- Location: LCCOMB_X24_Y20_N10
\inst|i[21]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[21]~74_combout\ = (\inst|i\(21) & (!\inst|i[20]~73\)) # (!\inst|i\(21) & ((\inst|i[20]~73\) # (GND)))
-- \inst|i[21]~75\ = CARRY((!\inst|i[20]~73\) # (!\inst|i\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(21),
	datad => VCC,
	cin => \inst|i[20]~73\,
	combout => \inst|i[21]~74_combout\,
	cout => \inst|i[21]~75\);

-- Location: FF_X24_Y20_N11
\inst|i[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[21]~74_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(21));

-- Location: LCCOMB_X24_Y20_N12
\inst|i[22]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[22]~76_combout\ = (\inst|i\(22) & (\inst|i[21]~75\ $ (GND))) # (!\inst|i\(22) & (!\inst|i[21]~75\ & VCC))
-- \inst|i[22]~77\ = CARRY((\inst|i\(22) & !\inst|i[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(22),
	datad => VCC,
	cin => \inst|i[21]~75\,
	combout => \inst|i[22]~76_combout\,
	cout => \inst|i[22]~77\);

-- Location: FF_X24_Y20_N13
\inst|i[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[22]~76_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(22));

-- Location: LCCOMB_X24_Y20_N14
\inst|i[23]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[23]~78_combout\ = (\inst|i\(23) & (!\inst|i[22]~77\)) # (!\inst|i\(23) & ((\inst|i[22]~77\) # (GND)))
-- \inst|i[23]~79\ = CARRY((!\inst|i[22]~77\) # (!\inst|i\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(23),
	datad => VCC,
	cin => \inst|i[22]~77\,
	combout => \inst|i[23]~78_combout\,
	cout => \inst|i[23]~79\);

-- Location: FF_X24_Y20_N15
\inst|i[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[23]~78_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(23));

-- Location: LCCOMB_X24_Y20_N16
\inst|i[24]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[24]~80_combout\ = (\inst|i\(24) & (\inst|i[23]~79\ $ (GND))) # (!\inst|i\(24) & (!\inst|i[23]~79\ & VCC))
-- \inst|i[24]~81\ = CARRY((\inst|i\(24) & !\inst|i[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(24),
	datad => VCC,
	cin => \inst|i[23]~79\,
	combout => \inst|i[24]~80_combout\,
	cout => \inst|i[24]~81\);

-- Location: FF_X24_Y20_N17
\inst|i[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[24]~80_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(24));

-- Location: LCCOMB_X24_Y20_N18
\inst|i[25]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[25]~82_combout\ = (\inst|i\(25) & (!\inst|i[24]~81\)) # (!\inst|i\(25) & ((\inst|i[24]~81\) # (GND)))
-- \inst|i[25]~83\ = CARRY((!\inst|i[24]~81\) # (!\inst|i\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(25),
	datad => VCC,
	cin => \inst|i[24]~81\,
	combout => \inst|i[25]~82_combout\,
	cout => \inst|i[25]~83\);

-- Location: FF_X24_Y20_N19
\inst|i[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[25]~82_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(25));

-- Location: LCCOMB_X24_Y20_N20
\inst|i[26]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[26]~84_combout\ = (\inst|i\(26) & (\inst|i[25]~83\ $ (GND))) # (!\inst|i\(26) & (!\inst|i[25]~83\ & VCC))
-- \inst|i[26]~85\ = CARRY((\inst|i\(26) & !\inst|i[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(26),
	datad => VCC,
	cin => \inst|i[25]~83\,
	combout => \inst|i[26]~84_combout\,
	cout => \inst|i[26]~85\);

-- Location: FF_X24_Y20_N21
\inst|i[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[26]~84_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(26));

-- Location: LCCOMB_X24_Y20_N22
\inst|i[27]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[27]~86_combout\ = (\inst|i\(27) & (!\inst|i[26]~85\)) # (!\inst|i\(27) & ((\inst|i[26]~85\) # (GND)))
-- \inst|i[27]~87\ = CARRY((!\inst|i[26]~85\) # (!\inst|i\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(27),
	datad => VCC,
	cin => \inst|i[26]~85\,
	combout => \inst|i[27]~86_combout\,
	cout => \inst|i[27]~87\);

-- Location: FF_X24_Y20_N23
\inst|i[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[27]~86_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(27));

-- Location: LCCOMB_X24_Y20_N24
\inst|i[28]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[28]~88_combout\ = (\inst|i\(28) & (\inst|i[27]~87\ $ (GND))) # (!\inst|i\(28) & (!\inst|i[27]~87\ & VCC))
-- \inst|i[28]~89\ = CARRY((\inst|i\(28) & !\inst|i[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(28),
	datad => VCC,
	cin => \inst|i[27]~87\,
	combout => \inst|i[28]~88_combout\,
	cout => \inst|i[28]~89\);

-- Location: FF_X24_Y20_N25
\inst|i[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[28]~88_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(28));

-- Location: LCCOMB_X24_Y20_N26
\inst|i[29]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[29]~90_combout\ = (\inst|i\(29) & (!\inst|i[28]~89\)) # (!\inst|i\(29) & ((\inst|i[28]~89\) # (GND)))
-- \inst|i[29]~91\ = CARRY((!\inst|i[28]~89\) # (!\inst|i\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(29),
	datad => VCC,
	cin => \inst|i[28]~89\,
	combout => \inst|i[29]~90_combout\,
	cout => \inst|i[29]~91\);

-- Location: FF_X24_Y20_N27
\inst|i[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[29]~90_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(29));

-- Location: LCCOMB_X25_Y23_N28
\inst|LessThan5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~0_combout\ = (!\inst|i\(27) & (!\inst|i\(28) & !\inst|i\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(27),
	datac => \inst|i\(28),
	datad => \inst|i\(29),
	combout => \inst|LessThan5~0_combout\);

-- Location: LCCOMB_X24_Y20_N28
\inst|i[30]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[30]~92_combout\ = (\inst|i\(30) & (\inst|i[29]~91\ $ (GND))) # (!\inst|i\(30) & (!\inst|i[29]~91\ & VCC))
-- \inst|i[30]~93\ = CARRY((\inst|i\(30) & !\inst|i[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(30),
	datad => VCC,
	cin => \inst|i[29]~91\,
	combout => \inst|i[30]~92_combout\,
	cout => \inst|i[30]~93\);

-- Location: FF_X24_Y20_N29
\inst|i[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[30]~92_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(30));

-- Location: LCCOMB_X24_Y20_N30
\inst|i[31]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|i[31]~94_combout\ = \inst|i\(31) $ (\inst|i[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(31),
	cin => \inst|i[30]~93\,
	combout => \inst|i[31]~94_combout\);

-- Location: FF_X24_Y20_N31
\inst|i[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst7|opt~clkctrl_outclk\,
	d => \inst|i[31]~94_combout\,
	sclr => \inst8|cout~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|i\(31));

-- Location: LCCOMB_X24_Y23_N28
\inst|sel_sig[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig[3]~1_combout\ = (!\inst|i\(9) & (\inst|i\(7) & !\inst|i\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(9),
	datac => \inst|i\(7),
	datad => \inst|i\(26),
	combout => \inst|sel_sig[3]~1_combout\);

-- Location: LCCOMB_X24_Y23_N10
\inst|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~1_combout\ = (!\inst|i\(15) & (!\inst|i\(14) & (!\inst|i\(16) & !\inst|i\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(15),
	datab => \inst|i\(14),
	datac => \inst|i\(16),
	datad => \inst|i\(17),
	combout => \inst|LessThan3~1_combout\);

-- Location: LCCOMB_X24_Y23_N0
\inst|LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~0_combout\ = (!\inst|i\(13) & (!\inst|i\(10) & (!\inst|i\(11) & !\inst|i\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(13),
	datab => \inst|i\(10),
	datac => \inst|i\(11),
	datad => \inst|i\(12),
	combout => \inst|LessThan3~0_combout\);

-- Location: LCCOMB_X24_Y23_N22
\inst|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~3_combout\ = (!\inst|i\(22) & (!\inst|i\(23) & (!\inst|i\(25) & !\inst|i\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(22),
	datab => \inst|i\(23),
	datac => \inst|i\(25),
	datad => \inst|i\(24),
	combout => \inst|LessThan3~3_combout\);

-- Location: LCCOMB_X24_Y23_N20
\inst|LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~2_combout\ = (!\inst|i\(19) & (!\inst|i\(18) & (!\inst|i\(21) & !\inst|i\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(19),
	datab => \inst|i\(18),
	datac => \inst|i\(21),
	datad => \inst|i\(20),
	combout => \inst|LessThan3~2_combout\);

-- Location: LCCOMB_X24_Y23_N8
\inst|LessThan3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~4_combout\ = (\inst|LessThan3~1_combout\ & (\inst|LessThan3~0_combout\ & (\inst|LessThan3~3_combout\ & \inst|LessThan3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan3~1_combout\,
	datab => \inst|LessThan3~0_combout\,
	datac => \inst|LessThan3~3_combout\,
	datad => \inst|LessThan3~2_combout\,
	combout => \inst|LessThan3~4_combout\);

-- Location: LCCOMB_X25_Y21_N2
\inst|sel_sig[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig[3]~2_combout\ = (\inst|i\(6) & (!\inst|i\(3) & (!\inst|i\(2) & !\inst|i\(1)))) # (!\inst|i\(6) & (\inst|i\(3) & ((\inst|i\(2)) # (\inst|i\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(6),
	datab => \inst|i\(3),
	datac => \inst|i\(2),
	datad => \inst|i\(1),
	combout => \inst|sel_sig[3]~2_combout\);

-- Location: LCCOMB_X25_Y21_N20
\inst|sel_sig[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig[3]~3_combout\ = (\inst|i\(5) & (((!\inst|i\(6))))) # (!\inst|i\(5) & ((\inst|i\(4) & ((\inst|sel_sig[3]~2_combout\))) # (!\inst|i\(4) & (\inst|i\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111000011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(5),
	datab => \inst|i\(4),
	datac => \inst|i\(6),
	datad => \inst|sel_sig[3]~2_combout\,
	combout => \inst|sel_sig[3]~3_combout\);

-- Location: LCCOMB_X24_Y23_N18
\inst|sel_sig[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig[3]~4_combout\ = (\inst|i\(8) & (\inst|sel_sig[3]~1_combout\ & (\inst|LessThan3~4_combout\ & \inst|sel_sig[3]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(8),
	datab => \inst|sel_sig[3]~1_combout\,
	datac => \inst|LessThan3~4_combout\,
	datad => \inst|sel_sig[3]~3_combout\,
	combout => \inst|sel_sig[3]~4_combout\);

-- Location: LCCOMB_X25_Y23_N12
\inst|always1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|always1~4_combout\ = ((\inst|i\(31)) # ((\inst|i\(30)) # (!\inst|sel_sig[3]~4_combout\))) # (!\inst|LessThan5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan5~0_combout\,
	datab => \inst|i\(31),
	datac => \inst|i\(30),
	datad => \inst|sel_sig[3]~4_combout\,
	combout => \inst|always1~4_combout\);

-- Location: LCCOMB_X24_Y23_N6
\inst|LessThan5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~1_combout\ = (!\inst|i\(9) & (!\inst|i\(26) & (\inst|LessThan3~4_combout\ & \inst|LessThan5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(9),
	datab => \inst|i\(26),
	datac => \inst|LessThan3~4_combout\,
	datad => \inst|LessThan5~0_combout\,
	combout => \inst|LessThan5~1_combout\);

-- Location: LCCOMB_X24_Y23_N16
\inst|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan1~0_combout\ = (!\inst|i\(8) & (!\inst|i\(26) & (\inst|LessThan3~4_combout\ & !\inst|i\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(8),
	datab => \inst|i\(26),
	datac => \inst|LessThan3~4_combout\,
	datad => \inst|i\(9),
	combout => \inst|LessThan1~0_combout\);

-- Location: LCCOMB_X25_Y23_N14
\inst|always1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|always1~0_combout\ = (\inst|i\(4) & (((\inst|i\(2) & \inst|i\(3))) # (!\inst|i\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(4),
	datab => \inst|i\(2),
	datac => \inst|i\(3),
	datad => \inst|i\(6),
	combout => \inst|always1~0_combout\);

-- Location: LCCOMB_X25_Y21_N0
\inst|LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan2~0_combout\ = (\inst|i\(0) & (\inst|i\(3) & (\inst|i\(2) & \inst|i\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(0),
	datab => \inst|i\(3),
	datac => \inst|i\(2),
	datad => \inst|i\(1),
	combout => \inst|LessThan2~0_combout\);

-- Location: LCCOMB_X25_Y23_N24
\inst|always1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|always1~1_combout\ = (\inst|i\(5)) # ((\inst|always1~0_combout\) # ((!\inst|i\(6) & \inst|LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(6),
	datab => \inst|i\(5),
	datac => \inst|always1~0_combout\,
	datad => \inst|LessThan2~0_combout\,
	combout => \inst|always1~1_combout\);

-- Location: LCCOMB_X25_Y23_N18
\inst|always1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|always1~2_combout\ = (\inst|i\(6) & ((\inst|i\(8)) # ((\inst|i\(7) & \inst|always1~1_combout\)))) # (!\inst|i\(6) & (\inst|i\(8) & ((\inst|i\(7)) # (\inst|always1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(6),
	datab => \inst|i\(7),
	datac => \inst|i\(8),
	datad => \inst|always1~1_combout\,
	combout => \inst|always1~2_combout\);

-- Location: LCCOMB_X25_Y23_N8
\inst|always1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|always1~3_combout\ = (\inst|LessThan5~1_combout\ & ((\inst|always1~2_combout\ & (!\inst|i\(8))) # (!\inst|always1~2_combout\ & ((!\inst|LessThan1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(8),
	datab => \inst|LessThan5~1_combout\,
	datac => \inst|LessThan1~0_combout\,
	datad => \inst|always1~2_combout\,
	combout => \inst|always1~3_combout\);

-- Location: LCCOMB_X25_Y23_N22
\inst|LessThan6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan6~0_combout\ = (\inst|i\(3) & ((\inst|i\(1)) # ((\inst|i\(0)) # (\inst|i\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(3),
	datab => \inst|i\(1),
	datac => \inst|i\(0),
	datad => \inst|i\(2),
	combout => \inst|LessThan6~0_combout\);

-- Location: LCCOMB_X25_Y23_N0
\inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~0_combout\ = ((\inst|i\(5) & ((\inst|i\(4)) # (\inst|LessThan6~0_combout\)))) # (!\inst|LessThan5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(4),
	datab => \inst|i\(5),
	datac => \inst|LessThan6~0_combout\,
	datad => \inst|LessThan5~0_combout\,
	combout => \inst|LessThan0~0_combout\);

-- Location: LCCOMB_X24_Y23_N26
\inst|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan0~1_combout\ = (\inst|i\(6)) # ((\inst|i\(7)) # ((\inst|LessThan0~0_combout\) # (!\inst|LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(6),
	datab => \inst|i\(7),
	datac => \inst|LessThan0~0_combout\,
	datad => \inst|LessThan1~0_combout\,
	combout => \inst|LessThan0~1_combout\);

-- Location: LCCOMB_X25_Y23_N10
\inst|sel_sig~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig~0_combout\ = (\inst|i\(31)) # ((!\inst|i\(30) & ((\inst|always1~3_combout\) # (!\inst|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(30),
	datab => \inst|i\(31),
	datac => \inst|always1~3_combout\,
	datad => \inst|LessThan0~1_combout\,
	combout => \inst|sel_sig~0_combout\);

-- Location: LCCOMB_X25_Y23_N16
\inst|sel_sig~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig~5_combout\ = (!\inst|always1~4_combout\ & !\inst|sel_sig~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|always1~4_combout\,
	datad => \inst|sel_sig~0_combout\,
	combout => \inst|sel_sig~5_combout\);

-- Location: LCCOMB_X25_Y21_N26
\inst|LessThan5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~2_combout\ = (((!\inst|i\(5)) # (!\inst|i\(8))) # (!\inst|i\(7))) # (!\inst|i\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(6),
	datab => \inst|i\(7),
	datac => \inst|i\(8),
	datad => \inst|i\(5),
	combout => \inst|LessThan5~2_combout\);

-- Location: LCCOMB_X25_Y21_N24
\inst|LessThan5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~3_combout\ = (!\inst|i\(3) & (((!\inst|i\(0) & !\inst|i\(1))) # (!\inst|i\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(0),
	datab => \inst|i\(3),
	datac => \inst|i\(2),
	datad => \inst|i\(1),
	combout => \inst|LessThan5~3_combout\);

-- Location: LCCOMB_X24_Y23_N4
\inst|LessThan5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan5~4_combout\ = (\inst|LessThan5~1_combout\ & ((\inst|LessThan5~2_combout\) # ((!\inst|i\(4) & \inst|LessThan5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan5~1_combout\,
	datab => \inst|i\(4),
	datac => \inst|LessThan5~2_combout\,
	datad => \inst|LessThan5~3_combout\,
	combout => \inst|LessThan5~4_combout\);

-- Location: LCCOMB_X24_Y23_N2
\inst|LessThan6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan6~1_combout\ = (\inst|i\(8)) # ((\inst|i\(7)) # ((\inst|i\(5)) # (\inst|i\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(8),
	datab => \inst|i\(7),
	datac => \inst|i\(5),
	datad => \inst|i\(6),
	combout => \inst|LessThan6~1_combout\);

-- Location: LCCOMB_X24_Y23_N12
\inst|LessThan6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan6~2_combout\ = (\inst|i\(9) & ((\inst|i\(4)) # ((\inst|LessThan6~0_combout\) # (\inst|LessThan6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(9),
	datab => \inst|i\(4),
	datac => \inst|LessThan6~0_combout\,
	datad => \inst|LessThan6~1_combout\,
	combout => \inst|LessThan6~2_combout\);

-- Location: LCCOMB_X24_Y23_N30
\inst|LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|LessThan3~5_combout\ = (!\inst|i\(26) & \inst|LessThan3~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|i\(26),
	datac => \inst|LessThan3~4_combout\,
	combout => \inst|LessThan3~5_combout\);

-- Location: LCCOMB_X24_Y23_N24
\inst|sel_sig[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig[3]~6_combout\ = ((!\inst|sel_sig[3]~4_combout\ & ((\inst|LessThan6~2_combout\) # (!\inst|LessThan3~5_combout\)))) # (!\inst|LessThan5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan6~2_combout\,
	datab => \inst|LessThan5~0_combout\,
	datac => \inst|LessThan3~5_combout\,
	datad => \inst|sel_sig[3]~4_combout\,
	combout => \inst|sel_sig[3]~6_combout\);

-- Location: LCCOMB_X24_Y23_N14
\inst|sel_sig[3]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig[3]~10_combout\ = (\inst|LessThan0~1_combout\ & ((\inst|LessThan5~4_combout\ & (!\inst|sel_sig[3]~4_combout\)) # (!\inst|LessThan5~4_combout\ & ((\inst|sel_sig[3]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|LessThan0~1_combout\,
	datab => \inst|sel_sig[3]~4_combout\,
	datac => \inst|LessThan5~4_combout\,
	datad => \inst|sel_sig[3]~6_combout\,
	combout => \inst|sel_sig[3]~10_combout\);

-- Location: LCCOMB_X25_Y23_N26
\inst|sel_sig[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig[3]~11_combout\ = (\inst|i\(31)) # ((!\inst|i\(30) & ((\inst|always1~3_combout\) # (!\inst|sel_sig[3]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(30),
	datab => \inst|i\(31),
	datac => \inst|always1~3_combout\,
	datad => \inst|sel_sig[3]~10_combout\,
	combout => \inst|sel_sig[3]~11_combout\);

-- Location: FF_X25_Y23_N17
\inst|sel_sig[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \V_cmp_sig~input_o\,
	d => \inst|sel_sig~5_combout\,
	ena => \inst|sel_sig[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sel_sig\(3));

-- Location: LCCOMB_X25_Y23_N30
\inst|sel_sig~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig~7_combout\ = (\inst|always1~4_combout\ & !\inst|sel_sig~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|always1~4_combout\,
	datad => \inst|sel_sig~0_combout\,
	combout => \inst|sel_sig~7_combout\);

-- Location: FF_X25_Y23_N31
\inst|sel_sig[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \V_cmp_sig~input_o\,
	d => \inst|sel_sig~7_combout\,
	ena => \inst|sel_sig[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sel_sig\(2));

-- Location: LCCOMB_X25_Y23_N20
\inst|sel_sig~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig~8_combout\ = (!\inst|i\(30) & (!\inst|i\(31) & (\inst|always1~3_combout\ & \inst|LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(30),
	datab => \inst|i\(31),
	datac => \inst|always1~3_combout\,
	datad => \inst|LessThan0~1_combout\,
	combout => \inst|sel_sig~8_combout\);

-- Location: FF_X25_Y23_N21
\inst|sel_sig[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \V_cmp_sig~input_o\,
	d => \inst|sel_sig~8_combout\,
	ena => \inst|sel_sig[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sel_sig\(1));

-- Location: LCCOMB_X25_Y23_N6
\inst|sel_sig~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sel_sig~9_combout\ = (\inst|i\(31)) # ((!\inst|i\(30) & !\inst|LessThan0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|i\(30),
	datab => \inst|i\(31),
	datad => \inst|LessThan0~1_combout\,
	combout => \inst|sel_sig~9_combout\);

-- Location: FF_X25_Y23_N7
\inst|sel_sig[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \V_cmp_sig~input_o\,
	d => \inst|sel_sig~9_combout\,
	ena => \inst|sel_sig[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sel_sig\(0));

ww_data(7) <= \data[7]~output_o\;

ww_data(6) <= \data[6]~output_o\;

ww_data(5) <= \data[5]~output_o\;

ww_data(4) <= \data[4]~output_o\;

ww_data(3) <= \data[3]~output_o\;

ww_data(2) <= \data[2]~output_o\;

ww_data(1) <= \data[1]~output_o\;

ww_data(0) <= \data[0]~output_o\;

ww_sel_f(3) <= \sel_f[3]~output_o\;

ww_sel_f(2) <= \sel_f[2]~output_o\;

ww_sel_f(1) <= \sel_f[1]~output_o\;

ww_sel_f(0) <= \sel_f[0]~output_o\;

ww_sel_mode(1) <= \sel_mode[1]~output_o\;

ww_sel_mode(0) <= \sel_mode[0]~output_o\;

ww_sel_led(3) <= \sel_led[3]~output_o\;

ww_sel_led(2) <= \sel_led[2]~output_o\;

ww_sel_led(1) <= \sel_led[1]~output_o\;

ww_sel_led(0) <= \sel_led[0]~output_o\;
END structure;


