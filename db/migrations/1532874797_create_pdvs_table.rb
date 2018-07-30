# frozen_string_literal: true

Sequel.migration do
  change do
    create_table(:stores) do
      primary_key :id
      String :tranding_name, null: false
      String :owner_name, null: false
      String :document, null: false
      index :document, unique: true
    end
  end
end
