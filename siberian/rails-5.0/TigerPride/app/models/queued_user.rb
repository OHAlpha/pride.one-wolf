class QueuedUser < ApplicationRecord
    validates_with UserNameValidator
    validates_with UserEmailValidator
    
    before_create QueuedUserUniqueId.new
end
