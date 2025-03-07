`timescale 1ns / 1ps
module Random_Generator(output [9:0]pos_x_rand,pos_y_rand,input [19:0]rand_seed,
                         input clock_1hz,reset, input [9:0]x_apple,y_apple, input [7:0] velocity);

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
    
    if((((((x>=40 && x<=300) || (x>=340 && x<=600)) && (y>=100 && y<=105)) || 
      ((((x>=40 && x<=200) || (x>=240 && x<=400) || (x>=440 && x<=600)) && (y>=375 && y<=380))))) || 
      (((x>=70 && x<=75) || (x>=575 && x<=580)) && (y>=60 && y<=420)) ||
      (((x>=100 && x<=540 && y>=125 && y<=130) || (((x>=100 && x<=260)||
      (x>=340 && x<=540)) && (y>=350 && y<=355)) ||
      (((x>=100 && x<=105) || (x>=535 && x<=540)) && (y>=130 && y<=350))))) 
              
      begin
         select = rand_temp[13]?15:385;
         y = select + rand_temp[15:11] + rand_temp[7:4];
         x = 105 + rand_temp[12:5] + rand_temp[16:10] + rand_temp[5:1];
      
      end
      
      if(((x>=235 && x<=280)||(x>=335 && x<=380)||(x>=435 && x<=480)) && (y>=190 && y<=290) && (velocity>=4))
         begin 
           select = rand_temp[7]? 11 : 585;
           x = select + rand_temp[8:4] + rand_temp[15:12];
           y = 130 + rand_temp[19:13] + rand_temp[12:7] + rand_temp[6:2];
         end
         
    
end

assign pos_x_rand = x;
assign pos_y_rand = y;

endmodule
