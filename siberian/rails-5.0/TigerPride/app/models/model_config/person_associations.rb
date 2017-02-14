module ModelConfig::UserAssociations
  extend ActiveSupport::Concern

  included do
    has_many :auto_logins
    has_many :members
    has_many :organizations, through: :members
    has_many :assignments
    has_many :groups, through: :assignments
    has_many :appointments
    has_many :roles, through: :appointments
  end
end