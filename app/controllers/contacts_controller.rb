class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success]="Message Sent"
     redirect_to new_contact_path
    else 
      #full messages makes rails turn them into sentences, join links them together using the , and space. errors saved in array
      flash[:error]=@contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
  
end
