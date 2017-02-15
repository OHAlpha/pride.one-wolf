class Login < ApplicationRecord
  belongs_to :account
  belongs_to :email
  has_many :auto_logins
  
  before_create LoginUniqueId.new
  
  def user
      account.user
  end
end
