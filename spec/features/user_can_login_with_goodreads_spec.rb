require "rails_helper"

RSpec.feature "user logs in" do
  let(:client) { OAuth.new }
  xit "should let a user login to Goodreads" do
    VCR.use_cassette("goodreads/find_user_for") do
      user = client.find_user_for("katyjane8")
      expect(user.class).to eq(Goodreads::User)
      expect(user.username).to eq("katyjane")

      visit root_path

      expect(page).to have_link("Sign in with Goodreads")

      click_link "Sign in with Goodreads"

      expect(page).to have_link("Logout")
    end
  end
end
