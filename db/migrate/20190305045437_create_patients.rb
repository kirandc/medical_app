class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.integer :doctor_id
      t.text    :past_history
      t.text    :allergy
      t.text    :family_history
      t.text    :notes
      t.timestamps
    end
    add_index :patients, :doctor_id
  end
end
