//port declaration and create a module
module ripple_borrow_adder_4_bit(a,b,b_in,diff,borrow);

//port direction
input [3:0]a;//input port
input [3:0]b;//input port
input b_in;//input port
output borrow;//output port
output [3:0]diff;//output port
wire [2:0]b1;//take as a wire

//intiation
full_sub fa1(.diff(diff[0]),.borrow(b1[0]),.a(a[0]),.b(b[0]),.c(b_in));
full_sub fa2(.diff(diff[1]),.borrow(b1[1]),.a(a[1]),.b(b[1]),.c(b1[0]));
full_sub fa3(.diff(diff[2]),.borrow(b1[2]),.a(a[2]),.b(b[2]),.c(b1[1]));
full_sub fa4(.diff(diff[3]),.borrow(borrow),.a(a[3]),.b(b[3]),.c(b1[2]));

endmodule