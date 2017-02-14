require 'openssl'

if User.where(name: 'admin').first.nil?
    user = UserSeedRegistrar.new('admin','lnugentgibson@gmail.com','password').register
    user.person.monickers.create kind: 'fullname', primary: 'true', name: ThreeName.create(given: 'Lloyd', middle: 'Nugent', family: 'Gibson')
end

if User.where(name: 'first_user').first.nil?
    user = UserSeedRegistrar.new('first_user','adam.adams@devel.io','password').register
    user.person.monickers.create kind: 'fullname', primary: 'true', name: ThreeName.create(title: 'Mr.', given: 'Adam', middle: 'Amos', family: 'Adams', suffix: 'Jr.')
end