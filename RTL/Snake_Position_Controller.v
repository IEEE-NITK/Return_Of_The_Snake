`timescale 1ns / 1ps
module Snake_Position_Controller(output [999:0] pos_x, pos_y,  input clock, reset,input [9:0]length, 
input [3:0]velocity ,input [9:0] x_apple, input [9:0] y_apple , output reg signed [10:0] last_vel_x , last_vel_y , input [3:0] buttons , output reg collision);
reg signed [10:0] pos_x_temp, pos_y_temp;
reg signed [10:0] vel_x, vel_y;
reg [989:0] pos_x_body,pos_y_body;
reg [989:0]temp_1s = ~(990'b0);

assign pos_x = {pos_x_body[989:0],pos_x_temp[9:0]};
assign pos_y = {pos_y_body[989:0],pos_y_temp[9:0]};

parameter [10:0] monitor_width_pixels = 640;
parameter [10:0] monitor_height_pixels = 480;

always @(*) begin
    vel_x = last_vel_x;
    vel_y = last_vel_y;
    if ( buttons[0]==1) begin // left
      if(last_vel_x != 1)  begin
        vel_x = -1;
        vel_y = 0;    end
    end 
    else if (buttons[1]==1 ) begin // down
       if(last_vel_y != -1)  begin
        vel_x = 0;
        vel_y = 1;     end // inverted Y axis
    end 
    else if (buttons[2]==1) begin // right
      if(last_vel_x != -1)  begin
        vel_x = 1;
        vel_y = 0;    end
    end 
    else if ( buttons[3]==1) begin // up
        if(last_vel_y != 1)  begin
        vel_x = 0;
        vel_y = -1;        end// inverted Y axis
    end 
end

always @(posedge clock or posedge reset) begin
    if (reset == 1) begin
        pos_x_temp = 320;
        pos_y_temp = 120;
        last_vel_x = 0;
        last_vel_y = 0;
        pos_x_body = 990'b0;
        pos_y_body = 990'b0;
        end 
   
    else begin
        
        
            pos_x_body = pos_x_body << 10;
            pos_y_body = pos_y_body << 10;
            
            pos_x_body[9:0] = pos_x_temp[9:0];
            pos_y_body[9:0] = pos_y_temp[9:0];
            
            pos_x_body[989:0] = pos_x_body[989:0] & ~(temp_1s << length*10);
     
        
        
       if (!(((pos_x_temp>=0 && pos_x_temp<11)||(pos_x_temp>629 && pos_x_temp<641))&&((pos_y_temp>=0 && pos_y_temp<121)||(pos_y_temp>359 && pos_y_temp<481))||
                ((pos_x_temp>=10 && pos_x_temp<241)||(pos_x_temp>399 && pos_x_temp<=630))&&((pos_y_temp>=0 && pos_y_temp<11)||(pos_y_temp>469 && pos_y_temp<481)) ||  
                ((pos_x_temp>159 && pos_x_temp<181)||(pos_x_temp>219 && pos_x_temp<241)||(pos_x_temp>319 && pos_x_temp<341)||(pos_x_temp>419 && pos_x_temp<441))&&((pos_y_temp>179 && pos_y_temp<301))||
                ((pos_x_temp>239 && pos_x_temp<281)||(pos_x_temp>339 && pos_x_temp<381)||(pos_x_temp>439 && pos_x_temp<481))&&((pos_y_temp>179 && pos_y_temp<201)||(pos_y_temp>229 && pos_y_temp<251)||
                (pos_y_temp>279 && pos_y_temp<301))|| (((((pos_x_temp>=40 && pos_x_temp<=300) || (pos_x_temp>=340 && pos_x_temp<=600)) && (pos_y_temp>=100 && pos_y_temp<=105)) || 
                 ((((pos_x_temp>=40 && pos_x_temp<=200) || (pos_x_temp>=240 && pos_x_temp<=400) || (pos_x_temp>=440 && pos_x_temp<=600)) && (pos_y_temp>=375 && pos_y_temp<=380)))) && (y_apple<80 || y_apple>400)) || 
                (((pos_x_temp>=70 && pos_x_temp<=75) || (pos_x_temp>=575 && pos_x_temp<=580)) && (pos_y_temp>=60 && pos_y_temp<=420) && (y_apple>320 && (x_apple>180 && x_apple<480))) || 
                (((pos_x_temp>=100 && pos_x_temp<=540 && pos_y_temp>=125 && pos_y_temp<=130) || 
                  (((pos_x_temp>=100 && pos_x_temp<=260)||(pos_x_temp>=340 && pos_x_temp<=540)) && (pos_y_temp>=350 && pos_y_temp<=355)) ||
                  (((pos_x_temp>=100 && pos_x_temp<=105) || (pos_x_temp>=535 && pos_x_temp<=540)) && (pos_y_temp>=130 && pos_y_temp<=350))) && 
                  ((x_apple>180 && x_apple<420) && (y_apple>180 && y_apple<300)))))
                begin  
                
               if (!((pos_x_temp==pos_x_body[19:10] && pos_y_temp==pos_y_body[19:10]) ||  
                    (pos_x_temp==pos_x_body[29:20] && pos_y_temp==pos_y_body[29:20]) || 
                    (pos_x_temp==pos_x_body[39:30] && pos_y_temp==pos_y_body[39:30]) || 
                    (pos_x_temp==pos_x_body[49:40] && pos_y_temp==pos_y_body[49:40]) || 
                    (pos_x_temp==pos_x_body[59:50] && pos_y_temp==pos_y_body[59:50]) || 
                    (pos_x_temp==pos_x_body[69:60] && pos_y_temp==pos_y_body[69:60]) || 
                    (pos_x_temp==pos_x_body[79:70] && pos_y_temp==pos_y_body[79:70]) || 
                    (pos_x_temp==pos_x_body[89:80] && pos_y_temp==pos_y_body[89:80]) || 
                    (pos_x_temp==pos_x_body[99:90] && pos_y_temp==pos_y_body[99:90]) || 
                    (pos_x_temp==pos_x_body[109:100] && pos_y_temp==pos_y_body[109:100]) || 
                    (pos_x_temp==pos_x_body[119:110] && pos_y_temp==pos_y_body[119:110]) || 
                    (pos_x_temp==pos_x_body[129:120] && pos_y_temp==pos_y_body[129:120]) || 
                    (pos_x_temp==pos_x_body[139:130] && pos_y_temp==pos_y_body[139:130]) || 
                    (pos_x_temp==pos_x_body[149:140] && pos_y_temp==pos_y_body[149:140]) || 
                    (pos_x_temp==pos_x_body[159:150] && pos_y_temp==pos_y_body[159:150]) || 
                    (pos_x_temp==pos_x_body[169:160] && pos_y_temp==pos_y_body[169:160]) || 
                    (pos_x_temp==pos_x_body[179:170] && pos_y_temp==pos_y_body[179:170]) || 
                    (pos_x_temp==pos_x_body[189:180] && pos_y_temp==pos_y_body[189:180]) || 
                    (pos_x_temp==pos_x_body[199:190] && pos_y_temp==pos_y_body[199:190]) || 
                    (pos_x_temp==pos_x_body[209:200] && pos_y_temp==pos_y_body[209:200]) || 
                    (pos_x_temp==pos_x_body[219:210] && pos_y_temp==pos_y_body[219:210]) || 
                    (pos_x_temp==pos_x_body[229:220] && pos_y_temp==pos_y_body[229:220]) || 
                    (pos_x_temp==pos_x_body[239:230] && pos_y_temp==pos_y_body[239:230]) || 
                    (pos_x_temp==pos_x_body[249:240] && pos_y_temp==pos_y_body[249:240]) || 
                    (pos_x_temp==pos_x_body[259:250] && pos_y_temp==pos_y_body[259:250]) || 
                    (pos_x_temp==pos_x_body[269:260] && pos_y_temp==pos_y_body[269:260]) || 
                    (pos_x_temp==pos_x_body[279:270] && pos_y_temp==pos_y_body[279:270]) || 
                    (pos_x_temp==pos_x_body[289:280] && pos_y_temp==pos_y_body[289:280]) || 
                    (pos_x_temp==pos_x_body[299:290] && pos_y_temp==pos_y_body[299:290]) || 
                    (pos_x_temp==pos_x_body[309:300] && pos_y_temp==pos_y_body[309:300]) || 
                    (pos_x_temp==pos_x_body[319:310] && pos_y_temp==pos_y_body[319:310]) || 
                    (pos_x_temp==pos_x_body[329:320] && pos_y_temp==pos_y_body[329:320]) || 
                    (pos_x_temp==pos_x_body[339:330] && pos_y_temp==pos_y_body[339:330]) || 
                    (pos_x_temp==pos_x_body[349:340] && pos_y_temp==pos_y_body[349:340]) || 
                    (pos_x_temp==pos_x_body[359:350] && pos_y_temp==pos_y_body[359:350]) || 
                    (pos_x_temp==pos_x_body[369:360] && pos_y_temp==pos_y_body[369:360]) || 
                    (pos_x_temp==pos_x_body[379:370] && pos_y_temp==pos_y_body[379:370]) || 
                    (pos_x_temp==pos_x_body[389:380] && pos_y_temp==pos_y_body[389:380]) || 
                    (pos_x_temp==pos_x_body[399:390] && pos_y_temp==pos_y_body[399:390]) || 
                    (pos_x_temp==pos_x_body[409:400] && pos_y_temp==pos_y_body[409:400]) || 
                    (pos_x_temp==pos_x_body[419:410] && pos_y_temp==pos_y_body[419:410]) || 
                    (pos_x_temp==pos_x_body[429:420] && pos_y_temp==pos_y_body[429:420]) || 
                    (pos_x_temp==pos_x_body[439:430] && pos_y_temp==pos_y_body[439:430]) || 
                    (pos_x_temp==pos_x_body[449:440] && pos_y_temp==pos_y_body[449:440]) || 
                    (pos_x_temp==pos_x_body[459:450] && pos_y_temp==pos_y_body[459:450]) || 
                    (pos_x_temp==pos_x_body[469:460] && pos_y_temp==pos_y_body[469:460]) || 
                    (pos_x_temp==pos_x_body[479:470] && pos_y_temp==pos_y_body[479:470]) || 
                    (pos_x_temp==pos_x_body[489:480] && pos_y_temp==pos_y_body[489:480]) || 
                    (pos_x_temp==pos_x_body[499:490] && pos_y_temp==pos_y_body[499:490]) || 
                    (pos_x_temp==pos_x_body[509:500] && pos_y_temp==pos_y_body[509:500]) || 
                    (pos_x_temp==pos_x_body[519:510] && pos_y_temp==pos_y_body[519:510]) || 
                    (pos_x_temp==pos_x_body[529:520] && pos_y_temp==pos_y_body[529:520]) || 
                    (pos_x_temp==pos_x_body[539:530] && pos_y_temp==pos_y_body[539:530]) || 
                    (pos_x_temp==pos_x_body[549:540] && pos_y_temp==pos_y_body[549:540]) || 
                    (pos_x_temp==pos_x_body[559:550] && pos_y_temp==pos_y_body[559:550]) || 
                    (pos_x_temp==pos_x_body[569:560] && pos_y_temp==pos_y_body[569:560]) || 
                    (pos_x_temp==pos_x_body[579:570] && pos_y_temp==pos_y_body[579:570]) || 
                    (pos_x_temp==pos_x_body[589:580] && pos_y_temp==pos_y_body[589:580]) || 
                    (pos_x_temp==pos_x_body[599:590] && pos_y_temp==pos_y_body[599:590]) || 
                    (pos_x_temp==pos_x_body[609:600] && pos_y_temp==pos_y_body[609:600]) || 
                    (pos_x_temp==pos_x_body[619:610] && pos_y_temp==pos_y_body[619:610]) || 
                    (pos_x_temp==pos_x_body[629:620] && pos_y_temp==pos_y_body[629:620]) || 
                    (pos_x_temp==pos_x_body[639:630] && pos_y_temp==pos_y_body[639:630]) || 
                    (pos_x_temp==pos_x_body[649:640] && pos_y_temp==pos_y_body[649:640]) || 
                    (pos_x_temp==pos_x_body[659:650] && pos_y_temp==pos_y_body[659:650]) || 
                    (pos_x_temp==pos_x_body[669:660] && pos_y_temp==pos_y_body[669:660]) || 
                    (pos_x_temp==pos_x_body[679:670] && pos_y_temp==pos_y_body[679:670]) || 
                    (pos_x_temp==pos_x_body[689:680] && pos_y_temp==pos_y_body[689:680]) || 
                    (pos_x_temp==pos_x_body[699:690] && pos_y_temp==pos_y_body[699:690]) || 
                    (pos_x_temp==pos_x_body[709:700] && pos_y_temp==pos_y_body[709:700]) || 
                    (pos_x_temp==pos_x_body[719:710] && pos_y_temp==pos_y_body[719:710]) || 
                    (pos_x_temp==pos_x_body[729:720] && pos_y_temp==pos_y_body[729:720]) || 
                    (pos_x_temp==pos_x_body[739:730] && pos_y_temp==pos_y_body[739:730]) || 
                    (pos_x_temp==pos_x_body[749:740] && pos_y_temp==pos_y_body[749:740]) || 
                    (pos_x_temp==pos_x_body[759:750] && pos_y_temp==pos_y_body[759:750]) || 
                    (pos_x_temp==pos_x_body[769:760] && pos_y_temp==pos_y_body[769:760]) || 
                    (pos_x_temp==pos_x_body[779:770] && pos_y_temp==pos_y_body[779:770]) || 
                    (pos_x_temp==pos_x_body[789:780] && pos_y_temp==pos_y_body[789:780]) || 
                    (pos_x_temp==pos_x_body[799:790] && pos_y_temp==pos_y_body[799:790]) || 
                    (pos_x_temp==pos_x_body[809:800] && pos_y_temp==pos_y_body[809:800]) || 
                    (pos_x_temp==pos_x_body[819:810] && pos_y_temp==pos_y_body[819:810]) || 
                    (pos_x_temp==pos_x_body[829:820] && pos_y_temp==pos_y_body[829:820]) || 
                    (pos_x_temp==pos_x_body[839:830] && pos_y_temp==pos_y_body[839:830]) || 
                    (pos_x_temp==pos_x_body[849:840] && pos_y_temp==pos_y_body[849:840]) || 
                    (pos_x_temp==pos_x_body[859:850] && pos_y_temp==pos_y_body[859:850]) || 
                    (pos_x_temp==pos_x_body[869:860] && pos_y_temp==pos_y_body[869:860]) || 
                    (pos_x_temp==pos_x_body[879:870] && pos_y_temp==pos_y_body[879:870]) || 
                    (pos_x_temp==pos_x_body[889:880] && pos_y_temp==pos_y_body[889:880]) || 
                    (pos_x_temp==pos_x_body[899:890] && pos_y_temp==pos_y_body[899:890]) || 
                    (pos_x_temp==pos_x_body[909:900] && pos_y_temp==pos_y_body[909:900]) || 
                    (pos_x_temp==pos_x_body[919:910] && pos_y_temp==pos_y_body[919:910]) || 
                    (pos_x_temp==pos_x_body[929:920] && pos_y_temp==pos_y_body[929:920]) || 
                    (pos_x_temp==pos_x_body[939:930] && pos_y_temp==pos_y_body[939:930]) || 
                    (pos_x_temp==pos_x_body[949:940] && pos_y_temp==pos_y_body[949:940]) || 
                    (pos_x_temp==pos_x_body[959:950] && pos_y_temp==pos_y_body[959:950]) || 
                    (pos_x_temp==pos_x_body[969:960] && pos_y_temp==pos_y_body[969:960]) || 
                    (pos_x_temp==pos_x_body[979:970] && pos_y_temp==pos_y_body[979:970]) || 
                    (pos_x_temp==pos_x_body[989:980] && pos_y_temp==pos_y_body[989:980]) ))
                 


     begin
        pos_x_temp = pos_x_temp + vel_x * velocity;
        pos_y_temp = pos_y_temp + vel_y * velocity;
        collision  = 0;
     end 
      
      else collision = 1; 
      
   end 
     
     
      else collision = 1;
    
                 
                 
                 
        if( buttons[0]==1 || buttons[1]==1 || buttons[2]==1 || buttons[3]==1)
           begin
            last_vel_x = vel_x;
            last_vel_y = vel_y;
          end



        if (pos_x_temp < 1) begin
            pos_x_temp = monitor_width_pixels - 1;  
        end
        else if (pos_x_temp >= monitor_width_pixels -1) begin
            pos_x_temp = 1;  
        end
        else if (pos_y_temp < 0) begin
            pos_y_temp = monitor_height_pixels - 1;  
        end
        else if (pos_y_temp >= monitor_height_pixels) begin
            pos_y_temp =0;  
        end
    end end
    
    
    

endmodule
