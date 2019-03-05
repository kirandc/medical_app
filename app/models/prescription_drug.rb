class PrescriptionDrug < ApplicationRecord
  belongs_to :prescription

  validates :drug_name, presence: true
end
