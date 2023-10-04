//external port declaration and create a module
module half_adder(a,b,sum,carry);

//port direction
input a,b; //input
output sum,carry;//output

//gate level modeling
xor x1(sum,a,b); //sum
and a1(carry,a,b);//carry

//data flow level modeling
/* assign sum = a ^ b; //sum
assign carry = a & b; */  //carry

//behaviour modeling
/* always@(*) begin
	casex({a,b})
		2'b00 : begin sum = 1'b0; carry = 1'b0; end
		2'b10 : begin sum = 1'b1; carry = 1'b0; end
		2'b01 : begin sum = 1'b1; carry = 1'b0; end
		2'b11 : begin sum = 1'b0; carry = 1'b1; end
	endcase
end */


endmodule