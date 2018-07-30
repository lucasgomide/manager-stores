# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:addresses) do
      primary_key :id
      foreign_key :store_id, :stores, null: false, index: true
      column :coordinates, 'geometry', null: false
    end
  end
end
