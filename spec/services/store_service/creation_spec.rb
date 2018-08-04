# frozen_string_literal: true
require 'rails_helper'
require 'recursive-open-struct'
RSpec.describe Services::StoreService::Creation do
  subject(:service) { described_class.new }

  describe '#call' do
    subject(:creation) { service.call(store) }
    let(:store) do
      RecursiveOpenStruct.new(
        attributes_for(
          :store,
          address: address ,
          coverage_area: coverage_area
        )
      )
    end

    context 'creation successful' do
      let(:address) { attributes_for(:address, store: nil) }
      let(:coverage_area) { attributes_for(:coverage_area, store: nil) }

      it { expect { creation }.to change { Store.count }.from(0).to(1) }
      it { expect { creation }.to change { Address.count }.from(0).to(1) }
      it { expect { creation }.to change { CoverageArea.count }.from(0).to(1) }

      it { is_expected.to be_kind_of(Store) }
      it { expect(creation.address).to be_kind_of(Address) }
      it { expect(creation.coverage_area).to be_kind_of(CoverageArea) }
    end

    context 'creation failed' do
      let(:address) { attributes_for(:address, :invalid, store: nil) }
      let(:coverage_area) { attributes_for(:coverage_area, :invalid, store: nil) }

      it 'should not create any resource' do
        expect { creation }.to raise_error do |error|
          expect(error).to be_kind_of(ActiveRecord::RecordInvalid)
          expect(Store.count).to be_zero
          expect(Address.count).to be_zero
          expect(CoverageArea.count).to be_zero
        end
      end
    end
  end
end
