class ContactMailer < ActionMailer::Base
  default to:'o.wasse@iinet.net.au'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Contact form message')
  end
end
