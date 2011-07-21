class Address 
  include Mongoid::Document
  field :street
  field :zipcode
  field :longitude 
  field :latitude
  #attr_accessible :street, :zipcode, :longitude, :latitude
  belongs_to :business
end
