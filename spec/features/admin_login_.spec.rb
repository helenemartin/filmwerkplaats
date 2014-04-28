require 'spec_helper'
require 'devise'
require 'cancan'


feature " admin login" do
      scenario "signin for a new post" do
    visit '/post/new'
    fill_in :post_title, with: "Filmwerkplaats"
    select "2" from :post_type, with: "text"
    click_button "Create"

    visit '/Filmwerkplaats'

    page.should have_content "Filmwerkplaats"
  end


end