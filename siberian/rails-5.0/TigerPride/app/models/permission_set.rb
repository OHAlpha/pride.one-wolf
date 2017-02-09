class PermissionSet < ApplicationRecord
  has_one :organization
  has_many :permissions
end
