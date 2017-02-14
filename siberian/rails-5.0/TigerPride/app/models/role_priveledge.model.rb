class RolePriveledge < ApplicationRecord
  belongs_to :owner
  belongs_to :target
  belongs_to :added_by, class_name: 'Account'
end
