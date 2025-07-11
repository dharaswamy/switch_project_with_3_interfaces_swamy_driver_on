class in_montior_ag1;
 //mailbox
  transaction_ag1 trans;
  mailbox mnt2scb_ag1;
  virtual in_intf intf;
  
  function  new(virtual in_intf intf,mailbox mnt2scb_ag1);
  this.mnt2scb_ag1=mnt2scb_ag1;
    this.intf=intf;
    endfunction:new
  
  task run();
    forever begin
      trans=new();
      @(negedge intf.clk);
      trans.data_status=intf.data_status;
      
      for(int=0;i<(trans.size-1);i++) begin
        trans.data_in[i]=intf.data_in;
       @(negedge intf.clk);  
      end
      
      
      
    end
    
  endtask:run
  
  
  
endclass:in_monitor_ag1