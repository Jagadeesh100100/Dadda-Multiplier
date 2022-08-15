module bentkung(a,b,cin,sum,cout);
input [31:0]a,b;
input cin;
output [31:0] sum;
output cout;
wire [31:0] c,p1,g1;
wire [15:0] p2,g2;
wire [7:0] p3,g3;
wire [3:0] p4,g4;
wire [1:0] p5,g5;
wire p6,g6;

genvar i;
generate
for(i=0;i<32;i=i+1)
begin:first_order
	p1g1 u0(a[i],b[i],p1[i],g1[i]);
end
endgenerate

generate
for(i=0;i<16;i=i+1)
begin:second_order
	pigi u1(p1[2*i+1],p1[2*i],g1[2*i+1],g1[2*i],p2[i],g2[i]);
end
endgenerate

generate
for(i=0;i<8;i=i+1)
begin:Third_order
	pigi u2(p2[2*i+1],p2[2*i],g2[2*i+1],g2[2*i],p3[i],g3[i]);
end
endgenerate

generate
for(i=0;i<4;i=i+1)
begin:Fourth_order
	pigi u3(p3[2*i+1],p3[2*i],g3[2*i+1],g3[2*i],p4[i],g4[i]);
end
endgenerate

generate
for(i=0;i<2;i=i+1)
begin:Fifth_order
	pigi u4(p4[2*i+1],p4[2*i],g4[2*i+1],g4[2*i],p5[i],g5[i]);
end
endgenerate

pigi u5(p5[1],p5[0],g5[1],g5[0],p6,g6);  //Sixth |der

//sum generation
assign sum[0] = p1[0] ^ cin;
generate
for(i=1;i<32;i=i+1)
begin:sum_calc
assign sum[i] = p1[i] ^ c[i];
end
endgenerate

//Carry calculation
assign c[0] = cin;
assign cout = g6 | (p6 & cin);
generate
for(i=1;i<32;i=i+1)
begin:carry_calc
if(i%16==0)
	assign c[i]=  g5[(i/16)-1] | (p5[(i/16)-1] & c[i-16]);
else if(i%8 == 0)
	assign c[i] = g4[(i/8)-1] | (p4[(i/8)-1] & c[i-8]);
else if(i%4 == 0)
	assign c[i] = g3[(i/4)-1] | (p3[(i/4)-1] & c[i-4]);
else if(i%2 == 0)
	assign c[i] = g2[(i/2)-1] | (p2[(i/2)-1] & c[i-2]);
else
	assign c[i] = g1[i-1] | (p1[i-1] & c[i-1]);
end
endgenerate
	
endmodule