class PermissionSet < ApplicationRecord
  before_save PermissionSetUniqueId.new
end
