class LanguageController < ApplicationController
  def set
    session[:language] = params[:new_language].to_sym
    redirect_to :back
  end
end
