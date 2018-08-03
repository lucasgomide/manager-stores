class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :store, foreign_key: true
      t.st_point :coordinates, geographic: true, null: false

      t.timestamps
    end
  end
end
