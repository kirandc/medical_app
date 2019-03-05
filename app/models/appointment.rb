class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_one :prescription

  validates :doctor, :patient, :start_time, :end_time, presence: true
end
