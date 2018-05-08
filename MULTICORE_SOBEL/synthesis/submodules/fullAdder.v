/*
 * \file fullAdder.v 
 * \author Jorge Castro-Godinez <jorge.castro-godinez@kit.edu>
 * Chair for Embedded Systems (CES)
 * Karlsruhe Institute of Technology (KIT), Germany
 * Prof. Dr. Joerg Henkel
 *
 * \brief Verilog implementation of a full adder, with additional output of the propagation signal.
 */

module fullAdder (
		input a, 
		input b,
		input ci,
		output s,
		output co
	);

	wire g,p;

	// propagation signal
	xor (p,a,b);
	// generation signal
	and (g,a,b);

	// sum calculation
	assign s = p ^ ci;
	//carry output array calculation
	assign co = g | (p & ci);
endmodule
