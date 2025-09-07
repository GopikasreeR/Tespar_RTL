module tespar(
input clk,
input reset,
input signed [7:0] din,
output [4:0] code,
output valid
 );
 
 wire detect_valid;
 wire [5:0] D;
 wire [4:0] S;
 D_S_detector a1(clk,reset,din,D,S,detect_valid);
 tespar_lookup a2(D,S,detect_valid,code,valid);
endmodule
