module b_to_g_tb;
//port direction
	reg [3:0]binary;
	wire[3:0]gray;
	
	//dut
	b_to_g dut(.gray(gray),.binary(binary));
	
	//task for monitor
	task monitor();
		$monitor("gray=%0b,binary=%0b",gray,binary);
	endtask
	
	//initilization
	initial begin
	    	monitor();
		repeat(10)begin
		#10 binary = $random;
		end
		#10;
		$finish;
	end
endmodule 
