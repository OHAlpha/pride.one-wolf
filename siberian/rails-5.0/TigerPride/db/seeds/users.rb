require 'openssl'

person = Person.create

t = ThreeName.create title: 'Mr.', given: 'Adam', middle: 'Amos', family: 'Adams', suffix: 'I'
Monicker.create kind: 'fullname', primary: 'true', name: t, person: person
Email.create address: 'adam.adams', provider: 'devel.io', kind: 'personal', primary: true, person: person

user = UserSeedRegistrar.new('first_user','adam.adams@devel.io','password').register
user.person = person