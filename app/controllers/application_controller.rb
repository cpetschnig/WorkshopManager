class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_language

  def set_language
    I18n.locale = @language = (session[:language] || :de)
  end

end
