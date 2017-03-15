if not User.exists? name: 'first_user'
    user = UserSeedRegistrar.new('first_user','adam.adams@devel.io','password').register
    user.person.monickers.create kind: 'fullname', primary: 'true', name: ThreeName.create(title: 'Mr.', given: 'Adam', middle: 'Amos', family: 'Adams', suffix: 'Jr.')
end