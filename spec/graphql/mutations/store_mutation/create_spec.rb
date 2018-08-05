# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::StoreMutation::Create do
  describe '#call' do
    let(:creation_service) { instance_spy(Services::StoreService::Creation) }
    let(:graphql_error) { spy(GraphQL::ExecutionError) }

    let(:obj) { nil }
    let(:args) { { first: 'first argument' } }
    let(:ctx) { nil }

    subject(:service) { described_class.new(creation_service, graphql_error) }
    subject(:creation) { service.call(obj, args, ctx) }

    context 'call store creation service' do
      it do
        subject
        expect(creation_service).to have_received(:call).with(args)
      end
    end

    context 'any error has raised' do
      let(:error) { ArgumentError.new('any error was raised') }
      before do
        allow(creation_service).to receive(:call).and_raise(error)
      end
      it do
        subject
        expect(graphql_error).to have_received(:new).with(error.message)
      end
    end
  end
end
