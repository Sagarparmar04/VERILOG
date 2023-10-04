//------------module for testbench----------------
module csa_tb();
	//-----------port direction---------------
	//------input port-------
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
	//------output port-------
  wire [3:0] SUM;
  wire CARRY;  
	//------port-------
  integer i,j;
	
	//dut	
  csa dut(.A(A),.B(B),.Cin(Cin),.SUM(SUM),.CARRY(CARRY));
	
	//-----------task for monitor----------------
	task monitor();
		$monitor("--A=%0b--:--B=%0b--:--Cin=%0b--:--SUM=%0b--:--CARRY=%0b",A,B,Cin,SUM,CARRY);
	endtask
	
	//-----------------------------------------
    initial begin
			monitor();
			A = 0;	B = 0;	Cin = 0;

      for(i=0;i<10;i=i+1) begin
            for(j=0;j<10;j=j+1) begin
                 A = i;
                 B = j;
                 #10;
            end  
						$stop; //terminate the loop
      end
			
      Cin = 1; 

      for(i=0;i<10;i=i+1) begin
            for(j=0;j<10;j=j+1) begin
                 A = i;
                 B = j;
                 #10;
            end 
						$stop;	//terminate the loop
      end 
			$finish; //terminate the program
   end
    
endmodule : csa_tb