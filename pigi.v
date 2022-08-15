module pigi(pi,pi1,gi,gi1,ph,gh);
input pi,pi1,gi,gi1;
output ph,gh;
assign ph = pi & pi1;
assign gh = gi | (pi & gi1);
endmodule