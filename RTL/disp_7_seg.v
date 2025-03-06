`timescale 1ns / 1ps
module disp_7_seg(
    input clk,                  
    input [4:0] digit_holder,     // Current digit needed to be displayed
    output [2:0] refresh_rate,   // Works as a way to know what digit is being worked on
    output [7:0] AN,            // Anodes
    output [6:0] seg           // 7-seg display
    );
    
    reg [19:0] rr = 0;
    
    seg_mapping map(.digit_holder(digit_holder), .seg(seg));
    anode_sel an(.clk(clk), .rr(rr[19:17]), .AN(AN));
    
    assign refresh_rate = rr[19:17];  //this approach can make us achieve our goal without creating an additional clock to refresh them 
   
    //Refresh Rate buffer
    always @(posedge clk)
        rr <= rr + 1;
endmodule
