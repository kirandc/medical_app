class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :mobile, :landline, :email, :gender, :dob, :is_active, :registered_on, :name, :is_app_installed, :role_id

  def dob
    object.dob.strftime("%d/%m/%Y") if object.dob
  end
end
