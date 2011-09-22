class Picture
  include Mongoid::Document
  
  mount_uploader :image, ImageUploader
  
  embedded_in :proaccount
  
end
