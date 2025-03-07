`timescale 1ns / 1ps
module snake_top(
    output hsync,vsync,
    output [3:0] vga_r,vga_g,vga_b,
    
 //   input [8:0]level,        // determnines speed of snake
    
    output [7:0]AN,         // Anodes (active low)
    output [6:0]seg,        // segment pins (active low)
    
   output AUD_PWM,       // for the audio
   output AUD_SD,


    input [3:0]buttons,
    input clock_100Mhz,reset
    );

wire [999:0]pos_x,pos_y;
wire clock_1hz,clock_50Mhz,clock_25Mhz;
reg [3:0] color_r,color_g,color_b;
wire [9:0]pos_x_rand,pos_y_rand;
reg [9:0]curr_apple_x , curr_apple_y;
parameter [19:0]rand_seed = 212701;
reg apple_eaten;
reg [9:0]length = 0;
wire [9:0]head_x,head_y;
wire locked;
//wire [3:0]velocity;
wire signed [10:0] last_vel_x , last_vel_y;
wire [9:0] h_counter,v_counter;
reg [1:0]divider;
reg pixel_clk;
wire collision;

assign head_x = pos_x[9:0];
assign head_y = pos_y[9:0];



reg [3:0] unit,tens,hundreds,thousands,h_unit,h_tens,h_hundreds,h_thousands;
reg [19:0] score,high_score=0;
reg [4:0] digit_holder;
wire [2:0] rr;
reg [7:0] velocity;
reg [9:0]apple_count;

wire [3:0]r_next;
wire [3:0]b_next;
wire [3:0]g_next;
reg [3:0]r_reg;
reg [3:0]b_reg;
reg [3:0]g_reg;
//priority_encoder select_speed (.clock(clock_1hz),.i(level),.y(velocity));
//joystick jstk(.reset(reset),.clk(clock_100Mhz),.in_x(in_x),.in_y(in_y),.x_move(x_move),.y_move(y_move));
Snake_Position_Controller control1(.pos_x(pos_x), .pos_y(pos_y),.buttons(buttons),.clock(clock_1hz), .reset(reset),
                                   .length(length),.velocity(velocity),.x_apple(curr_apple_x),.y_apple(curr_apple_y),
                                   .last_vel_x(last_vel_x),.last_vel_y(last_vel_y),.collision(collision));
Clock_Divider_1s clock1s(clock_1hz,clock_100Mhz,reset);
Clock_Divider_2 clock_by_two(clock_50Mhz,clock_100Mhz,reset);
Clock_Divider_25Mhz clock_3(clock_25Mhz,clock_100Mhz,reset);
Random_Generator random1(pos_x_rand,pos_y_rand,rand_seed,clock_1hz,reset,curr_apple_x,curr_apple_y,velocity);
vga_controller snake_display(
    .clk_25Mhz(clock_25Mhz),           // Main clock input
    .clk_100Mhz(clock_100Mhz),
    .rst(reset),                // Reset signal
    .x_input(pos_x),      // X-coordinate (0-639 for 640x480 resolution)
    .y_input(pos_y),      // Y-coordinate (0-479 for 640x480 resolution)
    .length(length),
    .x_apple(curr_apple_x),
    .y_apple(curr_apple_y),
    .color_r(color_r),      // Red color (8 bits)
    .color_g(color_g),      // Green color (8 bits)
    .color_b(color_b),      // Blue color (8 bits)
    .hsync(hsync),         // Horizontal sync output
    .vsync(vsync),         // Vertical sync output
    .vga_r(vga_r),        // VGA red signal
    .vga_g(vga_g),        // VGA green signal
    .vga_b(vga_b),        // VGA blue signal
    .last_vel_x(last_vel_x),
    .last_vel_y(last_vel_y),
    .score(score),
    .high_score(high_score),
    .collision(collision)
//    .h_counter(h_counter),
 //   .v_counter(v_counter)
);

//text_controller print_score(.clk(clock_25Mhz),.x(h_counter),.y(v_counter),.r(r_next),.g(g_next),.b(b_next),.score_w(score));


always @(posedge clock_100Mhz)begin
    color_r <= 4'b0;
    color_g <= 4'b1111;
    color_b <= 4'b0;
end

always @(posedge clock_1hz or posedge reset) begin
    if (reset) begin
        apple_eaten <= 0;
        curr_apple_x <= 160;
        curr_apple_y <= 320;
        length <= 0;
        score <= 0;
        apple_count <= 0;
        velocity <= 2;
    end
    else begin
        if (head_x <= curr_apple_x + 4 && head_x >= curr_apple_x - 4 &&
            head_y <= curr_apple_y + 4 && head_y >= curr_apple_y - 4) begin
            apple_eaten <= 1;
            length <= length + 1;
            score <= (velocity<6)? (score + velocity) : (score + 2*velocity);
            apple_count<=apple_count+1;
            velocity <= 2 + apple_count/6;
        end
        else begin
            apple_eaten <= 0;
        end
      
       if(score > high_score) 
        begin 
            high_score <= score;
        end
        
        
        if (apple_eaten) begin
            curr_apple_x <= pos_x_rand;
            curr_apple_y <= pos_y_rand;
        end
    end
end

always @(*) begin
   unit = score % 10; 
   tens = ((score % 100) - unit) / 10 ; 
   hundreds = ((score % 1000)- unit - tens*10 ) / 100;  
   thousands = ((score % 10000)- unit - tens*10 - hundreds*100) / 1000;
    
   h_unit = high_score % 10; 
   h_tens = ((high_score % 100) - h_unit) / 10 ; 
   h_hundreds = ((high_score % 1000)- h_unit - h_tens*10 ) / 100;  
   h_thousands = ((high_score % 10000)- h_unit - h_tens*10 - h_hundreds*100) / 1000;
    
end

 always @(posedge clock_100Mhz)begin
       case(rr)
           3'b111: digit_holder <= unit;
           3'b110: digit_holder <= tens;
           3'b101: digit_holder <= hundreds;
           3'b100: digit_holder <= thousands;
           3'b011: digit_holder <= h_unit;
           3'b010: digit_holder <= h_tens;
           3'b001: digit_holder <= h_hundreds;
           3'b000: digit_holder <= h_thousands;
           default: digit_holder <= 5'b10000;
       endcase
   end


      
//        // scoreboard
        
 disp_7_seg scoreboard(.clk(clock_100Mhz), .digit_holder(digit_holder), .refresh_rate(rr), .AN(AN), .seg(seg));

       // play a sound when snake eats the apple
       
   play_sound music(.clk(clock_100Mhz), .Alarm(apple_eaten), .AUD_PWM(AUD_PWM), .AUD_SD(AUD_SD));
   
   
endmodule
