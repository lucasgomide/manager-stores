require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should validate_presence_of(:document) }
  it { should validate_presence_of(:owner_name) }
  it { should validate_presence_of(:trading_name) }
  it { should validate_uniqueness_of(:document) }
  it { should have_one(:address) }
  it { should have_one(:coverage_area) }

  describe '#search_closest_by' do
    subject(:search_closest_by) do
      described_class.search_closest_by(
        coordinates[:lng],
        coordinates[:lat]
      )
    end

    before { create_stores }

    context "when there's no a POS" do
      let(:coordinates) { { lng: -45.8859658241272, lat: -23.180487428061262 } }
      it { is_expected.to be_empty }
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

    context "when there's a POS" do
      let(:coordinates) { { lng: -45.89032173156738, lat: -23.17630558165721 } }

      it do
        expect(subject.map(&:id)).to be_eql([3, 2])
      end

      it do
        point = 'POINT (-45.890021324157715 -23.17449077746455)'
        expect(subject.first.address.coordinates.to_s).to be_eql(point)
      end
    end
  end
end
