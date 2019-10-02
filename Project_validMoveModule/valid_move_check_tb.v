`timescale 1ns / 1ps

module valid_move_check_tb;

	// Inputs
	reg reset;
	reg [5:0] top;
	reg [5:0] middle;
	reg [5:0] bottom;
	reg [3:0] ai_move_select;
	reg [3:0] human_move_select;

	// Outputs
	wire [3:0] move_out;
	wire request_new_move_select;
	wire valid_move;

	// Instantiate the Unit Under Test (UUT)
	valid_move_check uut (
		.reset(reset), 
		.top(top), 
		.middle(middle), 
		.bottom(bottom), 
		.ai_move_select(ai_move_select),
		.human_move_select(human_move_select), 
		.move_out(move_out), 
		.request_new_move_select(request_new_move_select), 
		.valid_move(valid_move)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		top = 6'b000000; // initialize a blank board
		middle = 6'b000000;
		bottom = 6'b000000;
		ai_move_select = 4'b0000;
		human_move_select = 4'b0000;

		#5 reset = 0;
	end
	
	always begin
	  #10 human_move_select = human_move_select + 1'b1;
	  #100 top = top + 1'b1;
	  #100 middle = middle + 1'b1;
	  #100 bottom = bottom + 1'b1;
	end
      
endmodule

