class QueuedUser < ApplicationRecord
    validates_with UserNameValidator
    validates_with UserEmailValidator
    
    before_save QueuedUserUniqueId.new
end
