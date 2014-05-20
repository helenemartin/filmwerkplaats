require 'spec_helper'
 
feature "changing language" do

  scenario "when landing on home page"

    visit '/'

    page.should have_link "Language"
    page.should have_button "English"
    page.should have_button "French"

    click_button "French"

    visit '/'

    page.should have_content"Accueil, A Propos, Filmwerkplaats"


  end

    
end