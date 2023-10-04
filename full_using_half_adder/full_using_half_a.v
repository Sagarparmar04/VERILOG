//port declaration and create a module
module full_using_half_a(a,b,c,sum,carry);

//port direction
input a,b,c; //input
output sum,carry; //output
wire s; //wire
wire c1,c2; //wire

//instentiate half_adder
half_adder ha1(.sum(s),.carry(c1),.a(a),.b(b));
half_adder ha2(.sum(sum),.carry(c2),.a(s),.b(c));
or o1(carry,c1,c2);

//gate level modeling
//xor x1(s,a,b);
//xor x2(sum,s,c);
//and a1(c1,a,b);
//and a2(c2,s,c);
//or o1(carry,c1,c2);

endmodule