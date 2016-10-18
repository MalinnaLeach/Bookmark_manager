require 'spec_helper'

feature "Adding tags" do
  scenario 'user can a tag to a link' do
    add_link
    expect(page).to have_content "bubbles"
  end
end
