# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @plans = current_user.plans
    @finished_plans = nil
    #@plans = Plan.current_plans_for(current_user)
    #@finished_plans = Plan.finished_plans_for(current_user)
  end
end
