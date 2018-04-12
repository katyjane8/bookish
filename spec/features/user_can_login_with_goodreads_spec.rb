require 'rails_helper'

RSpec.feature "user logs in" do
  # scenario "using goodreads oauth" do
  #   stub_oauth
  #   visit root_path
  #
  #   expect(page).to have_link("Sign in with Goodreads")
  #
  #   click_link "Sign in with Goodreads"
  #   expect(page).to have_content("Katy Welyczko")
  #   expect(page).to have_link("Logout")
  # end
end

# def stub_oauth
#   OAuth.config.test_mode = true
#   OAuth.config.mock_auth[:goodreads] = OAuth::AuthHash.new({
#           provider: "goodreads",
#           uid: "1234567",
#           info: {
#             email: "katy.jane8@gmail.com",
#             first_name: "Katy",
#             last_name: "Welyczko"
#           },
#           credentials: {
#             token: "abcdefg12345",
#             refresh_token: "12345abcdefg",
#             expires_at: DateTime.now,
#           }
#     })
# end
