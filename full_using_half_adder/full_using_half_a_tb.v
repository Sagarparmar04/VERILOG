module full_using_half_a_tb;

//port direction
reg a,b,c; //input
wire sum,carry;//output

//dut
full_using_half_a dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));

//task for monitor
task monitor();
	$monitor("a=%0d,b=%0d,c=%0d,sum=%0d,carry=%0d",a,b,c,sum,carry);
endtask

//initialization
	initial begin
		monitor();
		a=1'b0; b=1'b0; c=1'b0;
		#10;
		a=1'b0; b=1'b0; c=1'b1;
		#10;
		a=1'b0; b=1'b1; c=1'b0;
		#10;
		a=1'b0; b=1'b1; c=1'b1;
		#10;
		a=1'b1; b=1'b0; c=1'b0;
    		#10;
		a=1'b1; b=1'b0; c=1'b1;
		#10;
		a=1'b1; b=1'b1; c=1'b0;
		#10;
		a=1'b1; b=1'b1; c=1'b1;
		#10;
		a=1'bx; b=1'bx; c=1'bx;
		#10;
		a=1'bx; b=1'bx; c=1'b0;
		#10;
		a=1'bx; b=1'b0; c=1'b0;
		#10;
		a=1'b0; b=1'b0; c=1'bx;
		#10;
		a=1'b0; b=1'bx; c=1'bx;
		#10;
		a=1'b0; b=1'bx; c=1'b0;
		#10;
		$finish;
	end
endmodule	
