
// Eda link : 
// ( swamy ) please copy the code but don't change/modify the code here.


//========================================================================================
// Project Name : switch sv based.
//========================================================================================



`include "test.sv"
`include "input_interface.sv"
`include "memory_interface.sv"
`include "out_put_interface.sv"
module tb_top;
  
bit clk=0;
bit rst=1;
  
//for clock generation  
initial begin
forever begin
#1 clk=~clk;  
end
end
 
//initialize the rst 
  initial begin
   #20 rst=0;
    #20 rst=1;
    //#102 rst=1;
  end
  
  //interfaces innstantiation
  in_intf intf1( clk,rst);
  mem_intf intf2( clk,rst);
  out_intf intf3( clk,rst);
  
  //test instantiation
  test t1(intf1,intf2,intf3);
  
  //switch module instantiation
  
  switch s1(.clk(clk),
            .reset(rst),
            .data_status(intf1.data_status),
            .data(intf1.data_in),
            .port0(intf3.port_0),
            .port1(intf3.port_1),
            .port2(intf3.port_2),
            .port3(intf3.port_3),
            .ready_0(intf3.ready_0),
            .ready_1(intf3.ready_1),
            .ready_2(intf3.ready_2),
            .ready_3(intf3.ready_3),
            .read_0(intf3.read_0),
            .read_1(intf3.read_1),
            .read_2(intf3.read_2),
            .read_3(intf3.read_3),
            .mem_en(intf2.mem_en),
            .mem_rd_wr(intf2.mem_rd_wr),
            .mem_add(intf2.mem_addr),
            .mem_data(intf2.mem_data));
  
  //for generating the waveforms writting the dump file.
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
     //#100 $finish;
  end
  
endmodule:tb_top