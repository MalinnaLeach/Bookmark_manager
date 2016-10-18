require 'spec_helper'

feature "Adding tags" do
  scenario 'user can a tag to a link' do
    visit '/links/new'
    fill_in "title", :with => "Google"
    fill_in "url", :with => "http://www.google.com"
    fill_in "tag", :with => "search"
    click_button "Submit"
    expect(page).to have_content "search"
  end
end
