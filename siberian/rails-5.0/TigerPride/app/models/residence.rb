class Residence < ApplicationRecord
  belongs_to :person
  belongs_to :address, polymorphic: true
end
