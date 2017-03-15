class UserEmailValidator < ActiveModel::Validator
    def validate(record)
        if record.email.nil?
            true
        else
            es = record.email.split '@'
            !Login.joins(:email).exists? emails: {address: es[0], provider: es[1]}
        end
    end
end