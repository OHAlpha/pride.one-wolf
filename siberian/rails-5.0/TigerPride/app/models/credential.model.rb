class Credential < ApplicationRecord
  belongs_to :account
  
  before_save CredentialUniqueId.new
end
