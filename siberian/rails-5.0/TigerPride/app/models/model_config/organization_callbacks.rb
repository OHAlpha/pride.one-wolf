module ModelConfig::OrganizationCallbacks
  extend ActiveSupport::Concern

  included do
    after_create OrganizationDefaultGroups.new
    before_destroy OrganizationDefaultGroups.new
  end
end