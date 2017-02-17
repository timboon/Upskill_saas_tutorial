class ProfilesController < ApplicationController

# When user makes a GED to /users/:user_id/profile/new
  def new
   @profile = Profile.new
  end
  
end