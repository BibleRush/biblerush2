# encoding: UTF-8

class DashboardController < ApplicationController
  def home
    @plan_templates = PlanTemplate.all
    @plans = Plan.order('created_at DESC')
  end
end
