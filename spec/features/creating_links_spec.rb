require 'spec_helper'

feature "Adding links" do
  scenario 'user can add links' do
    add_link
    expect(page).to have_content "http://www.google.com"
  end
end
