`timescale 1ns / 1ps
module Random_Generator(output [9:0]pos_x_rand,pos_y_rand,input [19:0]rand_seed,input clock_1hz,reset);

reg [19:0]rand_temp = 212701;
reg [8:0]select;
reg [9:0] x,y;
wire xor_sum;

assign xor_sum = rand_temp[1]^rand_temp[0];

always@(posedge clock_1hz)
    begin
      if(reset)  
          rand_temp<=212701;
      else  
          rand_temp<={xor_sum, rand_temp[19:1]};  


 x = rand_temp[9:0] % 640;
 y = rand_temp[19:10] % 480;
 
    if((((x>=0&&x<11)||(x>629&&x<641))&&((y>=0&&y<121)||(y>359&&y<481))) || (((x>=0&&x<11)||(x>629&&x<641))&&((y>119&&y<361))) ||
      (((x>=10&&x<241)||(x>399&&x<=630))&&((y>=0&&y<11)||(y>469&&y<481))) || ((x>239&&x<401)&&((y>=0&&y<11)||(y>469&&y<481))) ||
      (((x>159&&x<181)||(x>219&&x<241)||(x>319&&x<341)||(x>419&&x<441))&&((y>179&&y<301))) ||
      (((x>239&&x<281)||(x>339&&x<381)||(x>439&&x<481))&&((y>179&&y<201)||(y>229&&y<251)||(y>279&&y<301))))
    begin
       select = rand_temp[0]?11:301;
       y = select + rand_temp[7:1] + rand_temp[11:8] + rand_temp[14:12] + rand_temp[16:15] + rand_temp[17];
       x = 11 + rand_temp[19:11] + rand_temp[10:5] + rand_temp[4:1] + rand_temp[0] + rand_temp[11:9]; 
    end
    
end

assign pos_x_rand = x;
assign pos_y_rand = y;

endmodule
