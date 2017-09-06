require 'rails_helper'

RSpec.feature "User visits login page" do
  scenario "and user can login with valid email and password combination" do
    User.create(name: "Jake the Dog", email: "jake@adventuretime.com", password: "dog")

    visit login_path

    fill_in "Email", with: "jake@adventuretime.com"
    fill_in "Password", with: "dog"
    click_button "Log in"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Hello, #{User.last.name}!")
  end
end
