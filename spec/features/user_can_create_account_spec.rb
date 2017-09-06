require 'rails_helper'

RSpec.feature "User visits user#new" do
  scenario "user can create account an account" do
    visit new_user_path

    fill_in "Name", with: "Jake the Dog"
    fill_in "Email", with: "jake@adventuretime.com"
    fill_in "Password", with: "dog"
    click_button "Create Account"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Account successfully created!")
  end
  scenario "user does not input a name" do
    visit new_user_path

    fill_in "Email", with: "jake@adventuretime.com"
    fill_in "Password", with: "dog"
    click_button "Create Account"

    expect(page).to have_content("Name can't be blank")
  end
  scenario "user does not input an email" do
    visit new_user_path

    fill_in "Name", with: "Jake the Dog"
    fill_in "Password", with: "dog"
    click_button "Create Account"

    expect(page).to have_content("Email can't be blank")
  end
  scenario "user does not input a password" do
    visit new_user_path

    fill_in "Name", with: "Jake the Dog"
    fill_in "Email", with: "jake@adventuretime.com"
    click_button "Create Account"

    expect(page).to have_content("Password can't be blank")
  end
  scenario "user inputs an existing email address" do
    User.create(name: "Jake the Dog", email: "jake@adventuretime.com", password: "dog")

    visit new_user_path

    fill_in "Name", with: "Lumpy Space Princess"
    fill_in "Email", with: "jake@adventuretime.com"
    fill_in "Password", with: "lumpy"
    click_button "Create Account"

    expect(page).to have_content("Email has already been taken")
  end
end
