class AddNewAddressColumnsToPlacesTable < ActiveRecord::Migration
  def change
    add_column :places, :city, :string
    add_column :places, :province, :string
    add_column :places, :street_number, :integer
    add_column :places, :street, :string
  end
end