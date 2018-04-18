require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:isbns) }
  it { should belong_to(:user) }
end
