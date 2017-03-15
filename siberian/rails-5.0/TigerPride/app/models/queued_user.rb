class QueuedUser < ApplicationRecord
    validate :user_exists?
    validate :account_exists?
    validate :email_exists?
    
    before_create QueuedUserUniqueId.new
    
    def user_exists?
        if not name.nil? and User.exists? name: name
            errors.add :name, 'user with that name already exists'
        end
    end
    
    def account_exists?
        if not name.nil? and Account.exists? name: name
            errors.add :name, 'account with that name already exists'
        end
    end
    
    def email_exists?
        if not email.nil?
            es = email.split '@'
            if Login.joins(:email).exists? emails: {address: es[0], provider: es[1]}
                errors.add :email, 'email already in use'
            end
        end
    end
end
