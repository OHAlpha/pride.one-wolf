class OtherAddress < ApplicationRecord
    has_many :residences, as: :address
end
