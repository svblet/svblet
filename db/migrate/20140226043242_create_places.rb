class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :user, index: true

      t.timestamps
    end
  end
end
