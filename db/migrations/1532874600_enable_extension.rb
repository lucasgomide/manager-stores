Sequel.migration do
  up { run 'CREATE EXTENSION postgis' }
end
