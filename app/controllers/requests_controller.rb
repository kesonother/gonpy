class RequestsController < ApplicationController
  #before_filter :authenticate_user!
  #autocomplete :category, :libelle_category
  # GET /requests
  # GET /requests.xml
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    if params[:query].nil?
      @request = Request.new(params[:request]) 
      @proaccount = Proaccount.new
    else
      @proaccount = Proaccount.find(params[:query])   
      @request = @proaccount.requests.new
    end
    #if Proaccount.find(params[:id])      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @request }
      end
    #end
  end


  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.xml
  def create
    
    
    if current_user.nil?
      #@proaccount = Proaccount.find(params[:request][:proaccount_id]) 
      @request = Request.new(params[:request])
    else
      @request = current_user.requests.new(params[:request]) #Request.new(params[:request])    
    end

#@proaccounts = Proaccount.categories.find(params[:request][:category_id])
    respond_to do |format|
      if @request.save
        
#       @proaccounts = Proaccount.where(params[:request][:zipcode]).and(category: params[:request][:category])

        #format.html { render :template => 'postrequest/create' }  
        format.html { redirect_to(@request, :notice => 'Request was successfully created.') }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to(@request, :notice => 'Request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    if current_user.nil?
      
      @request = Request.find(params[:id])
      @request.destroy

      respond_to do |format|
        format.html { redirect_to(requests_url) }
        format.xml  { head :ok }
      end
    else
     redirect_to "/public/404.html", :status => 404
    end
  end
end


def create_bid
    @messages = current_user.proaccount.bid.new(param[:bid])
    
    respond_to do |format|
      format.html # receive.html.erb
      format.xml  { render :xml => @messages }
    end
  end