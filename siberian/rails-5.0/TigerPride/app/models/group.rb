class Group < ApplicationRecord
    has_many :members
    has_many :users, through: :members
    has_many :forced_group_emails
    has_many :forced_group_ips
end
