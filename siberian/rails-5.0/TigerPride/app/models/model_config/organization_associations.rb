module ModelConfig::OrganizationAssociations
  extend ActiveSupport::Concern

  included do
    has_many :groups
  end
end