module TESPAR_tb;
	reg clk;
	reg rst;
	reg signed [7:0] din;
	wire [4:0] code;
	wire valid;
	
	// Declaring the memory array and loading it with the binary data
	reg signed [7:0] data_mem [0:42];
	
	initial begin
    	data_mem[0] = 8'b11101111;
    	data_mem[1] = 8'b11111011;
    	data_mem[2] = 8'b00001100;
    	data_mem[3] = 8'b00100010;
    	data_mem[4] = 8'b00111011;
    	data_mem[5] = 8'b00010101;
    	data_mem[6] = 8'b00011110;
    	data_mem[7] = 8'b00101011;
    	data_mem[8] = 8'b01000000;
    	data_mem[9] = 8'b01000110;
    	data_mem[10] = 8'b01011010;
    	data_mem[11] = 8'b00110111;
    	data_mem[12] = 8'b00011110;
    	data_mem[13] = 8'b00010101;
    	data_mem[14] = 8'b00001011;
    	data_mem[15] = 8'b11111101;
    	data_mem[16] = 8'b11100010;
    	data_mem[17] = 8'b11001110;
    	data_mem[18] = 8'b10111100;
    	data_mem[19] = 8'b11100111;
    	data_mem[20] = 8'b11110110;
    	data_mem[21] = 8'b00001110;
    	data_mem[22] = 8'b00011110;
    	data_mem[23] = 8'b00101101;
    	data_mem[24] = 8'b01001111;
    	data_mem[25] = 8'b01111001;
    	data_mem[26] = 8'b01010000;
    	data_mem[27] = 8'b01000110;
    	data_mem[28] = 8'b00111100;
    	data_mem[29] = 8'b01001011;
    	data_mem[30] = 8'b01100011;
    	data_mem[31] = 8'b01101110;
    	data_mem[32] = 8'b01010000;
    	data_mem[33] = 8'b00110010;
    	data_mem[34] = 8'b00101000;
    	data_mem[35] = 8'b00111100;
    	data_mem[36] = 8'b01001100;
    	data_mem[37] = 8'b01100100;
    	data_mem[38] = 8'b01010000;
    	data_mem[39] = 8'b00110010;
    	data_mem[40] = 8'b00011110;
    	data_mem[41] = 8'b00001010;
    	data_mem[42] = 8'b11101101;
	end
 
	tespar uut (
    	.clk(clk),
    	.reset(rst),
    	.din(din),
    	.code(code),
    	.valid(valid)
	);
	
	initial begin
    	clk = 0;
    	forever #5 clk = ~clk;
	end
	
	integer i;
 
	initial begin
    	rst = 1;
    	din = 8'b0;
@(posedge clk);
    	
    	rst = 0;
    	@(posedge clk);
    	
    	for(i = 0; i < 43; i = i + 1) begin
        	din = data_mem[i];
        	@(posedge clk);
    	end
    	#10 $finish;
	end
endmodule
