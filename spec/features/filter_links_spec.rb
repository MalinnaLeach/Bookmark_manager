require 'spec_helper'

feature "filter links" do
  scenario 'user can filter links' do
    add_another_link
    add_link
    visit '/tags/bubbles'
    expect(page).to have_content "http://www.google.com"
    expect(page).not_to have_content "http://www.yahoo.com"
  end

end
