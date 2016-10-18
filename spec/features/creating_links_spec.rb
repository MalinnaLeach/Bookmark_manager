require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

feature "Adding links" do
  scenario 'user can add links' do
    visit '/links/new'
    fill_in "title", :with => "Google"
    fill_in "url", :with => "http://www.google.com"
    click_button "Submit"
    expect(page).to have_content "http://www.google.com"
  end
end
