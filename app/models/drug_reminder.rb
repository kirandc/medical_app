class DrugReminder < ApplicationRecord
  belongs_to :prescription_id
  belongs_to :patient_id

  validates :reminder_message, presence: true
end
