class User < ApplicationRecord
  belongs_to :person
  has_many :accounts
  has_many :members
  has_many :organizations, through: :members
  has_many :assignments
  has_many :groups, through: :assignments
  has_many :appointments
  has_many :roles, through: :appointments
  
  serialize :perm_override, Hash
  serialize :auxillary, Hash
  
  before_create UserUniqueId.new
  
  def main_account
    accounts.where(name: 'main').first
  end
end
