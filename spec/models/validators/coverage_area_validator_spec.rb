# frozen_string_literal: true

RSpec.describe Validators::CoverageAreaValidator, type: :validator do
  let(:geometry_validator) { spy(Geometry::Validator) }
  subject(:validator) { described_class.new(coverage_area, geometry_validator) }

  describe '#valid?' do
    subject(:valid?) { validator.valid? }
    context "when coverage area's coordinates" do
      context 'is invalid' do
        before do
          allow(geometry_validator).to receive(:multipolygon?) { false }
        end

        let(:coverage_area) { build(:coverage_area, coordinates: { foo: :bar }) }
        let(:error_message) {
          'must be a valid geometry MultiPolygon'
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

        it do
          subject
          expect(geometry_validator).to have_received(:multipolygon?).with(coverage_area.coordinates)
        end
      end

      context 'is valid' do
        before do
          allow(geometry_validator).to receive(:multipolygon?) { true }
        end
        let(:coverage_area) { build(:coverage_area, coordinates: [[[[-43.36556, -22.99669],[-43.36539, -23.01928]]]]) }
        it { is_expected.to be_truthy }

        it do
          subject
          expect(geometry_validator).to have_received(:multipolygon?).with(coverage_area.coordinates)
        end
      end
    end
  end
end
