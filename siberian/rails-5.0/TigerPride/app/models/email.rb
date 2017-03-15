class Email < ApplicationRecord
  belongs_to :person
  belongs_to :added_by, class_name: 'Account'
  
  def email_string
    address + '@' + provider
  end
end
