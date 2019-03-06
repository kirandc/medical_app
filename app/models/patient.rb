class Patient < ApplicationRecord
  belongs_to :doctor
  has_one :user, as: :resource
  has_many :appointments
  has_many :prescriptions
  has_many :drug_reminders
end
