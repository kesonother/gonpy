class Picture
  include Mongoid::Document
  include Mongoid::Paperclip

  embedded_in :proaccount

  has_mongoid_attached_file :image,:styles => { :medium => "300x300>",:thumb => "50x50>" }
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
end
