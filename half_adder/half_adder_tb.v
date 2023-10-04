module half_adder_tb;

//port direction
reg a,b; //input
wire sum,carry; //output

//dut
half_adder dut(.a(a),.b(b),.sum(sum),.carry(carry));

//task for monitor
task monitor();
	$monitor("a=%0d,b=%0d,sum=%0d,carry=%0d",a,b,sum,carry);
endtask

//initialization
	initial begin
		monitor();
		a=1'b0; b=1'b0;
		#10;
		a=1'b1; b=1'b0;
		#10;
		a=1'b0; b=1'b1;
		#10;
		a=1'b1; b=1'b1;
		#10;
		a=1'bx; b=1'bx;
		#10;
		a=1'bx; b=1'b0;
		#10;
		a=1'b0; b=1'bx;
		#10;
		$finish;
	end

endmodule
