class SearchController < ApplicationController
  
  def index
    @proaccounts = Proaccount.all
    
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proaccount }
    end
  end

end
