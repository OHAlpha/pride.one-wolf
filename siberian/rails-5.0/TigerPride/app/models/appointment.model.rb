class Appointment < ApplicationRecord
  belongs_to :account
  belongs_to :role
  belongs_to :authorized_by, class_name: 'Account'
  
  before_save AppointmentUniqueId.new
end
