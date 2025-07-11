
`include "agent_1.sv"
`include "agent_2.sv"
class environment;
//agent1 class declaration
  agent_1 ag1;
  agent_2 ag2;
  
//mailboxs for the exachange the data between the components
mailbox gen2driv_ag1;
mailbox gen2driv_ag2;
  mailbox ag22ag1;
  
//virtual interfaces handles for interaction
  virtual in_intf intf1;
  virtual mem_intf intf2;
  virtual out_intf intf3;
  
  function new(virtual in_intf intf1,virtual mem_intf intf2,virtual out_intf intf3);
    gen2driv_ag1=new();//mailbox creation
    gen2driv_ag2=new();//mailbox creation
    ag22ag1=new();//mailbox creation
    this.intf1=intf1;
    this.intf2=intf2;
   // this.intf3=intf3;
    ag1=new(intf1,gen2driv_ag1,ag22ag1);
    ag2=new(intf2,gen2driv_ag2,ag22ag1);
    
endfunction:new
  
  
  //calling the reset tasks from the ag1 and ag2
  task pre_test();
   fork
    ag1.reset();
     ag2.reset();
   join
  endtask:pre_test
  
  
  //calling the run task in the ag1 and ag2
  task test();
    fork 
     ag1.run();
     ag2.run();
    join_any
  endtask:test
  
  //terminates/killes the simulation
  task post_test();
    
   #1000 $finish; 
    
  endtask:post_test
  
  
  task run();
    
    pre_test();
    test();
    post_test();
    
  endtask:run
  
endclass:environment
