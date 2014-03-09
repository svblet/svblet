class RenameLookedForColumnToLookingForColumnInPlacesTable < ActiveRecord::Migration
  def change
  	rename_column :places, :looked_for, :looking_for
  end
end