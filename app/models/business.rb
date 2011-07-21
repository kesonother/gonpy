class Business
  include Mongoid::Document
  field :business_name, :type => String
  field :business_description, :type => String
  field :mainphone, :type => Integer
  field :website, :type => String
  field :tags, :type => String
  field :headline, :type => String
  field :siret, :type => String
  
  has_one  :address
  accepts_nested_attributes_for :address
end
