
class PicturesController < ApplicationController
  
  def create

    @picture =  current_user.proaccount.pictures.new(params[:picture])

    #@picture.image= params[:file]
    #@image = resize_and_crop("http://www.google.com/images/logos/logo.png",200)
    respond_to do |format|
      if @picture.save
        #@address = @proaccount.build_address()
        flash[:notice] = "La modification de votre profil a ete prise en compte!"
        format.html { redirect_to(proaccounts_photo_path(), :notice => 'Service was successfully updated.') }
      else
        format.html { redirect_to(proaccounts_edit_photo_path(), :notice => "Service wasn't successfully updated.")}
      end
    end
  end
  
def update  
   @picture =  current_user.proaccount.pictures.find(params[:id])  

  if @picture.update_attributes(params[:picture])  
    flash[:notice] = "Successfully updated picture."  
    if params[:picture][:image].blank?  
      redirect_to(proaccounts_edit_photo_path())  
    else  
      redirect_to(proaccounts_photo_path())
    end  
  else  
    #render :action => 'edit'  
  end  
end 

def destroy  
   @picture =  current_user.proaccount.pictures.find(params[:id])  
   @picture.destroy  
    flash[:notice] = "Successfully destroyed product."  
    redirect_to(proaccounts_edit_photo_path())
end
 
end
