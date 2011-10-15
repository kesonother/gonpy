class Category
  include Mongoid::Document
  
  field :libelle_category
  
  has_many :requests
end
