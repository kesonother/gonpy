class InboxController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user.proaccount.nil?  
    #@recipients = current_user.requests.all
    else
      @recipients = current_user.proaccount.recipientrequests.all
      @bid = Bid.new
    end
    respond_to do |format|
      format.html # receive.html.erb
      format.xml  { render :xml => @recipients }
    end
  end
  
  def sendmail
    @messages = current_user.requests.all
    
    respond_to do |format|
      format.html # receive.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
end
