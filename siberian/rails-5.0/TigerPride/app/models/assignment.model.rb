class Assignment < ApplicationRecord
  belongs_to :account
  belongs_to :group
  belongs_to :authorized_by, class_name: 'Account'
  
  before_save AssignmentUniqueId.new
end
