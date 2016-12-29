class Role < ApplicationRecord
    has_many :assignments
    has_many :users, through: :assignments
    has_many :rights
    has_many :permissions, through: :rights
end
