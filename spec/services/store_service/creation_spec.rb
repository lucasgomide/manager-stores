# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Services::StoreService::Creation do
  subject(:service) { described_class.new }
  describe '#call' do
    subject(:creation) { service.call(store) }
    context 'creation successful' do
      let(:address) { build(:address, store: nil) }
      let(:coverage_area) { build(:coverage_area, store: nil) }
      let(:store) { build(:store, address: address, coverage_area: coverage_area) }

      it { expect { creation }.to change { Store.count }.from(0).to(1) }
      it { expect { creation }.to change { Address.count }.from(0).to(1) }
      it { expect { creation }.to change { CoverageArea.count }.from(0).to(1) }

      it { is_expected.to be_kind_of(Store) }
      it { expect(creation.address).to be_kind_of(Address) }
      it { expect(creation.coverage_area).to be_kind_of(CoverageArea) }
    end

    context 'creation failed' do
      let(:address) { build(:address, :invalid) }
      let(:coverage_area) { build(:coverage_area, store: nil) }
      let(:store) { build(:store, address: address, coverage_area: coverage_area) }
      it 'should not create any resource' do
        expect { creation }.to raise_error do |error|
          expect(Store.count).to be_zero
          expect(Address.count).to be_zero
          expect(CoverageArea.count).to be_zero
        end
      end
    end
  end
end
