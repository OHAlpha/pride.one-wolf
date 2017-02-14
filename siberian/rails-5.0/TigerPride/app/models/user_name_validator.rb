class UserNameValidator < ActiveModel::Validator
    def validate(record)
        record.name.nil? or (User.where(name: record.name).first.nil? and Login.where(name: record.name).first.nil?)
    end
end