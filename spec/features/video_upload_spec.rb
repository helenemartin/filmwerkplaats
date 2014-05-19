require 'spec_helper'



feature "Video upload" do

  scenario "when logged in" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button 'Sign in'

    visit '/'
    click_link "New Post"

    fill_in :post_title, with: "Grotte"
    fill_in :post_tag_list, with: "123"
    fill_in :post_description, with: "text"
    fill_in :post_url, with: "https://vimeo.com/"
    attach_file :post_video, "#{Rails.root}/spec/fixtures/test_video.mp4"
    click_button "Create Post"

    page.should have_content "Grotte has been uploaded correctly" 
    page.should have_css "div.flowplayer video"
  end

end

