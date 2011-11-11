class Category
  include Mongoid::Document
  
  field :libelle_category
  
  has_many :requests
  has_many :proaccounts
end
