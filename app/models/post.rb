class Post
  include Mongoid::Document
  field :title
  field :details
  field :postal_code
  field :brand_name
  validates_presence_of :title,:postal_code,:details
  validates_numericality_of :postal_code, even: true
  
  referenced_in :service
end
