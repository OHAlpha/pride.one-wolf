class UsaAddress < ApplicationRecord
    has_many :residences, as: :address
end
