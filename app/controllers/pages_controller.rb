# encoding: UTF-8

class PagesController < ApplicationController
  before_filter :check_logged_in

  def check_logged_in
    redirect_to dashboard_home_path if user_signed_in?
  end

  def pinger
    render :js => 'hi'
  end
end
