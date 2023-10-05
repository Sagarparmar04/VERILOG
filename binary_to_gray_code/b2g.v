module b_to_g(gray,binary);
//port direction
	input [3:0]binary;
	output reg[3:0]gray;
	integer i;
	
	//data flow modeling
always@(*)
   begin
    gray[3]=binary[3];
    for(i=2;i>=0;i=i-1)
     begin
      gray[i] = binary[i+1] ^ binary[i];
     end
   end
	
endmodule