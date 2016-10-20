def add_link
  visit '/links/new'
  fill_in "title", :with => "Google"
  fill_in "url", :with => "http://www.google.com"
  fill_in "tag", :with => "bubbles"
  click_button "Submit"
end

def add_another_link
  visit '/links/new'
  fill_in "title", :with => "Yahoo"
  fill_in "url", :with => "http://www.yahoo.com"
  fill_in "tag", :with => "search"
  click_button "Submit"
end

def add_link_multiple_tags
  visit '/links/new'
  fill_in "title", :with => "Google"
  fill_in "url", :with => "http://www.google.com"
  fill_in "tag", :with => "bubbles, search it up, useful"
  click_button "Submit"
end
