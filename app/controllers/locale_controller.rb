class LocaleController < ApplicationController

  def update
    session[:locale] = params[:locale]
    
    
    redirect_to post/index
  end
end
