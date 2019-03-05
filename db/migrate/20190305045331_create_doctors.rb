class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string   :specialization
      t.string   :qualifications
      t.string   :signature
      t.timestamps
    end
  end
end
