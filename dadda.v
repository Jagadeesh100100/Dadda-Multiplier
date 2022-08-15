module dadda(a,b,mul);
input [15:0]a;
input [15:0]b;
output [31:0] mul;
wire cout,cin;
wire [15:0] pprod1;

wire [16:1]pprod2;
wire [17:2]pprod3;
wire [18:3]pprod4;
wire [19:4]pprod5;
wire [20:5]pprod6;
wire [21:6]pprod7;
wire [22:7]pprod8;
wire [23:8]pprod9;
wire [24:9]pprod10;
wire [25:10]pprod11;
wire [26:11]pprod12;
wire [27:12]pprod13;
wire [28:13]pprod14;
wire [29:14]pprod15;
wire [30:15]pprod16;
genvar i;

wire [18:13]l20;
wire [19:14]l21;
wire [17:14]l22;
wire [18:15]l23;
wire [16:15]l24;
wire [17:16]l25;


wire [22:9]l30;
wire [23:10]l31;
wire [21:10]l32;
wire [22:11]l33;
wire [20:11]l34;
wire [21:12]l35;
wire [19:12] l36;
wire [20:13] l37;
//wire [23:8] r8;




wire [25:6] l40;
wire [26:7] l41;
wire [24:7] l42;
wire [25:8] l43;
wire [23:8] l44;
wire [24:9] l45;

wire [27:4]l50;
wire [28:5]l51;
wire [26:5]l52;
wire [27:6]l53;

wire [28:3]l60;
wire [29:4]l61;
wire [31:0]v0;
wire [31:0]v1;


//partial products :

generate 
for(i=0;i<=15;i=i+1)begin : dhanu
assign pprod1[i]= a[i] & b[0];
assign pprod2[i+1]= a[i] & b[1];
assign pprod3[i+2]= a[i] & b[2];
assign pprod4[i+3]= a[i] & b[3];
assign pprod5[i+4]= a[i] & b[4];
assign pprod6[i+5]= a[i] & b[5];
assign pprod7[i+6]= a[i] & b[6];
assign pprod8[i+7]= a[i] & b[7];
assign pprod9[i+8]= a[i] & b[8];
assign pprod10[i+9]= a[i] & b[9];
assign pprod11[i+10]= a[i] & b[10];
assign pprod12[i+11]= a[i] & b[11];
assign pprod13[i+12]= a[i] & b[12];
assign pprod14[i+13]= a[i] & b[13];
assign pprod15[i+14]= a[i] & b[14];
assign pprod16[i+15]= a[i] & b[15];
end
endgenerate


//Intializing values:

 assign v0[0] = pprod1[0];

 assign v1[0]= 1'b0;
 
 assign v0[1]=pprod1[1];

 assign v1[1]=pprod2[1];

 assign v1[2]=pprod3[2];

 assign v0[30]=pprod16[30];

 assign v0[31]=1'b0;

 assign v1[31]=1'b0;
 

//1st layer addition 

ha ha13(pprod1[13],pprod2[13],l20[13],l21[14]);

fa fa14(pprod1[14],pprod2[14],pprod3[14],l20[14],l21[15]);
ha ha14(pprod4[14],pprod5[14],l22[14],l23[15]);

fa fa15_1(pprod1[15],pprod2[15],pprod3[15],l20[15],l21[16]);
fa fa15_2(pprod4[15],pprod5[15],pprod6[15],l22[15],l23[16]);
ha ha15(pprod7[15],pprod8[15],l24[15],l25[16]);

fa fa16_1(pprod2[16],pprod3[16],pprod4[16],l20[16],l21[17]);
fa fa16_2(pprod5[16],pprod6[16],pprod7[16],l22[16],l23[17]);
ha ha16(pprod8[16],pprod9[16],l24[16],l25[17]);

fa fa17_1(pprod3[17],pprod4[17],pprod5[17],l20[17],l21[18]);
fa fa17_2(pprod6[17],pprod7[17],pprod8[17],l22[17],l23[18]);

fa fa18(pprod4[18],pprod5[18],pprod6[18],l20[18],l21[19]);

//2nd layer addition(ha9_2 implies 9th clmn and its is for layel32)

ha ha9_2(pprod1[9],pprod2[9],l30[9],l31[10]);

fa fa10_2(pprod1[10],pprod2[10],pprod3[10],l30[10],l31[11]);
ha ha10_2(pprod4[10],pprod5[10],l32[10],l33[11]);

fa fa11a_2(pprod1[11],pprod2[11],pprod3[11],l30[11],l31[12]);
fa fa11b_2(pprod4[11],pprod5[11],pprod6[11],l32[11],l33[12]);
ha ha11_2(pprod7[11],pprod8[11],l34[11],l35[12]);

fa fa12a_2(pprod1[12],pprod2[12],pprod3[12],l30[12],l31[13]);
fa fa12b_2(pprod4[12],pprod5[12],pprod6[12],l32[12],l33[13]);
fa fa12c_2(pprod7[12],pprod8[12],pprod9[12],l34[12],l35[13]);
ha ha12_2(pprod10[12],pprod11[12],l36[12],l37[13]);


fa fa13a_2(pprod3[13],pprod4[13],pprod5[13],l30[13],l31[14]);
fa fa13b_2(pprod6[13],pprod7[13],pprod8[13],l32[13],l33[14]);
fa fa13c_2(pprod9[13],pprod10[13],pprod11[13],l34[13],l35[14]);
fa fa13d_2(pprod12[13],pprod13[13],pprod14[13],l36[13],l37[14]);


fa fa14a_2(l20[14],l22[14],pprod6[14],l30[14],l31[15]);
fa fa14b_2(pprod7[14],pprod8[14],pprod9[14],l32[14],l33[15]);
fa fa14c_2(pprod10[14],pprod11[14],pprod12[14],l34[14],l35[15]);
fa fa14d_2(pprod13[14],pprod14[14],pprod15[14],l36[14],l37[15]);


fa fa15a_2(l20[15],l21[15],l22[15],l30[15],l31[16]);
fa fa15b_2(pprod10[15],pprod9[15],l24[15],l32[15],l33[16]);
fa fa15c_2(pprod12[15],pprod13[15],pprod11[15],l34[15],l35[16]);
fa fa15d_2(pprod14[15],pprod15[15],pprod16[15],l36[15],l37[16]);

fa fa16a_2(l20[16],l21[16],l22[16],l30[16],l31[17]);
fa fa16b_2(pprod10[16],l24[16],l25[16],l32[16],l33[17]);
fa fa16c_2(pprod12[16],pprod13[16],pprod11[16],l34[16],l35[17]);
fa fa16d_2(pprod14[16],pprod15[16],pprod16[16],l36[16],l37[17]);





fa fa17a_2(l20[17],l21[17],l22[17],l30[17],l31[18]);
fa fa17b_2(pprod9[17],pprod10[17],l25[17],l32[17],l33[18]);
fa fa17c_2(pprod11[17],pprod12[17],pprod13[17],l34[17],l35[18]);
fa fa17d_2(pprod14[17],pprod15[17],pprod16[17],l36[17],l37[18]);





fa fa18a_2(l20[18],l21[18],pprod7[18],l30[18],l31[19]);
fa fa18b_2(pprod8[18],pprod9[18],pprod10[18],l32[18],l33[19]);
fa fa18c_2(pprod11[18],pprod12[18],pprod13[18],l34[18],l35[19]);
fa fa18d_2(pprod14[18],pprod15[18],pprod16[18],l36[18],l37[19]);


fa fa19a_2(pprod5[19],pprod6[19],pprod7[19],l30[19],l31[20]);
fa fa19b_2(pprod8[19],pprod9[19],pprod10[19],l32[19],l33[20]);
fa fa19c_2(pprod11[19],pprod12[19],pprod13[19],l34[19],l35[20]);
fa fa19d_2(pprod14[19],pprod15[19],pprod16[19],l36[19],l37[20]);

fa fa20a_2(pprod6[20],pprod7[20],pprod8[20],l30[20],l31[21]);
fa fa20b_2(pprod9[20],pprod10[20],pprod11[20],l32[20],l33[21]);
fa fa20c_2(pprod12[20],pprod13[20],pprod14[20],l34[20],l35[21]);

fa fa21a_2(pprod9[21],pprod7[21],pprod8[21],l30[21],l31[22]);
fa fa21b_2(pprod12[21],pprod10[21],pprod11[21],l32[21],l33[22]);


fa fa22a_2(pprod10[22],pprod8[22],pprod9[22],l30[22],l31[23]);


//3rd addition

ha ha6_3(pprod1[6],pprod2[6],l40[6],l41[7]);

fa fa7a_3(pprod1[7],pprod2[7],pprod3[7],l40[7],l41[8]);
ha ha7b_3(pprod4[7],pprod5[7],l42[7],l43[8]);


fa fa8a_3(pprod1[8],pprod2[8],pprod3[8],l40[8],l41[9]);
fa fa8b_3(pprod4[8],pprod5[8],pprod6[8],l42[8],l43[9]);
ha ha8c_3(pprod7[8],pprod8[8],l44[8],l45[9]);

fa fa9a_3(pprod3[9],pprod4[9],l30[9],l40[9],l41[10]);
fa fa9b_3(pprod5[9],pprod6[9],pprod7[9],l42[9],l43[10]);
fa fa9c_3(pprod8[9],pprod9[9],pprod10[9],l44[9],l45[10]);

fa fa10a_3(l30[10],l31[10],l32[10],l40[10],l41[11]);
fa fa10b_3(pprod8[10],pprod6[10],pprod7[10],l42[10],l43[11]);
fa fa10c_3(pprod11[10],pprod9[10],pprod10[10],l44[10],l45[11]);

fa fa11a_3(l30[11],l31[11],l32[11],l40[11],l41[12]);
fa fa11b_3(l33[11],l34[11],pprod9[11],l42[11],l43[12]);
fa fa11c_3(pprod10[11],pprod11[11],pprod12[11],l44[11],l45[12]);

fa fa12a_3(l30[12],l31[12],l32[12],l40[12],l41[13]);
fa fa12b_3(l33[12],l34[12],l35[12],l42[12],l43[13]);
fa fa12c_3(l36[12],pprod12[12],pprod13[12],l44[12],l45[13]);



fa fa13a_3(l30[13],l31[13],l32[13],l40[13],l41[14]);
fa fa13b_3(l33[13],l34[13],l35[13],l42[13],l43[14]);
fa fa13c_3(l36[13],l37[13],l20[13],l44[13],l45[14]);

fa fa14a_3(l30[14],l31[14],l32[14],l40[14],l41[15]);
fa fa14b_3(l33[14],l34[14],l35[14],l42[14],l43[15]);
fa fa14c_3(l36[14],l37[14],l21[14],l44[14],l45[15]);

fa fa15a_3(l30[15],l31[15],l32[15],l40[15],l41[16]);
fa fa15b_3(l33[15],l34[15],l35[15],l42[15],l43[16]);
fa fa15c_3(l36[15],l37[15],l23[15],l44[15],l45[16]);



fa fa16a_3(l30[16],l31[16],l32[16],l40[16],l41[17]);
fa fa16b_3(l33[16],l34[16],l35[16],l42[16],l43[17]);
fa fa16c_3(l36[16],l37[16],l23[16],l44[16],l45[17]);

fa fa17a_3(l30[17],l31[17],l32[17],l40[17],l41[18]);
fa fa17b_3(l33[17],l34[17],l35[17],l42[17],l43[18]);
fa fa17c_3(l36[17],l37[17],l23[17],l44[17],l45[18]);


fa fa18a_3(l30[18],l31[18],l32[18],l40[18],l41[19]);
fa fa18b_3(l33[18],l34[18],l35[18],l42[18],l43[19]);
fa fa18c_3(l36[18],l37[18],l23[18],l44[18],l45[19]);

fa fa19a_3(l30[19],l31[19],l32[19],l40[19],l41[20]);
fa fa19b_3(l33[19],l34[19],l35[19],l42[19],l43[20]);
fa fa19c_3(l36[19],l37[19],l21[19],l44[19],l45[20]);


fa fa20a_3(l30[20],l31[20],l32[20],l40[20],l41[21]);
fa fa20b_3(l33[20],l34[20],l35[20],l42[20],l43[21]);
fa fa20c_3(l37[20],pprod15[20],pprod16[20],l44[20],l45[21]);

fa fa21a_3(l30[21],l31[21],l32[21],l40[21],l41[22]);
fa fa21b_3(l33[21],l35[21],pprod13[21],l42[21],l43[22]);
fa fa21c_3(pprod14[21],pprod15[21],pprod16[21],l44[21],l45[22]);


fa fa22a_3(l30[22],l31[22],pprod11[22],l40[22],l41[23]);
fa fa22b_3(l33[22],pprod12[22],pprod13[22],l42[22],l43[23]);
fa fa22c_3(pprod14[22],pprod15[22],pprod16[22],l44[22],l45[23]);

fa fa23a_3(l31[23],pprod9[23],pprod10[23],l40[23],l41[24]);
fa fa23b_3(pprod11[23],pprod12[23],pprod13[23],l42[23],l43[24]);
fa fa23c_3(pprod14[23],pprod15[23],pprod16[23],l44[23],l45[24]);

fa fa24a_3(pprod10[24],pprod11[24],pprod12[24],l40[24],l41[25]);
//doubt 2 times pprod14 used

fa fa24b_3(pprod13[24],pprod14[24],pprod15[24],l42[24],l43[25]);

fa fa25_3(pprod11[25],pprod12[25],pprod13[25],l40[25],l41[26]);


//4th stage addition

ha ha4a_4(pprod1[4],pprod2[4],l50[4],l51[5]);

fa fa5a_4(pprod1[5],pprod2[5],pprod3[5],l50[5],l51[6]);
ha ha5b_4(pprod4[5],pprod5[5],l52[5],l53[6]);

fa fa6a_4(l40[6],pprod3[6],pprod4[6],l50[6],l51[7]);
fa fa6b_4(pprod5[6],pprod6[6],pprod7[6],l52[6],l53[7]);

fa fa7a_4(l40[7],l41[7],l42[7],l50[7],l51[8]);
fa fa7b_4(pprod6[7],pprod7[7],pprod8[7],l52[7],l53[8]);


fa fa8a_4(l40[8],l41[8],l42[8],l50[8],l51[9]);
fa fa8b_4(l43[8],l44[8],pprod9[8],l52[8],l53[9]);


fa fa9a_4(l40[9],l41[9],l42[9],l50[9],l51[10]);
fa fa9b_4(l43[9],l44[9],l45[9],l52[9],l53[10]);

fa fa10a_4(l40[10],l41[10],l42[10],l50[10],l51[11]);
fa fa10b_4(l43[10],l44[10],l45[10],l52[10],l53[11]);

fa fa11a_4(l40[11],l41[11],l42[11],l50[11],l51[12]);
fa fa11b_4(l43[11],l44[11],l45[11],l52[11],l53[12]);

fa fa12a_4(l40[12],l41[12],l42[12],l50[12],l51[13]);
fa fa12b_4(l43[12],l44[12],l45[12],l52[12],l53[13]);


fa fa13a_4(l40[13],l41[13],l42[13],l50[13],l51[14]);
fa fa13b_4(l43[13],l44[13],l45[13],l52[13],l53[14]);

fa fa14a_4(l40[14],l41[14],l42[14],l50[14],l51[15]);
fa fa14b_4(l43[14],l44[14],l45[14],l52[14],l53[15]);

fa fa15a_4(l40[15],l41[15],l42[15],l50[15],l51[16]);
fa fa15b_4(l43[15],l44[15],l45[15],l52[15],l53[16]);

fa fa16a_4(l40[16],l41[16],l42[16],l50[16],l51[17]);
fa fa16b_4(l43[16],l44[16],l45[16],l52[16],l53[17]);

fa fa17a_4(l40[17],l41[17],l42[17],l50[17],l51[18]);
fa fa17b_4(l43[17],l44[17],l45[17],l52[17],l53[18]);

fa fa18a_4(l40[18],l41[18],l42[18],l50[18],l51[19]);
fa fa18b_4(l43[18],l44[18],l45[18],l52[18],l53[19]);

fa fa19a_4(l40[19],l41[19],l42[19],l50[19],l51[20]);
fa fa19b_4(l43[19],l44[19],l45[19],l52[19],l53[20]);

fa fa20a_4(l40[20],l41[20],l42[20],l50[20],l51[21]);
fa fa20b_4(l43[20],l44[20],l45[20],l52[20],l53[21]);


fa fa21a_4(l40[21],l41[21],l42[21],l50[21],l51[22]);
fa fa21b_4(l43[21],l44[21],l45[21],l52[21],l53[22]);

fa fa22a_4(l40[22],l41[22],l42[22],l50[22],l51[23]);
fa fa22_4(l43[22],l44[22],l45[22],l52[22],l53[23]);

fa fa23a_4(l40[23],l41[23],l42[23],l50[23],l51[24]);
fa fa23_4(l43[23],l44[23],l45[23],l52[23],l53[24]);

fa fa24a_4(l40[24],l41[24],l42[24],l50[24],l51[25]);
fa fa24_4(l43[24],pprod16[24],l45[24],l52[24],l53[25]);


fa fa25a_4(l40[25],l41[25],pprod14[25],l50[25],l51[26]);
fa fa25_4(l43[25],pprod15[25],pprod16[25],l52[25],l53[26]);


fa fa26a_4(l41[26],pprod12[26],pprod13[26],l50[26],l51[27]);
fa fa26_4(pprod14[26],pprod15[26],pprod16[26],l52[26],l53[27]);



fa fa27_4(pprod13[27],pprod14[27],pprod15[27],l50[27],l51[28]);


//fifth stage addition

ha ha3a_5(pprod1[3],pprod2[3],l60[3],l61[4]);

fa fa4a_5(pprod3[4],pprod4[4],pprod5[4],l60[4],l61[5]);

fa fa5a_5(l51[5],l52[5],pprod6[5],l60[5],l61[6]);

fa fa6a_5(l50[6],l51[6],l52[6],l60[6],l61[7]);

fa fa7_5(l50[7],l51[7],l52[7],l60[7],l61[8]);
fa fa8_5(l50[8],l51[8],l52[8],l60[8],l61[9]);
fa fa9_5(l50[9],l51[9],l52[9],l60[9],l61[10]);
fa fa10_5(l50[10],l51[10],l52[10],l60[10],l61[11]);
fa fa11_5(l50[11],l51[11],l52[11],l60[11],l61[12]);
fa fa12_5(l50[12],l51[12],l52[12],l60[12],l61[13]);
fa fa13_5(l50[13],l51[13],l52[13],l60[13],l61[14]);
fa fa14_5(l50[14],l51[14],l52[14],l60[14],l61[15]);
fa fa15_5(l50[15],l51[15],l52[15],l60[15],l61[16]);
fa fa16_5(l50[16],l51[16],l52[16],l60[16],l61[17]);
fa fa17_5(l50[17],l51[17],l52[17],l60[17],l61[18]);
fa fa18_5(l50[18],l51[18],l52[18],l60[18],l61[19]);
fa fa19_5(l50[19],l51[19],l52[19],l60[19],l61[20]);
fa fa20_5(l50[20],l51[20],l52[20],l60[20],l61[21]);
fa fa21_5(l50[21],l51[21],l52[21],l60[21],l61[22]);
fa fa22_5(l50[22],l51[22],l52[22],l60[22],l61[23]);
fa fa23_5(l50[23],l51[23],l52[23],l60[23],l61[24]);
fa fa24_5(l50[24],l51[24],l52[24],l60[24],l61[25]);
fa fa25_5(l50[25],l51[25],l52[25],l60[25],l61[26]);
fa fa26_5(l50[26],l51[26],l52[26],l60[26],l61[27]);
fa fa27_5(l50[27],l51[27],pprod16[27],l60[27],l61[28]);

fa fa28_5(l51[28],pprod14[28],pprod15[28],l60[28],l61[29]);


//6th stage addition

ha ha2_6(pprod1[2],pprod2[2],v0[2],v1[3]);

fa fa3_6(l60[3],pprod3[3],pprod4[3],v0[3],v1[4]);

fa fa4_6(l60[4],l61[4],l50[4],v0[4],v1[5]);

fa fa5_6(l60[5],l61[5],l50[5],v0[5],v1[6]);

fa fa6_6(l60[6],l61[6],l53[6],v0[6],v1[7]);

fa fa7_6(l60[7],l61[7],l53[7],v0[7],v1[8]);
fa fa8_6(l60[8],l61[8],l53[8],v0[8],v1[9]);
fa fa9_6(l60[9],l61[9],l53[9],v0[9],v1[10]);
fa fa10_6(l60[10],l61[10],l53[10],v0[10],v1[11]);
fa fa11_6(l60[11],l61[11],l53[11],v0[11],v1[12]);
fa fa12_6(l60[12],l61[12],l53[12],v0[12],v1[13]);
fa fa13_6(l60[13],l61[13],l53[13],v0[13],v1[14]);
fa fa14_6(l60[14],l61[14],l53[14],v0[14],v1[15]);
fa fa15_6(l60[15],l61[15],l53[15],v0[15],v1[16]);
fa fa16_6(l60[16],l61[16],l53[16],v0[16],v1[17]);
fa fa17_6(l60[17],l61[17],l53[17],v0[17],v1[18]);
fa fa18_6(l60[18],l61[18],l53[18],v0[18],v1[19]);
fa fa19_6(l60[19],l61[19],l53[19],v0[19],v1[20]);
fa fa20_6(l60[20],l61[20],l53[20],v0[20],v1[21]);
fa fa21_6(l60[21],l61[21],l53[21],v0[21],v1[22]);
fa fa22_6(l60[22],l61[22],l53[22],v0[22],v1[23]);
fa fa23_6(l60[23],l61[23],l53[23],v0[23],v1[24]);
fa fa24_6(l60[24],l61[24],l53[24],v0[24],v1[25]);
fa fa25_6(l60[25],l61[25],l53[25],v0[25],v1[26]);
fa fa26_6(l60[26],l61[26],l53[26],v0[26],v1[27]);
fa fa27_6(l60[27],l61[27],l53[27],v0[27],v1[28]);
fa fa28_6(l60[28],l61[28],pprod16[28],v0[28],v1[29]);
fa fa29_6(pprod15[29],l61[29],pprod16[29],v0[29],v1[30]);


bentkung adder(v0,v1,1'b0,mul,cout);

//brent_kung16bit addel31(v0[15:0],v1[15:0],b,sum,cin,carry);

 
 endmodule
 
 
 
 
 