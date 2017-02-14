class Role < ApplicationRecord
  belongs_to :organization
  belongs_to :added_by, class_name: 'Account'
  
  before_save RoleUniqueId.new
end
