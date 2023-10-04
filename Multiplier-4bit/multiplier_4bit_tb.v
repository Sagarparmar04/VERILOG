module multiplier_4bit_tb;
	//-------------port direction-----------
	//-----input--------
	reg [3:0]A,B;
	//-----output-------
	wire [7:0]P;
	
	//task for monitor
	task monitor();
		$display("-----A=%0d----:---B=%0d----:---P=%0d---",A,B,P);
	endtask
	//dut
	multiplier_4bit dut(.A(A),.B(B),.P(P));
  	initial begin 
		monitor();
  		A=4'd5;  B=4'd11;
		#10;
  		A=4'd7;  B=4'd15;
		#10;
  		A=4'd10; B=4'd12;
		#10;
  		A=4'd13; B=4'd2;
  		#10;
		A=4'd10; B=4'd5;
  		#10;
		A=4'd10; B=4'd4;
		#25;	
  		$finish;	
  	end 
endmodule : multiplier_4bit_tb
