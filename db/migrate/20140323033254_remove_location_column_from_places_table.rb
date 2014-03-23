class RemoveLocationColumnFromPlacesTable < ActiveRecord::Migration
  def change
    remove_column :places, :location
  end
end
