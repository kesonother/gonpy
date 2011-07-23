class Address
  include Mongoid::Document
  field :street, :type => String
  field :zipcode, :type => Integer
  field :longitude, :type => Float
  field :latitude, :type => Float
  
  #embedded_in :business
end
