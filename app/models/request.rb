class Request
  include Mongoid::Document
  
  field :subject, :type => String  
  field :zipcode, :type => Integer
  field :details, :type => String
  field :activate, :type => Boolean
  field :choice, :type => Boolean  
  #field :libelle_category
  field :category
  field :traveltome, :type => Boolean
  field :itravel, :type => Boolean
  field :neither, :type => Boolean
  field :first_name
  field :last_name
  field :email

  belongs_to :user
  has_many :recipientrequests
  has_many :bids
  
  after_create :prepare_copies
  #belongs_to :category
  #referenced_in :category
  
  def prepare_copies

    @proaccounts = Proaccount.where(zipcode.to_s()).and(category: category)
    #return if @proaccounts.blank?
    
    @proaccounts.each do |pro| 
      @recipient = Recipientrequest.create(:proaccount_id => pro.id,:request_id => id)
    end 
  end
end
