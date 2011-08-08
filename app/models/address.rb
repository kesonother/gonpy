class Address
  include Mongoid::Document

  field :street, :type => String
  field :city, :type => String
  field :zipcode, :type => Integer
  field :longitude, :type => Float
  field :latitude, :type => Float
  
  validates_numericality_of :zipcode, even: true
  embedded_in :proaccount
end
