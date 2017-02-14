class Phone < ApplicationRecord
  belongs_to :person
  belongs_to :added_by, class_name: 'Account'
end
