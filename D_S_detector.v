module D_S_detector(
	input clk,
	input reset,
	input signed [7:0] din,
	output reg [5:0] D,
	output reg [4:0] S,
	output reg valid
);
 
	reg signed [7:0] prev_din;
	reg [5:0] s_count;
	reg prev_sign;
 
	initial begin
    	prev_din = 8'h00;
    	s_count = 6'h00;
    	prev_sign = 1'b0;
    	D = 6'h00;
    	S = 5'h00;
    	valid = 1'b0;
	end
 
	always @(posedge clk or posedge reset) begin
    	if (reset) begin
        	prev_din <= 8'h00;
        	s_count <= 6'h00;
        	prev_sign <= 1'b0;
        	D <= 6'h00;
        	S <= 5'h00;
        	valid <= 1'b0;
    	end else begin
        	// Zero-crossing detection
        	if ((din[7] != prev_din[7]) && (din != 8'h00)) begin
            	// Capture D and S values
            	D <= {5'b0, prev_sign};
            	S <= s_count[4:0];
            	valid <= 1'b1;
 
            	// Reset counter for the new interval
                s_count <= 6'h01;
                prev_sign <= din[7];
        	end else begin
            	// Continue counting
                s_count <= s_count + 1'b1;
            	valid <= 1'b0;
        	end
        	
        	// Update previous input
        	prev_din <= din;
    	end
	end
endmodule
