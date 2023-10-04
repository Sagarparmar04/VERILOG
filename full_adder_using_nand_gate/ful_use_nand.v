//port declaration and create a module
module ful_use_nand (a,b,c,sum,carry);

//port direction
input a,b,c;
output sum,carry;
wire [6:0]p;

//gate level modeling
nand n1(p[0],a,b);
nand n2(p[1],a,p[0]);
nand n3(p[2],b,p[0]);
nand n4(p[3],p[1],p[2]);
nand n5(p[4],p[3],c);
nand n6(p[5],p[4],p[3]);
nand n7(p[6],p[4],c);
nand n8(sum,p[5],p[6]);
nand n9(carry,p[0],p[4]);

endmodule