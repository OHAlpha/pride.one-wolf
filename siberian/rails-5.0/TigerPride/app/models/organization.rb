require 'app/models/model_config/organization_associations'
require 'app/models/model_config/organization_serializers'
class Organization < ApplicationRecord
  belongs_to :permission_set
  
  include ModelConfig::OrganizationAssociations
  include ModelConfig::OrganizationCallbacks
end
