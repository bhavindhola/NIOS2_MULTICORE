module sobel(dataa,datab,output);



input [31:0] dataa;

input [31:0] datab,
output[31:0] out;




	
	always @* begin
	gx <= (dataa<<1) - (datab<<1) ;
	
   

	 endmodule


	
