class AddsNumberOfPeopleLookedForColumnToPlacesTable < ActiveRecord::Migration
  def change
  	add_column :places, :looked_for, :integer
  end
end