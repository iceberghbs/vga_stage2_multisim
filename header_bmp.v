// This is a function library for generate BMP
// only for simulation
   
   
    //转换大小端
    function [0:15] bigendian_2byte;
    input [0:15] smallendian;  
    begin
        bigendian_2byte[8:15] = smallendian[0:7];
        bigendian_2byte[0:7] = smallendian[8:15];
  
    end
    endfunction



    //转换大小端
    function [0:31] bigendian_4byte;
    input [0:31] smallendian;  
    begin
        bigendian_4byte[0:7] = smallendian[24:31];
        bigendian_4byte[8:15] = smallendian[16:23];
        bigendian_4byte[16:23] = smallendian[8:15];
        bigendian_4byte[24:31] = smallendian[0:7];
    
    end
    endfunction

    function [7:0] color_8bit;
    input [3:0] color_4bit;
    begin
        color_8bit[7:6] = {color_4bit[3],color_4bit[3]};
        color_8bit[5:4] = {color_4bit[2],color_4bit[2]};
        color_8bit[3:2] = {color_4bit[1],color_4bit[1]};
        color_8bit[1:0] = {color_4bit[0],color_4bit[0]};
    end
    endfunction




    function [0:14*8-1] bmp_header_gen;
    input [0:31]    bfsize;
    input [0:31]    bfoffbit;
    begin
        bmp_header_gen[0*8:2*8-1] = 16'h424d;
        bmp_header_gen[2*8:6*8-1] = bigendian_4byte(bfsize);
        bmp_header_gen[6*8:10*8-1] = 0;
        //默认不使用画板：14+40 
        bmp_header_gen[10*8:14*8-1] = bigendian_4byte(bfoffbit);
    end
    endfunction



    function [0:40*8-1] bmp_map_gen;
    input  [0:31] biwidth;
    input  [0:31] biheight;
    input  [0:15] bibitcount; 
    input  [0:31] bisizeimage;
    begin
        //40 位图信息头的大小
        bmp_map_gen[0*8:4*8-1] = bigendian_4byte(40);
        //图像宽
        bmp_map_gen[4*8:8*8-1] = bigendian_4byte(biwidth);
        //图像高
        bmp_map_gen[8*8:12*8-1] = bigendian_4byte(biheight);
        //biplanes === 1
        bmp_map_gen[12*8:14*8-1] = bigendian_2byte(1);
        //bibitcount
        bmp_map_gen[14*8:16*8-1] = bigendian_2byte(bibitcount);
        //biCompression === 0 BI_RGB
        bmp_map_gen[16*8:20*8-1] = bigendian_4byte(0);
        //BI_RGB格式时，可以设置为0 biSizeImage
        bmp_map_gen[20*8:24*8-1] = bigendian_4byte(bisizeimage);
        //水平分辨率
        bmp_map_gen[24*8:28*8-1] = bigendian_4byte(0);
        //垂直分辨率
        bmp_map_gen[28*8:32*8-1] = bigendian_4byte(0);
        //4字节的biClrUsed，使用的颜色索引数
        bmp_map_gen[32*8:36*8-1] = bigendian_4byte(0);
        //字节的biClrImportant，重要的颜色索引数
        bmp_map_gen[36*8:40*8-1] = bigendian_4byte(0);
    end
    endfunction



    // test function
    // usage :  test_bmp_gen(<width>,<height>,{red,green,blue});
    // example: test_bmp_gen(640,480,{8'd255,8'd255,8d'255});
    task test_bmp_gen;
    input [15:0] width ;
    input [15:0] height;
    input [23:0] color;
    
    reg [0:14*8-1] new_header ;
    reg [0:40*8-1] new_map;
    reg [0:8*8-1] filename;
    integer file_id;  
    integer i,j;
    begin
        filename = "test.bmp";
        //create file
        file_id =$fopen(filename,"wb+");	    
        
        //write header
        new_header = bmp_header_gen(width*height*3 + 54,54);
        for(i = 0; i < 14; i = i + 1) begin
            $fwrite(file_id,"%c", new_header[i*8 +: 8]) ;//写入文件
        end
        
        //write map
        new_map = bmp_map_gen(width,height,24,0);
        for(i = 0; i < 40; i = i + 1) begin
            $fwrite(file_id,"%c", new_map[i*8 +: 8]) ;//写入文件
        end
        
        //write pixs
        for(i = 0; i < width; i = i + 1) begin
            for ( j= 0;j < height ; j=j+1) begin
                  $fwrite(file_id,"%c%c%c", color[23:16],color[15:8],color[7:0]) ;//R            
            end
        end
        //close file
        $fclose(file_id);    
    end
    endtask