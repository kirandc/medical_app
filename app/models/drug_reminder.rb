class DrugReminder < ApplicationRecord
  belongs_to :prescription
  belongs_to :patient

  validates :reminder_message, presence: true
end
