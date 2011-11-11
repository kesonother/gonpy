class PostrequestController < ApplicationController
  
    def new
    if params[:query].nil?
      @request = Request.new(params[:request]) 
      @proaccount = Proaccount.new
      @user = User.new
    else
      @proaccount = Proaccount.find(params[:query])   
      @request = @proaccount.requests.new
    end

    respond_to do |format|
      if user_signed_in?
        format.html { render :template => 'requests/new' }    
      else
        format.html # index.html.erb
        format.xml  { render :xml => @request }         
      end

    end
  end
  
  def create
    respond_to do |format|

        format.html
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end
end
