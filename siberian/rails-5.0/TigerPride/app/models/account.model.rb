class Account < ApplicationRecord
  belongs_to :user
  has_one :credential
  has_many :logins
  
  before_create AccountUniqueId.new
  
  def primary_login
      logins.find_by primary: true
  end
  
  def self.admin
      find_by name: 'admin'
  end
  
  def self.admin!
      find_by! name: 'admin'
  end
end
