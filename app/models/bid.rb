class Bid
  include Mongoid::Document
  field :content
  
  has_one :user
  belongs_to :proaccount
end
