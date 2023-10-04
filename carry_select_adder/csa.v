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

//-----module for carry select adder--------
//-----port declaration---------
module csa(A,B,Cin,SUM,CARRY);
	//port direction
	//----input------
	input [3:0]A;
	input [3:0]B;
	input Cin;
	//----output-----
	output [3:0]SUM;
	output CARRY;
	//-----wire------
	wire [3:0] p0,p1,p2,p3;
	
	//------initiate full_adder-------
	//------name base initiate-------------
	full_adder fa1(.a(A[0]),.b(B[0]),.cin(1'b0),.sum(p2[0]),.carry(p0[0]));
	full_adder fa2(.a(A[1]),.b(B[1]),.cin(p0[0]),.sum(p2[1]),.carry(p0[1]));
	full_adder fa3(.a(A[2]),.b(B[2]),.cin(p0[1]),.sum(p2[2]),.carry(p0[2]));
	full_adder fa4(.a(A[3]),.b(B[3]),.cin(p0[2]),.sum(p2[3]),.carry(p0[3]));
	
	//--------------------------------
	full_adder fa5(.a(A[0]),.b(B[0]),.cin(1'b1),.sum(p3[0]),.carry(p1[0]));
	full_adder fa6(.a(A[1]),.b(B[1]),.cin(p1[0]),.sum(p3[1]),.carry(p1[1]));
	full_adder fa7(.a(A[2]),.b(B[2]),.cin(p1[1]),.sum(p3[2]),.carry(p1[2]));
	full_adder fa8(.a(A[3]),.b(B[3]),.cin(p1[2]),.sum(p3[3]),.carry(p1[3]));
	
	//------initiate mux-------------------
	//------name base initiate-------------
	//--------for sum----------------------
	mux m1(.s(Cin),.i0(p2[0]),.i1(p3[0]),.y(SUM[0]));
	mux m2(.s(Cin),.i0(p2[1]),.i1(p3[1]),.y(SUM[1]));
	mux m3(.s(Cin),.i0(p2[2]),.i1(p3[2]),.y(SUM[2]));
	mux m4(.s(Cin),.i0(p2[3]),.i1(p3[3]),.y(SUM[3]));
	
	////--------for carry------------------
	mux m5(.s(Cin),.i0(p0[3]),.i1(p1[3]),.y(CARRY));
endmodule : csa