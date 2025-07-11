`include "transaction_ag1.sv"
`include "generator_ag1.sv"
`include "driver_ag1.sv"

class agent_1;

  generator_ag1 gen1;
  driver_ag1 driv1;
  
  
  
  mailbox gen2driv_ag1;
  mailbox ag22ag1;
  
  virtual in_intf intf1;
  
  function new(virtual in_intf intf1,mailbox gen2driv_ag1,mailbox ag22ag1);
    
   this.gen2driv_ag1=gen2driv_ag1;
    this.intf1=intf1;
    gen1=new(gen2driv_ag1,ag22ag1);
    driv1=new(intf1,gen2driv_ag1);
  endfunction:new
  
  //for calling the reset task
  task reset();
    driv1.reset();
   endtask:reset
  
  //task for the calling the run task in driver and generator
  task run();
    fork
     gen1.run();
     driv1.run();
    join_any
  endtask:run
  
  
endclass:agent_1