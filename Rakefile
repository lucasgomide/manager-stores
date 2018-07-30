require File.expand_path('config/application', __dir__)

namespace :db do
  database_name = Application.configuration.database.name

  desc "Create the database"
  task :create do
    sh "createdb #{database_name}"
  end

  desc "Drop the database"
  task :drop do
    sh "dropdb #{database_name}"
  end

  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    require "sequel/core"
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(
      Application.configuration.database.url
    ) do |db|
      Sequel::Migrator.run(db, "db/migrations", target: version)
    end
  end

  desc "Add the seed data"
  task :seed do
    ruby "./db/seeds.rb"
  end
end

desc "Open application console"
task :console do
  sh "irb -I. -r app.rb"
end
