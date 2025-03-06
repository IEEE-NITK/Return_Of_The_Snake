`timescale 1ns / 1ps

module random_tb;

wire [9:0]x,y;
reg clock_1hz = 0,reset = 1;
parameter [19:0]rand_seed = 212701;

always #1 clock_1hz =~ clock_1hz;

Random_Generator rand1(x,y,rand_seed,clock_1hz,reset);
initial begin
#1.5;
reset = 0;
#100;
$stop;

end
endmodule
