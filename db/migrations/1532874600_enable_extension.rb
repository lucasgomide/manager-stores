# frozen_string_literal: true

Sequel.migration do
  up { run 'CREATE EXTENSION postgis' }
end
