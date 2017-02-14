class Monicker < ApplicationRecord
  belongs_to :person
  belongs_to :name, polymorphic: true
  belongs_to :added_by, class_name: 'Account'
  
  before_save MonickerUniqueId.new
end
