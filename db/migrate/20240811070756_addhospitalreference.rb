class Addhospitalreference < ActiveRecord::Migration[7.1]
  def change
    add_reference :ambulances, :hospital, foreign_key: true
  end
end
