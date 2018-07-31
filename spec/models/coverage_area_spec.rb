# frozen_string_literal: true

RSpec.describe CoverageArea, type: :model do
  context 'invalid coordinates' do
    subject { build(:coverage_area, coordinates: [12, 10]) }
    it { expect(subject.valid?).to be_falsey }
    it do
      expect { subject.valid? }.to change { subject.errors.size }.from(0).to(1)
    end
  end

  context 'valid coordinates' do
    subject { build(:coverage_area, coordinates: [[[[10, 12]]]]) }
    it { expect(subject.valid?).to be_truthy }
    it do
      expect { subject.valid? }.to_not change { subject.errors.size }
    end
  end

  context 'save resource' do
    subject { build(:coverage_area) }

    it 'should encode coordinates' do
      subject.save
      expect(subject.coordinates).to be_a(String)
    end
  end
end
