class Monicker < ApplicationRecord
  belongs_to :person
  belongs_to :name, polymorphic: true
end
