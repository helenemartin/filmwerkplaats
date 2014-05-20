require 'spec_helper'

describe LocaleController do

  describe "PUT 'locale update" do
    it "should redirect" do
      put :update, {:locale => 'pr'}
      response.should be_redirect
    end
  end


end
