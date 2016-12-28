class ContactsController < ApplicationController
  
  # GET request to /contact-us
  # Show new contact form
  def new
    @contact = Contact.new
  end
  
  # POST request /contacts
  def create
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    # Save the Contact object to the database
    if @contact.save
      # Store form field via paramaters, into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into the Contact Mailer
      # email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store success message in flash hash
      # and redirect to the new action
      flash[:success]="Message Sent"
     redirect_to new_contact_path
    else 
      #Full messages makes rails turn errors into sentences, 
      #join links them together using the , and space. errors saved in array
      flash[:danger]=@contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
  # To collect data from form, we need to use strong paramaters 
  # and white list the form fields that you want to save
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
  
end
