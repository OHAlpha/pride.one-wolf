class Member < ApplicationRecord
  belongs_to :account
  belongs_to :organization
  belongs_to :authorized_by, class_name: 'Account'
  
  before_save MemberUniqueId.new
end
