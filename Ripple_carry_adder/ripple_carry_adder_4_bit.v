//port declaration and create a module
module ripple_carry_adder_4_bit(a,b,c_in,sum,carry);

//port direction
input [3:0]a;//input port
input [3:0]b;//input port
input c_in;//input port
output carry;//output port
output [3:0]sum;//output port
wire [2:0]c;//take as a wire

//intiation
full_adder fa1(.sum(sum[0]),.carry(c[0]),.a(a[0]),.b(b[0]),.c(c_in));
full_adder fa2(.sum(sum[1]),.carry(c[1]),.a(a[1]),.b(b[1]),.c(c[0]));
full_adder fa3(.sum(sum[2]),.carry(c[2]),.a(a[2]),.b(b[2]),.c(c[1]));
full_adder fa4(.sum(sum[3]),.carry(carry),.a(a[3]),.b(b[3]),.c(c[2]));

endmodule