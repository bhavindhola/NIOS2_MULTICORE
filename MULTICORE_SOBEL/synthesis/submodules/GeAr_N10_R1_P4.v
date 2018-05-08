/*
 * \file GeAr_N10_R1_P4.v 
 * \author Jorge Castro-Godinez <jorge.castro-godinez@kit.edu>
 * Chair for Embedded Systems (CES)
 * Karlsruhe Institute of Technology (KIT), Germany
 * Prof. Dr. Joerg Henkel
 *
 * \brief Verilog implementation of the Generic Accuracy Configurable (GeAr)
 * adder, for 10 bits, R = 1 and P = 4 (k = 6)
 *
 * Reference: Muhammad Shafique, Waqas Ahmad, Rehan Hafiz, and Jörg Henkel.
 * 2015. A low latency generic accuracy configurable adder. In Proceedings of 
 * the 52nd Annual Design Automation Conference (DAC '15). ACM, New York, NY, 
 * USA.
 *
 */

module GeAr_N10_R1_P4(
		input [9:0] in1, 
		input [9:0] in2,
		output [9:0] out
	);

	wire [4:0] subAdder0, subAdder1, subAdder2, subAdder3, subAdder4, subAdder5;
	wire co0,co1,co2,co3,co4,co5;

	subAdder_R1_P4 SA0 (in1[4:0],in2[4:0],subAdder0[4:0],co0);
	subAdder_R1_P4 SA1 (in1[5:1],in2[5:1],subAdder1[4:0],co1);
	subAdder_R1_P4 SA2 (in1[6:2],in2[6:2],subAdder2[4:0],co2);
	subAdder_R1_P4 SA3 (in1[7:3],in2[7:3],subAdder3[4:0],co3);
	subAdder_R1_P4 SA4 (in1[8:4],in2[8:4],subAdder4[4:0],co3);
	subAdder_R1_P4 SA5 (in1[9:5],in2[9:5],subAdder5[4:0],co3);

	assign out[9:0] = {subAdder5[4],subAdder4[4],subAdder3[4],subAdder2[4],subAdder1[4],subAdder0[4:0]};
endmodule
