class AccountMailer < ApplicationMailer
    default from: 'accounts@one-wolf.com'
    
    def welcome(user)
        @user = user
        mail(to: @user.person.primary_email)
    end
    
    def validate(email)
        @email = email
        @user = @login.person.user
        mail(to: @email.email)
    end
end
