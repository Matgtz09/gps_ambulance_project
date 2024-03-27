class CreateHospitalTable < ActiveRecord::Migration[7.1]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :phone_number, null: false
      t.string :email_address
      t.string :emergency_contact
      t.integer :capacity, null: false
      t.string :specialties
      t.string :operating_hours, null: false
      t.string :insurance_accepted
      t.string :website
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
