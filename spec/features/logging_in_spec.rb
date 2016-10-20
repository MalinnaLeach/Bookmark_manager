require 'spec_helper'

feature "logging in" do
  scenario 'user can log into their account' do
    visit ('/')
    fill_in "email", :with => "john@example.com"
    fill_in "password", :with => "12345"
    click_button "Sign up"
    expect(page).to have_content("john@example.com")
    expect(User.count).to eq 1
  end
end
