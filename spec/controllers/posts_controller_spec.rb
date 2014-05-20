require 'spec_helper'

describe PostsController do

  let!(:post) {FactoryGirl.create(:post)}
  let(:user) {FactoryGirl.create(:user)}
  describe "Get 'post index'" do
    it "should be succesful" do
      get :index
      response.should be_success
    end
  end

  describe "Get 'post new'" do
    describe "When not logged in" do
      it "should redirect" do
        get :new
        response.should be_redirect
      end

    end

    it "should be successful" do
      sign_in user
      get :new
      response.should be_success
    end
  end

  describe "Get 'post edit'" do
    it "should be successful" do
      sign_in user
      get :edit, {:id => post.id}
      response.should be_success
    end
  end

  describe "Delete 'destroy post'" do
    before do
      sign_in user
    end
    it "should redirect" do
      delete :destroy, {:id => post.id}
      response.should be_redirect
    end
    it "should delete" do
      expect {
        delete :destroy, {:id => post.id}
      }.to change{Post.count}.from(1).to(0)
    end
  end
end
