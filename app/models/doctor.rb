class Doctor < ApplicationRecord
  has_one :user, as: :resource
  has_many :appointments
  has_many :prescriptions
  has_many :patients

  validates :specialization, presence: true
end
