class Permission < ApplicationRecord
  belongs_to :parent
  has_many :children, class: 'Permission', inverse_of: :parent
  has_many :rights
  has_many :roles, through: :rights
end
