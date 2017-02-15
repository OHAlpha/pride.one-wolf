class Credential < ApplicationRecord
  belongs_to :account
  
  before_create CredentialUniqueId.new
end
