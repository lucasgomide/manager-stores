# frozen_string_literal: true

Sequel.migration do
  change do
    alter_table(:addresses) do
      add_index :coordinates, type: 'GIST'
    end

    alter_table(:coverage_areas) do
      add_index :coordinates, type: 'GIST'
    end
  end
end
