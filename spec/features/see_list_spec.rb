require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

feature "Bookmarks" do
  scenario 'user can see list of links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    # fill_in "link", :with => "www.google.com"
    expect(page).to have_content "http://www.makersacademy.com"
  end
end
