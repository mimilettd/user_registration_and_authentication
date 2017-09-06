require 'rails_helper'

RSpec.feature "User logs in" do
  scenario "and can log out" do
    User.create(name: "Jake the Dog", email: "jake@adventuretime.com", password: "dog")

    visit login_path

    fill_in "Email", with: "jake@adventuretime.com"
    fill_in "Password", with: "dog"
    click_button "Log in"

    click_link "here"

    expect(current_path).to eq(login_path)
  end
end
