class Picture
  include Mongoid::Document
  
  mount_uploader :image, ImageUploader
  
  belongs_to :proaccount
  
end
