/*
 * \file subAdder_R1_P4.v 
 * \author Jorge Castro-Godinez <jorge.castro-godinez@kit.edu>
 * Chair for Embedded Systems (CES)
 * Karlsruhe Institute of Technology (KIT), Germany
 * Prof. Dr. Joerg Henkel
 *
 * \brief Verilog implementation of a sub adder for the Generic Accuracy Configurable (GeAr)
 * adder. Configuration: R = 1 and P = 4.
 *
 * Reference: Muhammad Shafique, Waqas Ahmad, Rehan Hafiz, and Jörg Henkel.
 * 2015. A low latency generic accuracy configurable adder. In Proceedings of 
 * the 52nd Annual Design Automation Conference (DAC '15). ACM, New York, NY, 
 * USA.
 *
 */

module subAdder_R1_P4 (
		input [4:0] in1, 
		input [4:0] in2,
		output [4:0] out,
		output co
	);
	
	wire c0,c1,c2,c3,c4;

	fullAdder FA0(in1[0],in2[0],1'b0,out[0],c0);
	fullAdder FA1(in1[1],in2[1],c0,out[1],c1);
	fullAdder FA2(in1[2],in2[2],c1,out[2],c2);
	fullAdder FA3(in1[3],in2[3],c2,out[3],c3);
	fullAdder FA4(in1[4],in2[4],c3,out[4],c4);

	assign co = c4;
endmodule
