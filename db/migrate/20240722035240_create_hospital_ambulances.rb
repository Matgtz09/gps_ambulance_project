class CreateHospitalAmbulances < ActiveRecord::Migration[7.1]
  def change
    create_table :hospital_ambulances do |t|
      t.references :hospital, null: false, foreign_key: true
      t.references :ambulance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
