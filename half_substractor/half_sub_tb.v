module half_sub_tb;

//port direction
reg a,b;//input port
wire diff,borrow;//output port

//dut
half_sub dut(.a(a),
	     .b(b),
	     .diff(diff),
	     .borrow(borrow));
						 
		//initialization
			initial begin
				a=0; b=0;
				#10;
				a=0; b=1;
				#10;
				a=1; b=0;
				#10;
				a=1; b=1;
				#10;
				a=1'bx; b=1'bx;
				#10;
				a=1'bx; b=0;
				#10;
				a=0; b=1'bx;
				#10;
				$finish;//terminate the program
			end

endmodule
