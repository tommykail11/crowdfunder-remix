class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :nav_state

  protected

  def nav_state
  end
end
