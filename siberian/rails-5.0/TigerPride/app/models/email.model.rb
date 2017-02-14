class Email < ApplicationRecord
  belongs_to :person
  belongs_to :added_by, class_name: 'Account', optional: true
  
  def email
    address + '@' + provider
  end
end
