class Prescription < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :appointment

  has_many :prescription_drugs
  has_many :drug_reminders
end
