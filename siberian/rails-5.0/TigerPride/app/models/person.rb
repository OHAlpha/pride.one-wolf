class Person < ApplicationRecord
    has_many :monickers
    has_one :primary_monicker, -> { where primary: true }, class_name: 'Monicker'
    has_many :emails
    has_one :primary_email, -> { where primary: true }, class_name: 'Email'
    has_many :residences
    has_one :primary_residence, -> { where primary: true }, class_name: 'Residence'
    has_many :phones
    has_one :primary_phone, -> { where primary: true }, class_name: 'Phone'
    has_many :users
    has_one :primary_user, -> { where primary: true }, class_name: 'User'
end
