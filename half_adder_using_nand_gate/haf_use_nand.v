//port declaration and create a module
module haf_use_nand(a,b,sum,carry);

//port direction
input a,b; //input
output sum,carry; //output
wire [2:0]p; //wire

//gate level modeling
nand n1(p[0],a,b);
nand n2(p[1],a,p[0]);
nand n3(p[2],b,p[0]);
nand n4(sum,p[1],p[2]);
nand n5(carry,p[0]);

endmodule