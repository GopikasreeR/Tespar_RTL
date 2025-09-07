module tespar_lookup(
input [5:0] D,
input [4:0] S,
input valid,
output [4:0] code,
output valid_lookup
);
 
reg [4:0] code;
 
always @(*) begin
case (D)
1: code = 1;
2: code = 2;
3: code = 3;
4: code = 4;
5: code = 5;
6: code = 6;
7: code = 6;
8: begin
case(S)
0: code = 7;
default: code = 8;
endcase
end
 
9:begin
case(S)
0: code = 7;
default: code = 8;
endcase
end
 
10:begin
case(S)
0: code = 7;
default: code = 8;
endcase
end
 
11:begin
case(S)
0: code = 9;
default: code = 10;
endcase
end
 
12:begin
case(S)
0: code = 9;
default: code = 10;
endcase
end
 
13:begin
case(S)
0: code = 9;
default: code = 10;
endcase
end
 
14:begin
case(S)
0: code = 11;
1: code = 12;
default: code = 13;
endcase
end
 
15:begin
case(S)
0: code = 11;
1: code = 12;
default: code = 13;
endcase
end
 
16:begin
case(S)
0: code = 11;
1: code = 12;
default: code = 13;
endcase
end
 
17:begin
case(S)
0: code = 11;
1: code = 12;
default: code = 13;
endcase
end
 
18:begin
case(S)
0: code = 11;
1: code = 12;
default: code = 13;
endcase
end
 
19:begin
case(S)
0: code = 14;
1: code = 15;
2: code = 16;
default: code = 17;
endcase
end
 
20:begin
case(S)
0: code = 14;
1: code = 15;
2: code = 16;
default: code = 17;
endcase
end
 
21:begin
case(S)
0: code = 14;
1: code = 15;
2: code = 16;
default: code = 17;
endcase
end
 
22:begin
case(S)
0: code = 14;
1: code = 15;
2: code = 16;
default: code = 17;
endcase
end
 
23:begin
case(S)
0: code = 14;
1: code = 15;
2: code = 16;
default: code = 17;
endcase
end
 
24:begin
case(S)
0: code = 18;
1: code = 19;
2: code = 20;
3: code = 21;
default: code = 22;
endcase
end
 
25:begin
case(S)
0: code = 18;
1: code = 19;
2: code = 20;
3: code = 21;
default: code = 22;
endcase
end
 
26:begin
case(S)
0: code = 18;
1: code = 19;
2: code = 20;
3: code = 21;
default: code = 22;
endcase
end
 
27:begin
case(S)
0: code = 18;
1: code = 19;
2: code = 20;
3: code = 21;
default: code = 22;
endcase
end
 
28:begin
case(S)
0: code = 18;
1: code = 19;
2: code = 20;
3: code = 21;
default: code = 22;
endcase
end
 
29:begin
case(S)
0: code = 18;
1: code = 19;
2: code = 20;
3: code = 21;
default: code = 17;
endcase
end
 
30:begin
case(S)
0: code = 18;
1: code = 19;
2: code = 20;
3: code = 21;
default: code = 22;
endcase
end
 
31,32,33,34,35,36,37:begin
case(S)
0: code = 23;
1: code = 24;
2: code = 25;
3: code = 26;
4: code = 27;
5: code = 28;
default: code = 0;
endcase
end
default: code = 0;
endcase
end
 
assign valid_lookup = valid;
endmodule
