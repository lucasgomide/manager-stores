Sequel.migration do
  change do
    create_table(:coverage_areas) do
      primary_key :id
      foreign_key :store_id, :stores, null: false, index: true
      column :coordinates, 'geometry', null: false
    end
  end
end
