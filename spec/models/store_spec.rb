# frozen_string_literal: true

RSpec.describe Store, type: :model do
  it { is_expected.to have_one_to_many(:coverage_areas) }
  it { is_expected.to have_one_to_many(:addresses) }
  it { is_expected.to validate_unique(:document) }
  it { is_expected.to validate_presence(:tranding_name) }
  it { is_expected.to validate_presence(:owner_name) }
  it { is_expected.to validate_presence(:document) }
end
