class UserNameValidator < ActiveModel::Validator
    def validate(record)
        user = !User.exists?(name: record.name)
        account = !Account.exists?(name: record.name)
        puts "user: #{user}, account: #{account}"
        record.name.nil? or (user and account)
    end
end