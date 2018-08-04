# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  post '/graphql', to: 'graphql#execute'
end
