# frozen_string_literal: true
require 'rails_helper'
RSpec.describe Validators::AddressValidator, type: :validator do
  let(:geometry_validator) { spy(Geometry::Validator) }
  subject(:validator) { described_class.new(address, geometry_validator) }

  describe '#valid?' do
    subject(:valid?) { validator.valid? }
    context "when address' coordinates" do
      context 'is invalid' do
        before do
          allow(geometry_validator).to receive(:point?) { false }
        end

        let(:address) { build(:address, coordinates: nil) }

        let(:error_message) { 'must be a valid geometry Point' }
        it do
          valid?
          expect(validator.errors.count).to eql(1)
        end

        it do
          valid?
          expect(validator.errors.first).to eql(
            field: :coordinates,
            message: error_message
          )
        end

        it do
          subject
          expect(geometry_validator).to have_received(:point?).with(address.coordinates)
        end
      end

      context 'is valid' do
        before do
          allow(geometry_validator).to receive(:point?) { true }
        end
        let(:address) { build(:address, coordinates: [10, 40]) }
        it { is_expected.to be_truthy }

        it do
          subject
          expect(geometry_validator).to have_received(:point?).with(address.coordinates)
        end
      end
    end
  end
end
