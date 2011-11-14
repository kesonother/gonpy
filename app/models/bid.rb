class Bid
  include Mongoid::Document
  field :subject
  field :details
  
  belongs_to :user
  belongs_to :proaccount
  belongs_to :recipientrequest
  belongs_to :request

end
