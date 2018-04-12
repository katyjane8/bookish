require 'rails_helper'

RSpec.feature "user logs in" do
  it "should let a user login to Goodreads" do
    login_as create(:user)
    visit root_path

    expect(page).to have_link("Sign in with Goodreads")

    click_link "Sign in with Goodreads"


    expect(page).to have_link("Logout")
  end
end
