
class PicturesController < ApplicationController
  
  def create

    @picture =  current_professional.proaccount.pictures.new(params[:picture])
    @picture.image= params[:file]
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
  
end
