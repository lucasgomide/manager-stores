require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:store) }
  it { expect(described_class::GEOMETRY_TYPE).to be_eql('Point') }
  it_behaves_like "Geojsonable"
end
