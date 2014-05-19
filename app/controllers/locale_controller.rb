class LocaleController < ApplicationController

  def update
    session[:locale] = params[:locale]
    
    redirect_to root_path
  end
end
