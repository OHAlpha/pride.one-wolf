class QueuedUserValidator < ActiveModel::Validator
    def validate(record)
        name = UserNameValidator.new.validate(record)
        email = UserEmailValidator.new.validate(record)
        puts "name: #{name}, email: #{email}"
        name and email
    end
end