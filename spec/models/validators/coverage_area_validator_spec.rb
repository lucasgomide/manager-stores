# frozen_string_literal: true

RSpec.describe Validators::CoverageAreaValidator, type: :validator do
  subject(:validator) { described_class.new(coverage_area) }

  describe '#valid?' do
    subject { validator.valid? }
    context 'when address coordinates' do
      context 'is invalid' do
        let(:address) { build(:address, coordinates: { foo: :bar }) }
        let(:error_message) {
          'coordinates must be a valid geometry Multipolygon'
        }
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
        let(:coverage_area) { build(:coverage_area, coordinates: nil) }
        it { is_expected.to be_falsey }
      end

      context 'is not an array' do
        let(:coverage_area) { build(:coverage_area, coordinates: { foo: :bar }) }
        it { is_expected.to be_falsey }
      end

      context 'is an array and is not valid Geometry MultiPolygon' do
        let(:coverage_area) { build(:coverage_area, coordinates: [10, 40]) }
        it { is_expected.to be_falsey }
      end


      context 'is an array and is valid Geometry MultiPolygon' do
        let(:coverage_area) { build(:coverage_area, coordinates: [[[[-43.36556, -22.99669],[-43.36539, -23.01928]]]]) }
        it { is_expected.to be_truthy }
      end
    end
  end
end
