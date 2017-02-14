class Account < ApplicationRecord
  belongs_to :user
  has_many :credentials
  has_many :logins
  
  before_save AccountUniqueId.new
  
  def primary_login
      logins.where(primary: true).first
  end
  
  def self.admin
      find 1 rescue nil
  end
end
