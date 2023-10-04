module haf_use_nand_tb;

//port direction
reg a,b;
wire sum,carry;

//dut
haf_use_nand dut(.a(a),.b(b),.sum(sum),.carry(carry));

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
