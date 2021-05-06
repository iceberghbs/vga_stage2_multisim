`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/14 16:01:15
// Design Name: 
// Module Name: tb_vga_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_vga_driver(

    );

    `include "header_bmp.v"
    `include "header_str.v"
    
    reg clk = 1;
    reg clk_vga = 1;

    reg rst_n = 0;
    initial begin
        #100
        rst_n = 1;
    //   for function test
    //   test_bmp_gen(640,480,{8'd255,8'd155,8d'55});
    end


    //******************************************************************************************
    parameter FPGA_CLK_FREQUENCY = 100; // Mhz
    parameter MONITOR_CLK_FREQUENCY = 25; //Mhz

    always #(500/FPGA_CLK_FREQUENCY) clk = ~clk;
    always #(500/MONITOR_CLK_FREQUENCY) clk_vga = ~clk_vga;




    //******************************************************************************************
    // PORT MAP
    //******************************************************************************************
    wire [3:0] red;
    wire [3:0] green;
    wire [3:0] blue;
    wire up,down,left,right,center;
    reg [4:0] key = 'b00000 ;
    assign {up,down,left,right,center} = key;
    reg [11:0] sw = 'h000;
    wire sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9,sw10,sw11;
    assign {sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9,sw10,sw11} = sw;

    /*<your entity/module name> */              /*dont change*/
    VGA_Driver                                   inst(

    .clk    /*change to your clk name*/      (clk   /*dont change*/     ),
    .rst_n  /*change to your rstn name*/     (rst_n /*dont change*/     ),

    //.red   /*change to your 4bit r bus name*/       (red   /*dont change*/  ),
    //.green /*change to your 4bit g bus name*/       (green /*dont change*/  ),
    //.blue  /*change to your 4bit b bus name*/       (blue  /*dont change*/  ),
    //.vs    /*change to your vs wire name*/          (vs    /*dont change*/  ),
    //.hs    /*change to your hs wire name*/          (hs    /*dont change*/  ),
    //.hs    /*change to your hs wire name*/          (hs    /*dont change*/  ),
    // .de(de)

    //.sw0         /*change to your 12bits sw  name*/     (sw0                      ),
    //.sw1         /*change to your 12bits sw  name*/     (sw1                      ),
    //.sw2         /*change to your 12bits sw  name*/     (sw2                      ),
    //.sw3         /*change to your 12bits sw  name*/     (sw3                      ),
    //.sw4         /*change to your 12bits sw  name*/     (sw4                      ),
    //.sw5         /*change to your 12bits sw  name*/     (sw5                      ),
    //.sw6         /*change to your 12bits sw  name*/     (sw6                      ), 
    //.sw7         /*change to your 12bits sw  name*/     (sw7                      ),
    //.sw8         /*change to your 12bits sw  name*/     (sw8                      ),
    //.sw9         /*change to your 12bits sw  name*/     (sw9                      ),
    //.sw10         /*change to your 12bits sw  name*/    (sw10                     ),
    //.sw11         /*change to your 12bits sw  name*/    (sw11                     ),
    //.sw12         /*change to your 12bits sw  name*/    (sw12                     ),
    .red0   /*change to your 4bit r bus name*/       (red[0]   /*dont change*/  ),
    .red1   /*change to your 4bit r bus name*/       (red[1]   /*dont change*/  ),
    .red2   /*change to your 4bit r bus name*/       (red[2]   /*dont change*/  ),
    .red3   /*change to your 4bit r bus name*/       (red[3]   /*dont change*/  ),
    .green0 /*change to your 4bit g bus name*/       (green[0] /*dont change*/  ),
    .green1 /*change to your 4bit g bus name*/       (green[1] /*dont change*/  ),
    .green2 /*change to your 4bit g bus name*/       (green[2] /*dont change*/  ),
    .green3 /*change to your 4bit g bus name*/       (green[3] /*dont change*/  ),
    .blue0  /*change to your 4bit b bus name*/       (blue[0]  /*dont change*/  ),
    .blue1  /*change to your 4bit b bus name*/       (blue[1]  /*dont change*/  ),
    .blue2  /*change to your 4bit b bus name*/       (blue[2]  /*dont change*/  ),
    .blue3  /*change to your 4bit b bus name*/       (blue[3]  /*dont change*/  ),
    .vs    /*change to your vs wire name*/          (vs    /*dont change*/  ),
    .hs    /*change to your hs wire name*/          (hs    /*dont change*/  )
    
    //.up         /*change to your key name*/         (up                     ),
    //.down       /*change to your key name*/         (down                   ),
    //.left       /*change to your key name*/         (left                   ),
    //.right      /*change to your key name*/         (right                  ),
    //.center     /*change to your key name*/         (center                 )
    );


   //******************************************************************************************


    //******************************************************************************************
    // key control
    //******************************************************************************************

    parameter FRAME_TIME = (500/MONITOR_CLK_FREQUENCY) * 800 * 521 ;
    parameter KEY_INIT_STATE = 'b00000 ;

    initial begin
        key <= KEY_INIT_STATE;
        sw <= 'h000;
        //====================================
        //1st key
        #FRAME_TIME
        sw <= 'hFFF;
        key <= 'b10000; // up,down,left,right,center
        #1000
        key <= KEY_INIT_STATE;
        //====================================
        //2nd key
        #FRAME_TIME
        sw <= 'h0FF;
        key <= 'b01000; //up,down,left,right,center
        #1000
        key <= KEY_INIT_STATE;
        //====================================
        //3
        #FRAME_TIME
        sw <= 'hF0F;
        key <= 'b00100; //up,down,left,right,center
        #1000
        key <= KEY_INIT_STATE;
        //====================================
        //4
        #FRAME_TIME
        sw <= 'hFF0;
        key <= 'b00010; //up,down,left,right,center
        #1000
        key <= KEY_INIT_STATE;
        //====================================   
        //5
        #FRAME_TIME
        sw <= 'hF00;
        key <= 'b00001; //up,down,left,right,center
        #1000
        key <= KEY_INIT_STATE;
        //====================================  
        //6
        #FRAME_TIME
        sw <= 'hF00;
        key <= 'b00000; //up,down,left,right,center
        #1000
        key <= KEY_INIT_STATE;
        //====================================  
    end

    //******************************************************************************************
    // dont change
    //******************************************************************************************
    
    parameter H_Back_porch = 48;
    parameter H_Data = 640;
    parameter V_Back_porch = 29;
    parameter V_Data = 480;

    reg [9:0] x = 0;
    reg [9:0] y = 0;

    reg [2:1] hs_delay = 0;
    reg [2:1] vs_delay = 0;

    reg flag_frame_detected = 0;
    reg data_enable = 0;

    always @(posedge clk_vga) begin   
        hs_delay = {hs_delay[1],hs};
        vs_delay = {vs_delay[1],vs};
    end

    always @(posedge clk_vga) begin
        if(!hs)
            x = 0;
        else
            x = x + 1;
        if(vs == 0)
            y = 0;
        else if (hs_delay == 'b01)
            y = y + 1;
    end

    always @(*) begin
        //guess start point
        if(y>V_Back_porch && y<=V_Back_porch + V_Data  && x>= H_Back_porch && x< H_Data + H_Back_porch)
            data_enable = 1;
        else
            data_enable = 0;
    end

    //draw bmp picture
    integer file_id;  
    integer i,j;
    integer width = 640; 
    integer height = 480;    
    reg [0:14*8-1] new_header = 0;
    reg [0:40*8-1] new_map = 0;
    reg [0:8*8-1] filename = "0000.bmp";
    reg [15:0] frame_num = 0;

    always @(negedge vs) begin
        if(flag_frame_detected) begin
            $fclose(file_id);
            frame_num = frame_num + 1;
        end
    end

    always @(posedge clk_vga) begin
        if(data_enable == 1 && flag_frame_detected)
            //write pix
            $fwrite(file_id,"%c%c%c", color_8bit(blue),color_8bit(green),color_8bit(red)) ;//R      
    end

    always @(posedge vs) begin
        //mark the start of frame
        flag_frame_detected = 1;     
        filename[0:31] = toNumStr(frame_num);

        //create file
        file_id =$fopen(filename,"wb+");	    

        //write header
        new_header = bmp_header_gen(width*height*3 + 54,54);
        for(i = 0; i < 14; i = i + 1) begin
            $fwrite(file_id,"%c", new_header[i*8 +: 8]) ;
        end
        
        //write map
        new_map = bmp_map_gen(width,height,24,0);
        for(i = 0; i < 40; i = i + 1) begin
            $fwrite(file_id,"%c", new_map[i*8 +: 8]) ;
        end
    end








endmodule
