class Group < ApplicationRecord
  belongs_to :organization
  belongs_to :added_by, class_name: 'Account'
  
  before_save GroupUniqueId.new
end
