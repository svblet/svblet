class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :image
      t.text :caption
      t.references :place, index: true

      t.timestamps
    end
  end
end
