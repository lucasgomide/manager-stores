class CreateCoverageAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :coverage_areas do |t|
      t.references :store, foreign_key: true
      t.multi_polygon :coordinates

      t.timestamps

      t.index :coordinates, using: :gist
    end
  end
end
