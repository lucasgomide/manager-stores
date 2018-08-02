require 'rails_helper'

RSpec.describe CoverageArea, type: :model do
  it { should belong_to(:store) }
end
