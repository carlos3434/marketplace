require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:category) }
  it { should belong_to(:user) }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:warantine_time) }
  it { should validate_presence_of(:strength) }
  it { should validate_presence_of(:flavor) }
  it { should validate_presence_of(:size) }
  
  it {
    should validate_length_of(:name)
      .is_at_least(3)
  }
end
