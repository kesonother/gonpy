class Post
  include Mongoid::Document
  field :title
  field :details
  field :postal_code
  field :libelle_service
  validates_presence_of :title,:postal_code,:details
  validates_numericality_of :postal_code, even: true
  
  referenced_in :service
  belongs_to :user
end
