//port declaration and create a module
module full_use_half_sub(a,b,c,diff,borrow);

//port direction
input a,b,c;//input port
output diff,borrow;//output port
wire d,b1,b2;//wire 
wire p,q;//wire

//initialization
half_sub h1(.a(a),.b(b),.diff(d),.borrow(b1));
half_sub h2(.a(c),.b(d),.diff(diff),.borrow(b2));
or o1(borrow,b1,b2);


endmodule