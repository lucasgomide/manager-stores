require 'rails_helper'

RSpec.shared_examples "geometry type model" do
  let(:model_sym) { "#{described_class}".underscore.to_sym }
  let(:factory) { build(model_sym) }

  describe '#before_save' do
    it do
      expect { factory.save! }.to change { factory.coordinates }
    end
  end

  describe '#validate_geometry_object' do
    context 'valid object' do
      let(:factory) { build(model_sym) }
      it do
        expect { factory.save! }.to_not change { factory.errors.count }
      end
    end

    context 'invalid object' do
      let(:factory) { build(model_sym, :invalid) }
      it do
        expect { factory.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
