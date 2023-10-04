//------------module for testbench----------------
module carry_skip_adder_tb();
//-----------port direction---------------
//------input port-------
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
//------output port-------
  wire [3:0] SUM;
  wire CARRY;
	
//dut	
  carry_skip_adder dut(.A(A),.B(B),.Cin(Cin),.SUM(SUM),.CARRY(CARRY));
	
//-----------task for monitor----------------
	task monitor();
		$monitor("--A=%0b--:--B=%0b--:--Cin=%0b--:--SUM=%0b--:--CARRY=%0b",A,B,Cin,SUM,CARRY);
	endtask

//-------------------------------------------	
initial begin 
  monitor();
	A = 4'b1010; B = 4'b0100; Cin = 1'b1;
	#10;
	A = 4'b1010; B = 4'b0101; Cin = 1'b1; 
	#10;
	A = 4'b1010; B = 4'b1101; Cin = 1'b0; 
	#10;
	A = 4'b1010; B = 4'b1111; Cin = 1'b0; 
	#10;
	A = 4'b1110; B = 4'b0100; Cin = 1'b1; 
	#10;
	A = 4'b1011; B = 4'b0101; Cin = 1'b1; 
	#10;
	A = 4'b1000; B = 4'b1101; Cin = 1'b0; 
	#10;
	A = 4'b0010; B = 4'b1111; Cin = 1'b0; 
	#10;
	$finish;
end
endmodule : carry_skip_adder_tb