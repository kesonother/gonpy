
class PicturesController < ApplicationController
  
  def create

    @picture =  current_professional.proaccount.pictures.new(params[:picture])

    #@picture.image= params[:file]
    #@image = resize_and_crop("http://www.google.com/images/logos/logo.png",200)
    respond_to do |format|
      if @picture.save
        #@address = @proaccount.build_address()
        flash[:notice] = "La modification de votre profil a ete prise en compte!"
        format.html { redirect_to(proaccounts_edit_photo_path(), :notice => 'Service was successfully updated.') }
      else
        format.html { redirect_to(proaccounts_edit_photo_path(), :notice => "Service wasn't successfully updated.")}
      end
    end
  end
  
  def resize_and_crop(image, size)         
    if image.width < image.height   
      remove = ((image.height - image.width)/2).round 
      image.shave("0x#{remove}") 
    elsif image.width > image.height 
      remove = ((image.width - image.height)/2).round
      image.shave("#{remove}x0")
    end
    image.resize("#{size}x#{size}")
    return image
  end
end
