class Recipientrequest
  include Mongoid::Document
  
  
  belongs_to :proaccount
  belongs_to :request
  belongs_to :bid
end
