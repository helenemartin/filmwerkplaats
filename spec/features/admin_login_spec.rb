require 'spec_helper'



feature " admin login" do

  scenario "logging in as an admin" do
    visit '/log_in'
    fill_in :password, with: "helene.martin@fundingcircle.com"
    click_button 'Sign In'

    visit '/Filmwerkplaats/log_in'

  end

      scenario "making for a new post" do
    visit '/post/new'
    fill_in :post_title, with: "Filmwerkplaats"
    select "2", from: :post_type, with: "text"
    click_button "Create"

    visit '/Filmwerkplaats'

    page.should have_content "Filmwerkplaats/post_new"
  end


end