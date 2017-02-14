class AutoLogin < ApplicationRecord
  belongs_to :login
  
  before_save AutoLoginUniqueId.new
end
