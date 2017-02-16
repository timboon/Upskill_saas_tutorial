class Users::RegistrationsController < Devise::RegistrationsController
 before_action :select_plan, only: :new
 
 
 # Extend default Devise gem behaviour, so that users signing up with 
 # the Pro account (plan id 2), save with a Stripe subscription function
 # Otherwise Devise signs up user as usual (basic users)
 
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
  
# Private means this function can only be used in this controller file
# hides the function from the public
# select_plan stops users from manipulating the params in the url
# checks to see if plan == 1 or 2 otherwise redirect to home page

  private
    def select_plan
      unless (params[:plan] == '1' || params[:plan] =='2')
        flash[:notice] = "Please select a membership plan to sign up"
        redirect_to root_url
      end
    end
end