# frozen_string_literal: true

RSpec.describe Validators::AddressValidator, type: :validator do
  subject(:validator) { described_class.new(address) }

  describe '#valid?' do
    subject(:valid?) { validator.valid? }
    context 'when address coordinates' do
      context 'is invalid' do
        let(:address) { build(:address, coordinates: { foo: :bar }) }
        let(:error_message) { 'coordinates must be a valid geometry Point' }
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
      end

      context 'is nil' do
        let(:address) { build(:address, coordinates: nil) }
        it { is_expected.to be_falsey }
      end

      context 'is not an array' do
        let(:address) { build(:address, coordinates: { foo: :bar }) }
        it { is_expected.to be_falsey }
      end

      context 'is an array and is not valid Geometry Point' do
        let(:address) { build(:address, coordinates: [[[10, 40]]]) }
        it { is_expected.to be_falsey }
      end

      context 'is an array and is valid Geometry Point' do
        let(:address) { build(:address, coordinates: [10, 40]) }
        it { is_expected.to be_truthy }
      end
    end
  end
end
