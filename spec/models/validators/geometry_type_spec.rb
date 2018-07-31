# frozen_string_literal: true

RSpec.describe Validators::GeometryType do
  subject(:validator) { described_class }

  describe '#point?' do
    subject { validator.point?(geometry) }

    context 'when geometry' do
      context 'is not array' do
        let(:geometry) { nil }
        it { is_expected.to be_falsey }
      end

      context 'is array and first element is an array' do
        let(:geometry) { [['a']] }
        it { is_expected.to be_falsey }
      end

      context 'is array with two integer elements' do
        let(:geometry) { [1, 2] }
        it { is_expected.to be_truthy }
      end
    end
  end

  describe '#multipolygon?' do
    subject { validator.multipolygon?(geometry) }

    context 'is not array' do
      let(:geometry) { nil }
      it { is_expected.to be_falsey }
    end

    context 'is array with deep equal to 2' do
      let(:geometry) { [[[1, 2]]] }
      it { is_expected.to be_falsey }
    end

    context 'is array with deep equal to 4' do
      let(:geometry) { [[[[[1,2], [2,4], [3,1]]]]] }
      it { is_expected.to be_falsey }
    end

    context 'is array with deep equal to 3' do
      let(:geometry) { [[[[1, 2, 4, 5], [5,1,2]]]] }
      it { is_expected.to be_truthy }
    end
  end
end
