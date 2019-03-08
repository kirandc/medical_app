class PrescriptionSerializer < ActiveModel::Serializer
  attributes :id, :complaints, :findings, :instructions, :date
  has_many :prescription_drugs

  def date
    object.created_at.strftime("%d/%m/%Y")
  end
end
