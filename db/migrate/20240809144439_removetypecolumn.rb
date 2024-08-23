class Removetypecolumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :ambulances, :type, :string
  end
end
