# frozen_string_literal: true

RSpec.describe Address, type: :model do
  context 'invalid coordinates' do
    subject { build(:address, coordinates: [[12]]) }
    it { expect(subject.valid?).to be_falsey }
    it do
      expect { subject.valid? }.to change { subject.errors.size }.from(0).to(1)
    end
  end

  context 'valid coordinates' do
    subject { build(:address, coordinates: [12, 10]) }
    it { expect(subject.valid?).to be_truthy }
    it do
      expect { subject.valid? }.to_not change { subject.errors.size }
    end
  end

  context 'save resource' do
    subject { build(:address) }

    it 'should encode coordinates' do
      subject.save
      expect(subject.coordinates).to be_a(String)
    end
  end
end
