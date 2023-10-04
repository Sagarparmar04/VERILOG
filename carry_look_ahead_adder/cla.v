module cla(a,b,cin,sum,carry);
	//port direction
	
	//input port
	input [3:0]a;
	input [3:0]b;
	input cin;
	
	//output port
	output [3:0]sum;
	output carry;
	
	//wire
  wire [3:0]ci;
  
	//data flow modeling
  assign ci[0] = cin;
  assign ci[1] = (a[0] & b[0]) | ((a[0]^b[0]) & ci[0]);
  //assign ci[2] = (a[1] & b[1]) | ((a[1]^b[1]) & ci[1]); expands to
  assign ci[2] = (a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])));
  //assign ci[3] = (a[2] & b[2]) | ((a[2]^b[2]) & ci[2]); expands to
  assign ci[3] = (a[2] & b[2]) | ((a[2]^b[2]) & ((a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])))));
  //assign carry  = (a[3] & b[3]) | ((a[3]^b[3]) & ci[3]); expands to
  assign carry  = (a[3] & b[3]) | ((a[3]^b[3]) & ((a[2] & b[2]) | ((a[2]^b[2]) & ((a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])))))));
	
	//sum
  assign sum = a^b^ci;
endmodule