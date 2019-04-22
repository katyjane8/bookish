require "rails_helper"

RSpec.feature "user logs in" do
  scenario "and sees sign in" do
    VCR.use_cassette("goodreads/find_user_data") do
      stub_oauth
      visit root_path

      expect(page).to have_link("Sign in with Goodreads")
    end
  end
end
