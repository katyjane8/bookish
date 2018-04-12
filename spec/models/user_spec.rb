require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    params = {
      "id" => 1,
      "oauth_token" => "lksj093475sjf"
    }

    User.update_or_create(params)
    new_user = User.first

    expect(new_user.id).to eq(1)
    expect(new_user.oauth_token).to eq("lksj093475sjf")
  end
end
