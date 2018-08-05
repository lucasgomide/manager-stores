# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Schema do
  let(:variables) { {} }
  subject(:execute) do
    described_class.execute(
      query_string,
      variables: variables
    )
  end


  describe "#createPDV" do
    let(:query_string) do
      File.read(Rails.root.join('spec', 'fixtures', 'graphql', 'query', 'create_pdv.graphql'))
    end

    let(:variables) do
      JSON.parse(File.read(Rails.root.join('spec', 'fixtures', 'graphql', 'query', 'variable_create_pdv.json')))
    end

    context 'when creation successful created' do
      subject(:result) { execute["data"]["createPDV"] }

      its(['tradingName']) { is_expected.to eql(variables['tradingName']) }
      its(['ownerName']) { is_expected.to eql(variables['ownerName']) }
      its(['document']) { is_expected.to eql(variables['document']) }

      context 'for nested relationship' do
        context 'address' do
          subject { result['address'] }
          its(['coordinates']) { is_expected.to eql(variables['address']['coordinates']) }
        end

        context 'coverage_area' do
          subject { result['coverageArea'] }
          its(['coordinates']) { is_expected.to eql(variables['coverageArea']['coordinates']) }
        end
      end

      context 'when creation fails' do
        subject(:result) { execute["errors"] }

        let(:variables) { {
          ownerName: nil,
          tradingName: "Greece",
          document: "123131/312",
          coverageArea: { coordinates: nil },
          address: { coordinates: [1.0, 2.0] },
        } }

        it { is_expected.to_not be_nil }
      end
    end
  end

  describe "#getPDV" do
    let(:query_string) do
      File.read(Rails.root.join('spec', 'fixtures', 'graphql', 'query', 'get_pdv.graphql'))
    end

    let(:variables) { { id: id } }

    subject(:result) { execute["data"]["getPDV"] }

    context "when there's no a PDV" do
      let(:id) { 1 }
      it { is_expected.to be_nil }
    end

    context "when there's a PDV" do
      let(:store) { create(:store, :with_address_and_coverage) }
      let(:id) { store.id }

      its(['tradingName']) { is_expected.to eql(store.trading_name) }
      its(['ownerName']) { is_expected.to eql(store.owner_name) }
      its(['document']) { is_expected.to eql(store.document) }

      context 'for nested relationship' do
        context 'address' do
          subject { result['address'] }
          its(['type']) { is_expected.to eql(store.address.type) }
          its(['coordinates']) { is_expected.to eql(store.address.coordinates_to_a) }
        end

        context 'coverage_area' do
          subject { result['coverageArea'] }
          its(['type']) { is_expected.to eql(store.coverage_area.type) }
          its(['coordinates']) { is_expected.to eql(store.coverage_area.coordinates_to_a) }
        end
      end
    end
  end


  describe "#searchPDV" do
    let(:query_string) do
      File.read(Rails.root.join('spec', 'fixtures', 'graphql', 'query', 'search_pdv.graphql'))
    end

    let(:variables) { cood }

    subject(:result) { execute["data"]["searchPDV"] }

    context "when there's no a PDV" do
      let(:cood) { { lng: -45.8859658241272, lat: -23.180487428061262 } }
      before { create_stores }
      it { is_expected.to be_nil }
    end

    def create_stores
      stores = JSON.parse(
        File.read(Rails.root.join('spec', 'fixtures', 'store-sample.json'))
      )

      stores['pdvs'].each do |pdv|
          store = Store.new(
            trading_name: pdv['tradingName'],
            owner_name: pdv['ownerName'],
            document: pdv['document']
          )
          store.address = Address.new(
            coordinates: pdv['address']['coordinates']
          )
          store.coverage_area = CoverageArea.new(
            coordinates: pdv['coverageArea']['coordinates']
          )
          store.save
      end
    end

    context "when there's a PDV" do
      let(:cood) { { lng: -45.87882041931152, lat: -23.178919250974054 } }
      before { create_stores }
      let(:id) { store.id }

      it do
        expect(result.keys).to eq(['tradingName', 'ownerName', 'document', 'address', 'coverageArea'])
      end
    end
  end
end
