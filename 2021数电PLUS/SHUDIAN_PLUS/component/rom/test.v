// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Full Version"
// CREATED		"Thu Jul 08 20:29:45 2021"

module test(
	Tclk,
	mode,
	cout,
	o
);


input wire	Tclk;
input wire	[1:0] mode;
output wire	cout;
output wire	[7:0] o;

wire	[3:0] n;
wire	SYNTHESIZED_WIRE_0;





romtatal	b2v_inst(
	.clk(SYNTHESIZED_WIRE_0),
	.choose(mode),
	.cout(cout),
	.otp(o));


n_divider	b2v_inst3(
	.clk(Tclk),
	.n(n),
	.opt(SYNTHESIZED_WIRE_0));





assign	n[1] = 0;
assign	n[2] = 0;
assign	n[3] = 0;
assign	n[0] = 0;

endmodule
