module ModelConfig::UserSerializers
  extend ActiveSupport::Concern

  included do
    serialize :perm_override, Hash
    serialize :auxillary, Hash
  end
end