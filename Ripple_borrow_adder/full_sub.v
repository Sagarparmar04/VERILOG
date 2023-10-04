//port declaration and create a module
module full_sub(a,b,c,diff,borrow);

//port direction
input a,b,c;//input port
output diff,borrow;//output port
wire [4:0]p;//additional wire

//gate level modeling
xor x1(p[0],a,b);
xor x2(diff,p[0],c);
not n1(p[1],a);
and a1(p[2],p[1],c);
and a2(p[3],p[1],b);
and a3(p[4],b,c);
or o1(borrow,p[2],p[3],p[4]);

//data flow level modeling
/* assign diff = a ^ b ^ c;
assign borrow = (~a)& c | (~a)& b | b&c; */

endmodule