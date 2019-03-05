class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :username
      t.string      :mobile
      t.string      :landline
      t.string      :email
      t.string      :gender
      t.datetime    :dob
      t.string      :profile_image
      t.boolean     :is_active,            default: false
      t.string      :resource_type
      t.integer     :resource_id
      t.date        :registered_on
      t.string      :name
      t.string      :uuid
      t.boolean     :is_app_installed,     default: false
      t.references  :role
      t.timestamps
    end
    add_index :users, :username,        unique: true
    add_index :users, :email,           unique: true
    add_index :users, [:resource_type, :resource_id], unique: true
  end
end
