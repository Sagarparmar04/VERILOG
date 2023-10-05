module g_to_b_tb;
//port direction
	reg [3:0]gray;
	wire[3:0]binary;
	
	//dut
	g_to_b dut(.gray(gray),.binary(binary));
	
	//task for monitor
	task monitor();
		$monitor("gray=%0b,binary=%0b",gray,binary);
	endtask
	
	//initilization
	initial begin
	monitor();
     repeat(10)begin
        #10 gray = $random;
     end
     #100;
     $finish;
	end
	       
endmodule 