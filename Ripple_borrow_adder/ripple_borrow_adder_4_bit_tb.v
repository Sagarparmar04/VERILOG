module ripple_borrow_adder_4_bit_tb;

//port direction
reg [3:0]a;//input port
reg [3:0]b;//input port
reg b_in;//input port
wire borrow;//output port
wire [3:0]diff;//output port

//dut
ripple_borrow_adder_4_bit dut(.a(a),
															.b(b),
															.b_in(b_in),
															.diff(diff),
															.borrow(borrow));
						 
		//initialization
			initial begin
				a=4'd0; b=4'd0; b_in=1'd0;
				#10;
				a=4'd0; b=4'd0; b_in=1'd1;
				#10;
				a=4'd0; b=4'd1; b_in=1'd0;
				#10;
				a=4'd0; b=4'd1; b_in=1'd1;
				#10;
				a=4'd1; b=4'd0; b_in=1'd0;
				#10;
				a=4'd1; b=4'd0; b_in=1'd1;
				#10;
				a=4'd1; b=4'd1; b_in=1'd0;
				#10;
				a=4'd1; b=4'd1; b_in=1'd1;
				#10;
				a=4'dx; b=4'dx; b_in=1'dx;
				#10;
				a=4'dx; b=4'dx; b_in=1'd0;
				#10;
				a=4'dx; b=4'd0; b_in=1'd0;
				#10;
				a=4'd0; b=4'd0; b_in=1'dx;
				#10;
				a=4'd0; b=4'dx; b_in=1'dx;
				#10;
				a=4'd0; b=4'dx; b_in=1'd0;
				#10;
				$finish;//terminate the program
			end

endmodule