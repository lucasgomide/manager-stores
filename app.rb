#! /usr/bin/env ruby
# frozen_string_literal: true
require_relative 'config/boot'
require 'pry'
require 'sinatra/base'
require "sinatra/sequel"

files = Dir.glob(File.join(Application.root, 'app', '**','**', '*rb'))
files.each { |file| require file }

class ManagerPOS < Sinatra::Base
  register Sinatra::SequelExtension

  configure do
    set :database, Application.configuration.database.url
  end

  configure :development do
    database.loggers << Logger.new(STDOUT)
  end

  get '/graphql' do
    query = params['query']
    variables = params['variables']
    result = Schema.execute(query, variables: variables)
    result.to_json
  end

  post '/graphql' do
    params = JSON.parse(request.body.read)
    query = params['query']
    variables = params['variables']
    result = Schema.execute(query, variables: variables)
    result.to_json
  end

  before do
    content_type :json
  end

  run! if app_file == $0
end
