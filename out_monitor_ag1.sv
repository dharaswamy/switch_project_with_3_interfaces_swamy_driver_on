//output monitor for monitoring the sampled values of DUT and send this data to the 
//-mailbox for scoreboard_ag1

class op_monitor_ag1;
  
//required the transaction class handle
transaction_ag1 trans; 

  
//mailbox for exchange the data between the  output_mntr to scb
mailbox op_mnt2scb_ag1;
 
//need the output virtual interface
virtual out_intf intf;
  
//writting the default constructor
  
function new(virtual out_intf intf,mailbox op_mnt2scb);
 this.intf=intf;
 this.op_mnt2scb=op_mnt2scb;
endfunction:new

  task run();
  forever begin  
   
wait(ready_0||ready_1||ready_2||ready_3);

    if(ready_0) begin
      @(posedge intf.clk);
      //inft.read_0<=1;
      @(posedge intf.clk);
      
      
      
    end
      
    
  
  end
  endtask:run
  
  
  
endclass:op_monitor_ag1