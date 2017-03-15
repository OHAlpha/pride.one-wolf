class Residence < ApplicationRecord
  belongs_to :person
  belongs_to :address, polymorphic: true
  belongs_to :added_by, class_name: 'Account'
  
  before_create ResidenceUniqueId.new
end
