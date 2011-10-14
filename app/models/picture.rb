class Picture
  include Mongoid::Document
  include Mongoid::Paperclip

  embedded_in :proaccount

  has_mongoid_attached_file :image,:styles => { :medium => "500x500>",:thumb => "50x50>",:small => "200x200>" }
  #attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  #after_update :reprocess_image, :if => :cropping?
  
   def cropping?  
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?  
  end  
   
  def image_geometry(style = :original)  
    @geometry ||= {}  
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))  
  end 
  
  private  
  def reprocess_image  
    image.reprocess!  
  end  
  


end
