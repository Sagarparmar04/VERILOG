//port declaration and create a module for rtl
module half_sub(a,b,diff,borrow);

//port direction
input a,b;//input port
output diff,borrow;//output port
wire p;

//gate level modeling
xor x1(diff,a,b);
not n1(p,a);
and a1(borrow,p,b);

//data flow level modeling
/* assign diff = a ^ b;
assign borrow = (~a) & b;
 */
endmodule