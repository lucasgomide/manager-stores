require 'rails_helper'

RSpec.describe CoverageArea, type: :model do
  it { should belong_to(:store) }
  it { expect(described_class::GEOMETRY_TYPE).to be_eql('MultiPolygon') }
  it_behaves_like "geometry type model"
end
