//-----module for full_adder--------
//-----port declaration---------
module full_adder(a,b,cin,sum,carry);
//-----port direction
//----input------
	input a,b,cin;
//----output-----
	output sum,carry;
		
//------using data flow modeling
	assign sum = a^b^cin;
	assign carry = a&b | a&cin | b&cin;
	
endmodule : full_adder

//-----module for 2*1 mux--------
//-----port declaration---------
module mux(s,i0,i1,y);
//port direction
//----input------
	input s,i0,i1;
//----output-----
	output reg y;
	
//------behaviour modeling-----
	always@(*)begin
		if(s == 0)
			y = i0;
		else
			y = i1;
	end
endmodule : mux

//-----module for carry skip adder--------
//-----port declaration---------
module carry_skip_adder(A,B,Cin,SUM,CARRY);
//port direction
//----input------
	input [3:0]A;
	input [3:0]B;
	input Cin;
//----output-----
	output [3:0]SUM;
	output CARRY;
//-----wire------
	wire [3:0]pr;
	wire p;
	wire [3:0]c;
	integer i;
//------initiate full_adder-------
//------name base initiate-------------
	full_adder fa1(.a(A[0]),.b(B[0]),.cin(Cin),.sum(SUM[0]),.carry(c[0]));
	full_adder fa2(.a(A[1]),.b(B[1]),.cin(c[0]),.sum(SUM[1]),.carry(c[1]));
	full_adder fa3(.a(A[2]),.b(B[2]),.cin(c[1]),.sum(SUM[2]),.carry(c[2]));
	full_adder fa4(.a(A[3]),.b(B[3]),.cin(c[2]),.sum(SUM[3]),.carry(c[3]));

//-----------------------------
	assign pr[0] = A[0] ^ B[0];
	assign pr[1] = A[1] ^ B[1];
	assign pr[2] = A[2] ^ B[2];
	assign pr[3] = A[3] ^ B[3];
	
//-----------------------------
	assign p = pr[0] & pr[1] & pr[2] & pr[3];

//------initiate mux-------
//------name base initiate-------------
	mux m1(.s(p),.i0(c[3]),.i1(Cin),.y(CARRY));
endmodule : carry_skip_adder