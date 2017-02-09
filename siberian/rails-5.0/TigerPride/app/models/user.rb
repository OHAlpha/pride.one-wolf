require 'app/models/model_config/user_associations'
require 'app/models/model_config/user_serializers'
class User < ApplicationRecord
  belongs_to :person
  
  include ModelConfig::UserAssociations
  include ModelConfig::UserSerializers
end
