class Patient < ApplicationRecord
  belongs_to :doctor
  has_one :user, as: :resource
  has_many :appointments
  has_many :prescriptions
  has_many :drug_reminders

  accepts_nested_attributes_for :user, reject_if: :all_blank, allow_destroy: true
end
