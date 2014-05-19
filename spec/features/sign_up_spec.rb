require 'spec_helper'

feature "Sign up" do

  scenario "when user Sign up" do
    
    visit '/'
    click_link 'Sign up'
    fill_in :user_email, with: 'cat@miaw.cat'
    fill_in :user_password, with: 'miaoumiaou'
    fill_in :user_password_confirmation, with: 'miaoumiaou'
    click_button 'Sign up'

    page.should have_content "Logged in as cat@miaw.cat"
    page.should have_content "Welcome! You have signed up successfully"

  end

end