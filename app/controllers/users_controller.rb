class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # optimise the query to reduce database requests (as opposed to .all) SQL joins
    @users=User.includes(:profile)
  end

  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
  end


  
end