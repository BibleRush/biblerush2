# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @owned_plans = current_user.owned_plans
    @plans = current_user.plans
  end
end
