class ProfilesController < ApplicationController

# When user makes a GET to /users/:user_id/profile/new
  def new
   @profile = Profile.new
  end
  
  
# POST request /users/:user_id/profile
  def create
    @user = User.find(param[:user_id])
    @profile = @user.build_profile(profile_params)
  
  end
  
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
  
end