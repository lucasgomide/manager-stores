# frozen_string_literal: true

Rails.application.routes.draw do
  match 'graphql' => 'graphql#graphql', via: %i[get post]
end
