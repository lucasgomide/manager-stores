require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should validate_presence_of(:document) }
  it { should validate_presence_of(:owner_name) }
  it { should validate_presence_of(:trading_name) }
  it { should validate_uniqueness_of(:document) }
  it { should have_one(:address) }
  it { should have_one(:coverage_area) }
end
