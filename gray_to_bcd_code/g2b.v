module g_to_b(gray,binary);
//port direction
	input [3:0]gray;
	output reg [3:0]binary;
	integer i;
	
	//data flow modeling
//  assign binary[0] = gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
//  assign binary[1] = gray[3] ^ gray[2] ^ gray[1];
//  assign binary[2] = gray[3] ^ gray[2];
//  assign binary[3] = gray[3];

always@(*)begin
    binary[3] = gray[3];
    for(i=2;i>=0;i=i-1)begin
        binary[i] = binary[i+1] ^ gray[i];
    end
end
	
endmodule