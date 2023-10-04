module full_use_half_sub_tb;

//port direction
reg a,b,c;//input port
wire diff,borrow;//output port

//dut
full_use_half_sub dut(.a(a),
		      .b(b),
		      .c(c),
		      .diff(diff),
		      .borrow(borrow));
						 
		//initialization
			initial begin
				a=0; b=0; c=0;
				#10;
				a=0; b=0; c=1;
				#10;
				a=0; b=1; c=0;
				#10;
				a=0; b=1; c=1;
				#10;
				a=1; b=0; c=0;
				#10;
				a=1; b=0; c=1;
				#10;
				a=1; b=1; c=0;
				#10;
				a=1; b=1; c=1;
				#10;
				a=1'bx; b=1'bx; c=1'bx;
				#10;
				a=1'bx; b=1'bx; c=0;
				#10;
				a=1'bx; b=0; c=0;
				#10;
				a=0; b=0; c=1'bx;
				#10;
				a=0; b=1'bx; c=1'bx;
				#10;
				a=0; b=1'bx; c=0;
				#10;
				$finish;//terminate the program
			end

endmodule
