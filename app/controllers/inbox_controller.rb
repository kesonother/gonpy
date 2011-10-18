class InboxController < ApplicationController
  
  def receive
    @messages = current_professional.proaccount.requests.all
    
    respond_to do |format|
      format.html # receive.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
  def send
    @messages = current_professional.proaccount.requests.all
    
    respond_to do |format|
      format.html # receive.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
end
