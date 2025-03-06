`timescale 1ns / 1ps
module play_sound(
    input clk,
    input Alarm,
    output reg AUD_PWM,
    output AUD_SD
    );
    
    reg [19:0] counter;
    reg clk_stb;
    
    assign AUD_SD = Alarm;
    
    always @(posedge clk)begin
        if(counter == 113635 )begin
            counter <= 0;
            clk_stb <= ~clk_stb;
        end else
            counter <= counter + 1;
    end
    
    always @(posedge clk_stb)
        AUD_PWM <= ~AUD_PWM;
endmodule
