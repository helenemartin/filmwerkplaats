require 'spec_helper'



feature " admin login" do

  scenario "logging in as an admin" do
    visit '/log_in'
    fill_in :password, with: "helene.martin@fundingcircle.com"
    click_button 'Sign In'

    visit '/Filmwerkplaats#log_in'

  end

  scenario "making for a new post" do
    visit 'dashboard/post#new'
    fill_in :post_title, with: "Filmwerkplaats"
    select "2", from: :post_type, with: "text"
    click_button "Create"

    visit '/Filmwerkplaats'

    page.should have_content "Filmwerkplaats/post_new"
  end


end

feature "user posting" do

  scenario " user login" do
    visit 'dashboard/user#new'
    fill_in :email, with: "helenemartin13@hotmail.com"
    fill_in :password, with: "bla"
    fill_in :password_confirmation, with: "bla"
    click_button "Log in"

    visit '/Filmwerkplaats#log_in'

    page.should have_content "Filmwerkplaats/post_new"

  end
end