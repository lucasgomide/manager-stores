# frozen_string_literal: true

RSpec.describe Store, type: :model do
  it { is_expected.to have_one_to_many(:coverage_areas) }
  it { is_expected.to have_one_to_many(:addresses) }
end
