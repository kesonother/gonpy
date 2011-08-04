class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end
  
  def create
     super # creates the @user
  end
  
end
