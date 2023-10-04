module cla_tb;
	//port direction
	
	//input port
  reg [3:0]a;
	reg [3:0]b;	
  reg cin;
	
	//output port
  wire [3:0]sum;
  wire carry;
  
	//dut
  cla dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
  
	//task for monitor
	task monitor();
		$monitor("a=%0b : b=%0b, cin=%0b ------:------ sum=%0b,carry=%0b", a, b, cin, sum, carry);
	endtask
	
	//-----------
  initial begin
		monitor();
    a = 4'd1; b = 4'd0; cin = 1'd0;
		#10;
    a = 4'd2; b = 4'd4; cin = 1'd1;
		#15;
    a = 4'hb; b = 4'h6; cin = 1'd0;
		#20;
    a = 4'd5; b = 4'd3; cin = 1'd1;
		#30;
    a = 4'd8; b = 4'd9; cin = 1'd0;
		#5;
    a = 4'ha; b = 4'hc; cin = 1'd1;
		#10;
    a = 4'd3; b = 4'd3; cin = 1'd0;
		#15;
    a = 4'd1; b = 4'd1; cin = 1'd1;
		$finish;
  end
endmodule