require 'spec_helper'

feature "Adding multiple tags" do
  scenario 'user can multiple tags to a link' do
    add_link_multiple_tags
    link = Link.first
    expect(link.tags.map(&:tag_name)).to include('bubbles')
    expect(link.tags.map(&:tag_name)).to include('search it up')
    expect(link.tags.map(&:tag_name)).to include('useful')
  end
end
