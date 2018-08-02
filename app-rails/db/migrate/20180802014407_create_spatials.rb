class CreateSpatials < ActiveRecord::Migration[5.2]
  def change
    create_table :spatials do |t|
      t.geometry :geo
      t.multi_polygon :poly
      t.point :latlon, :geographic => true

      t.index :poly, using: :gist
      t.index :geo, using: :gist
      t.index :latlon, using: :gist

      t.timestamps
    end
  end
end
