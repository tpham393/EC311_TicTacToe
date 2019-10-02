module valid_move_check(reset, top, middle, bottom, ai_move_select, human_move_select, move_out, request_new_move_select, valid_move);
  input [5:0] top, middle, bottom;
  input [3:0] ai_move_select, human_move_select;
  input reset;
  output reg request_new_move_select; // 1 if move invalid; enables player_move_select module, i.e. player needs to input another move
  output reg valid_move; // 1 if the move is valid; enable signal to board_update module, i.e. only update the board if move input is valid
  output reg [3:0] move_out; // 4-bit board position out; 0000 if no valid moves

  reg [3:0] move_select;

// assigning single character parameters to represent which 1 of 9 board positions selected
// i.e. :
// a | b | c
// d | e | f
// g | h | i
// note unused 4-bit combinations from decimal value 10 to 15
  localparam a = 4'b0001, b = 4'b0010, c = 4'b0011, d = 4'b0100, e = 4'b0101, f = 4'b0110, g = 4'b0111, h = 4'b1000, i = 4'b1001; // think this syntax will work; will update to binary values if necessary

  always @ (*) begin // only checks move of player or ai, depending on which is active
    case (human_move_select)
	   4'b0000:
		  move_select = ai_move_select;
		default:
		  move_select = human_move_select;
		endcase
  end

  always @ (posedge reset) begin
    if (reset) begin // assume active high, asynchronous reset **make sure this matches with team**
	   request_new_move_select <= 1;
	 end
  end

  always @ (*) begin
    case (move_select)
      a: begin
        if ((top[5:4] == 2'b10) || (top[5:4] == 2'b01)) begin // position is not blank
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = a;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // a
      b: begin
        if ((top[3:2] == 2'b10) || (top[3:2] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = b;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // b
      c: begin
        if ((top[1:0] == 2'b10) || (top[1:0] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = c;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // c
      d: begin
        if ((middle[5:4] == 2'b10) || (middle[5:4] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = d;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // d
      e: begin
        if ((middle[3:2] == 2'b10) || (middle[3:2] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = e;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // e
      f: begin
        if ((middle[1:0] == 2'b10) || (middle[1:0] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = f;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // f
      g: begin
        if ((bottom[5:4] == 2'b10) || (bottom[5:4] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = g;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // g
      h: begin
        if ((bottom[3:2] == 2'b10) || (bottom[3:2] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = a;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // h
      i: begin
        if ((bottom[1:0] == 2'b10) || (bottom[1:0] == 2'b01)) begin
          request_new_move_select = 1;
			 valid_move = 0;
			 move_out = 0;
		  end
        else begin
          move_out = i;
          request_new_move_select = 0;
			 valid_move = 1;
        end
      end // i
      default: begin // i.e. for some reason, we get undefined sequence of 4-bit board position
        move_out = 0;
        request_new_move_select = 1;
		  valid_move = 0;
      end
    endcase
  end //always
endmodule
