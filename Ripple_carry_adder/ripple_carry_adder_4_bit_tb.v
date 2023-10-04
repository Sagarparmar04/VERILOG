module ripple_carry_adder_4_bit_tb;

//port direction
reg [3:0]a;//input
reg [3:0]b;//input
reg c_in; //input 
wire [3:0]sum;//output
wire carry; //output

//dut
ripple_carry_adder_4_bit dut(.a(a),.b(b),.c_in(c_in),.sum(sum),.carry(carry));

//task for monitor
task monitor();
	$monitor("a=%0d,b=%0d,c_in=%0d,sum=%0d,carry=%0d",a,b,c_in,sum,carry);
endtask

//initialization
	initial begin
		monitor();
		a=4'b0000; b=4'b0000; c_in=1'b0;
		#10;
		a=4'b0001; b=4'b0001; c_in=1'b0;
		#10;
		a=4'b0010; b=4'b0010; c_in=1'b1;
		#10;
		a=4'b0110; b=4'b0011; c_in=1'b1;
		#10;
		a=4'b1010; b=4'b0111; c_in=1'b1;
		#10;
		a=4'b1110; b=4'b0111; c_in=1'b1;
		#10;
		a=4'b0111; b=4'b1111; c_in=1'b1;
		#10;
		a=4'b0011; b=4'b0100; c_in=1'b1;
		#10;
		a=4'b0101; b=4'b0101; c_in=1'b1;
		#10;
		$finish;
	end
endmodule