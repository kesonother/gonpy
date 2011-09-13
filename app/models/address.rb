class Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  field :longitude, :type => Float
  field :latitude, :type => Float
  field :coordinates, :type => Array
  field :address
  
  validates_numericality_of :zipcode, even: true
  embedded_in :proaccount


end
