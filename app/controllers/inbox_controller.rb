class InboxController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user.proaccount.nil?  
      @recipients = current_user.bids.all
      @mail = current_user.bids.find(params[:bid_id]) if params[:bid_id]
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
   
    if current_user.proaccount.nil?  
      @messages = current_user.requests.all
    else
      @messages = current_user.proaccount.bids.all
    end
    respond_to do |format|
      format.html # receive.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
 
end
