class UserEmailValidator < ActiveModel::Validator
    def validate(record)
        record.email.nil? or Login.where(email: record.email).first.nil?
    end
end