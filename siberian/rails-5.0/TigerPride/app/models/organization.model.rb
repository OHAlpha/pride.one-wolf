class Organization < ApplicationRecord
  belongs_to :parent, class_name: 'Organization'
  belongs_to :permission_set
  belongs_to :added_by, class_name: 'Account'
  has_many :groups
  
  before_save OrganizationUniqueId.new
  after_create OrganizationDefaultGroups.new
  before_destroy OrganizationDefaultGroups.new
end
