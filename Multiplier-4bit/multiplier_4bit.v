//--------module for half_adder---------
module half_adder(a,b,s,c);
	//-------------port direction-----------
	//-----input--------
	input a,b;
	//-----output-------
	output s,c;
	
	//data flow modeling
	assign s = a ^ b;
	assign c = a & b;
endmodule : half_adder

//--------module for full_adder---------
module full_adder(x,y,cin,S,C);
	//-------------port direction-----------
	//-----input--------
	input x,y,cin;
	//-----output-------
	output S,C;
	
	//data flow modeling
	assign S = x ^ y ^ cin;
	assign C = x & y | x & cin | y & cin;
endmodule : full_adder

module multiplier_4bit(A,B,P);
	//-------------port direction-----------
	//-----input--------
	input [3:0]A,B;
	//-----output-------
	output [7:0]P;
	//-----wire--------
	wire [16:0]M;

	assign P[0] = A[0] & B[0];
	
	//-----------------------
	half_adder ha1(.a(A[1]&B[0]),.b(A[0]&B[1]),.s(P[1]),.c(M[0]));
	full_adder fa2(.x(A[2]&B[0]),.y(A[1]&B[1]),.cin(M[0]),.S(M[1]),.C(M[2]));
	full_adder fa3(.x(A[3]&B[0]),.y(A[2&B[1]]),.cin(M[2]),.S(M[3]),.C(M[4]));
	half_adder ha4(.a(A[3]&B[1]),.b(M[4]),.s(M[5]),.c(M[6]));
	
	//-----------------------
	half_adder ha5(.a(A[0]&B[2]),.b(M[1]),.s(P[2]),.c(M[7]));
	full_adder fa6(.x(A[1]&B[2]),.y(M[3]),.cin(M[7]),.S(M[8]),.C(M[9]));
	full_adder fa7(.x(A[2]&B[2]),.y(M[5]),.cin(M[9]),.S(M[10]),.C(M[11]));
	full_adder fa8(.x(A[3]&B[2]),.y(M[6]),.cin(M[11]),.S(M[12]),.C(M[13]));
	
	//-----------------------
	half_adder ha9(.a(A[0]&B[3]),.b(M[8]),.s(P[3]),.c(M[14]));
	full_adder fa10(.x(A[1]&B[3]),.y(M[10]),.cin(M[14]),.S(P[4]),.C(M[15]));
	full_adder fa11(.x(A[2]&B[3]),.y(M[12]),.cin(M[15]),.S(P[5]),.C(M[16]));
	full_adder fa12(.x(A[3]&B[3]),.y(M[13]),.cin(M[16]),.S(P[6]),.C(P[7]));
	
endmodule : multiplier_4bit