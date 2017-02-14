class Relationship < ApplicationRecord
  belongs_to :person_a, class_name: 'Person'
  belongs_to :person_b, class_name: 'Person'
  belongs_to :added_by, class_name: 'Account'
end
