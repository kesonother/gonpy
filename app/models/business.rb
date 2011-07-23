class Business
  include Mongoid::Document
  field :business_name
  field :business_description
  field :mainphone
  field :website
  field :tags
  field :headline
  field :siret
  field :street, :type => String
  field :zipcode, :type => Integer
  field :longitude, :type => Float
  field :latitude, :type => Float

#embeds_one :address, :autosave => true
#validates_associated :address
#accepts_nested_attributes_for :address

end
