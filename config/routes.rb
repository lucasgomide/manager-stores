# frozen_string_literal: true

Rails.application.routes.draw do
  post 'graphql', to: 'graphql#graphql'
end
