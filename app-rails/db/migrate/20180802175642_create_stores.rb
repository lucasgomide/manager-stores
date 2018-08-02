class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :document
      t.string :owner_name
      t.string :tranding_name

      t.timestamps
    end
  end
end
