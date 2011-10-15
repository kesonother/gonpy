class Message
  include Mongoid::Document
  
  field :answer, :type => Boolean
  
  has_many :recipients , :class_name => "Proaccount" 
  has_many :requests 
  has_many :messages
end
