require 'spec_helper'

feature "Adding tags" do
  scenario 'user can a tag to a link' do
    add_link
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('bubbles')
  end
end
