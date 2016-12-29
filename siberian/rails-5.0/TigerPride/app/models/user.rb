class User < ApplicationRecord
  belongs_to :person
  has_many :auto_logins
  has_many :members
  has_many :groups, through: :members
  has_many :assignments
  has_many :roles, through: :assignments
end
