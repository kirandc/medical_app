class PatientSerializer < ActiveModel::Serializer
  attributes :id, :doctor_id, :past_history, :allergy, :family_history, :notes
  has_one :user
end
