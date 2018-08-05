require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  describe "POST graphql" do
    let(:schema) { spy(Schema) }
    let(:query) do
      File.read(Rails.root.join('spec', 'fixtures', 'graphql', 'query', 'create_pdv.graphql'))
    end

    let(:variables) do
      File.read(Rails.root.join('spec', 'fixtures', 'graphql', 'query', 'variable_create_pdv.json'))
    end

    let(:body) {
      {query: query,
      variables: variables}
    }

    subject(:request) {
      post :graphql, params: body
    }

    it { is_expected.to have_http_status(:ok) }
    its(:content_type) { is_expected.to eq("application/json") }

    context 'should have received Schema.execute' do
      before do
        allow_any_instance_of(described_class).to receive(:schema) { schema }
        allow(schema).to receive(:execute)
      end

      it do
        subject
        expect(schema).to have_received(:execute)
                      .with(query, variables: JSON.parse(variables))
      end
    end

    context 'should handler any exception' do
      before do
        allow_any_instance_of(described_class).to receive(:schema) { schema }
        allow(schema).to receive(:execute).and_raise(ArgumentError)
      end

      it { is_expected.to have_http_status(:internal_server_error) }
      its(:content_type) { is_expected.to eq("application/json") }

      it do
        request
        expect(JSON.parse(response.body)).to have_key('error')
      end

      it do
        request
        expect(JSON.parse(response.body)['data']).to eql({})
      end
    end
  end
end
