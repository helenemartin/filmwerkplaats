require 'spec_helper'

feature "Sign up" do
  scenario "when signing up" do
    
    visit '/'
    click_link 'Sign up'
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    click_button 'Sign up'

    visit '/'

    page.should have_content "Logged in as cat@miaw.cat"
    page.should have_content "Welcome! you have signed up successfully"

  end

end