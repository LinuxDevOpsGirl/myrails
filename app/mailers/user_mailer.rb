class UserMailer < ActionMailer::Base
    default :from => "noreply@bmxmdb.com"
    
    def activation_instructions(user)
       @account_activation_url = user.perishable_token
      mail(:to => user.email, :subject => "BMX Movie Database - Account Activation")
    end
    
    def activation_confirmation(user)
      @root_url = "http://bmxmdb.com"
      mail(:to => user.email, :subject => "BMX Movie Database - Account Confirmation")
    end
    
    def password_reset(user)
      @edit_password_reset_url = edit_password_reset_url(user.perishable_token, :host => 'bmxmdb.com')
      mail(:to => user.email, :subject => "BMX Movie Database - Password Reset")
    end
    
end